import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moval/auth_gate/forgot_pwd.dart';
import 'package:moval/auth_gate/services.dart';
import 'package:moval/utils/navigation.dart';

import '../home_screen/home_screen.dart';
import 'sign_up.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  late String _email, _password;
  bool hidePassword = true,
      signInBtnLoading = false,
      googleSignInLoading = false;

  InputBorder textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 400.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: CircleAvatar(
                        radius: 64,
                        backgroundColor: Colors.white,
                        child: Image.asset("assets/logo.png"),
                      ),
                    ),
                    const Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.bold),
                    ),
                    Text.rich(TextSpan(
                        text: "Don't have an account? ",
                        children: <TextSpan>[
                          TextSpan(
                              text: "Sign Up",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  replacePage(
                                      context: context,
                                      page: const SignUpPage());
                                },
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor))
                        ])),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_circle_outlined),
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
                      onChanged: (value) {
                        _email = value;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        label: const Text("Password"),
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            tooltip: hidePassword
                                ? "Show password"
                                : "Hide password",
                            icon: Icon(hidePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined)),
                        enabledBorder: textFieldBorder,
                        focusedBorder: textFieldBorder,
                        errorBorder: textFieldBorder,
                        focusedErrorBorder: textFieldBorder,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password required';
                        }
                        return null;
                      },
                      onChanged: (value) async {
                        _password = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            nextPage(context: context, page: const ForgotPwd());
                          },
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () async {
                              if (_key.currentState!.validate()) {
                                setState(() {
                                  signInBtnLoading = true;
                                });
                                try {
                                  print(
                                      "----------------START SIGN IN-----------------");
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: _email, password: _password);
                                } on FirebaseAuthException catch (e) {
                                  setState(() {
                                    signInBtnLoading = false;
                                  });
                                  late String message;

                                  if (e.code == "invalid-email") {
                                    message = "Invalid email.";
                                  } else if (e.code == "user-disabled") {
                                    message =
                                        "The provided email address has been disabled.";
                                  } else if (e.code == "user-not-found") {
                                    message =
                                        "There is no user corresponding to the given email.";
                                  } else if (e.code == "wrong-password") {
                                    message = "Invalid password.";
                                  } else {
                                    message = "An error occurred.";
                                  }

                                  showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return AlertDialog(
                                          content: Text(message),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(ctx);
                                                },
                                                child: const Text("Okay"))
                                          ],
                                        );
                                      });
                                }

                                if (FirebaseAuth.instance.currentUser != null) {
                                  // signed in
                                  replacePage(
                                      context: context,
                                      page: const HomeScreen(
                                        title: 'Moval',
                                      ));
                                }
                              }
                            },
                            child: signInBtnLoading
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                : Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ))),
                    const SizedBox(height: 30.0),
                    GoogleSignInButton(
                      onTap: () {
                        setState(() {
                          googleSignInLoading = true;
                        });
                        AuthService().signInWithGoogle();
                      },
                      isLoading: googleSignInLoading,
                      loadingIndicator: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                      clientId: "PRIVATE",
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
