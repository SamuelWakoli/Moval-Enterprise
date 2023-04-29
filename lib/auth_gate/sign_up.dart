import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moval/auth_gate/services.dart';
import 'package:moval/home_screen/home_screen.dart';
import 'package:moval/utils/navigation.dart';

import 'sign_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  late String _email, _password, _password2;
  bool hidePassword = true,
      hidePassword2 = true,
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
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CircleAvatar(
                        radius: 64,
                        backgroundColor: Colors.white,
                        child: Image.asset("assets/logo.png"),
                      ),
                    ),
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.bold),
                    ),
                    Text.rich(TextSpan(
                        text: "Already have an account? ",
                        children: <TextSpan>[
                          TextSpan(
                              text: "Sign In",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  replacePage(
                                      context: context,
                                      page: const SignInPage());
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
                      textInputAction: TextInputAction.next,
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
                    const SizedBox(height: 12),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: hidePassword2,
                      decoration: InputDecoration(
                        label: const Text("Confirm Password"),
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword2 = !hidePassword2;
                              });
                            },
                            tooltip: hidePassword2
                                ? "Show password"
                                : "Hide password",
                            icon: Icon(hidePassword2
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
                      onFieldSubmitted: (value) async {
                        if (_password2.length < 6) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Your password should not be less than 6 characters")));
                        }
                      },
                      onChanged: (value) async {
                        _password2 = value;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () async {
                              if (_password.length < 6) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Password is less than 6 characters")));
                              } else {
                                if (_key.currentState!.validate()) {
                                  if (_password == _password2) {
                                    setState(() {
                                      signInBtnLoading = true;
                                    });
                                    try {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: _email,
                                              password: _password)
                                          .whenComplete(() {
                                        setState(() {
                                          signInBtnLoading = false;
                                        });
                                        if (FirebaseAuth.instance.currentUser !=
                                            null) {
                                          replacePage(
                                              context: context,
                                              page: const HomeScreen(
                                                  title: "Moval"));
                                        }
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      setState(() {
                                        signInBtnLoading = false;
                                      });
                                      late String message;

                                      if (e.code == "invalid-email") {
                                        message = "Invalid email.";
                                      } else if (e.code ==
                                          "email-already-in-use") {
                                        message =
                                            "There already exists an account with the given email address.";
                                      } else if (e.code ==
                                          "operation-not-allowed") {
                                        message =
                                            "email/password accounts are not enabled.";
                                      } else if (e.code == "weak-password") {
                                        message =
                                            "Please use a strong password.";
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
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Password does not match")));
                                  }
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
                                    "Sign Up",
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
                      label: "Sign up with Google",
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
