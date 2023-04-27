import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPwd extends StatefulWidget {
  const ForgotPwd({Key? key}) : super(key: key);

  @override
  State<ForgotPwd> createState() => _ForgotPwdState();
}

class _ForgotPwdState extends State<ForgotPwd> {
  String? _email;
  bool loading = false;

  InputBorder textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      label: const Text("Email"),
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      enabledBorder: textFieldBorder,
                      focusedBorder: textFieldBorder,
                      errorBorder: textFieldBorder,
                      focusedErrorBorder: textFieldBorder,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email required';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      _email = value;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () async {
                            if (_email != null) {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                        title: const Text("Password Reset"),
                                        content: Text(
                                            "A password reset email will be send "
                                            "to $_email containing a link for "
                                            "the reset. Do you want to proceed?"),
                                        actions: [
                                          TextButton(
                                              onPressed: () async {
                                                Navigator.pop(ctx);
                                                setState(() {
                                                  loading = true;
                                                });

                                                try {
                                                  await FirebaseAuth.instance
                                                      .sendPasswordResetEmail(
                                                          email: _email!)
                                                      .whenComplete(() =>
                                                          Navigator.pop(
                                                              context));
                                                } on FirebaseAuthException catch (e) {
                                                  setState(() {
                                                    loading = false;
                                                  });
                                                  late String message;

                                                  if (e.code ==
                                                      "invalid-email") {
                                                    message = "Invalid email.";
                                                  } else if (e.code ==
                                                      "auth/invalid-email") {
                                                    message = "Invalid email.";
                                                  } else if (e.code ==
                                                      "user-not-found") {
                                                    message =
                                                        "There is no user corresponding to the given email.";
                                                  } else if (e.code ==
                                                      "auth/user-not-found") {
                                                    message =
                                                        "There is no user corresponding to the given email.";
                                                  } else {
                                                    message =
                                                        "An error occurred.";
                                                  }

                                                  showDialog(
                                                      context: context,
                                                      builder: (ctx) {
                                                        return AlertDialog(
                                                          content:
                                                              Text(message),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      ctx);
                                                                },
                                                                child:
                                                                    const Text(
                                                                        "Okay"))
                                                          ],
                                                        );
                                                      });
                                                }
                                              },
                                              child: const Text("Okay")),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(ctx);
                                              },
                                              child: const Text("Cancel")),
                                        ],
                                      ));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Enter your email")));
                            }
                          },
                          child: loading
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              : Text(
                                  "Reset password",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ))),
                ],
              ),
            )),
      ),
    );
  }
}
