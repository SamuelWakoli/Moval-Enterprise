import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moval/home_screen/home_screen.dart';

import 'sign_in.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // if user signed in, return home screen
          if (snapshot.hasData) {
            return const HomeScreen(title: "Moval");
          } else {
            return const SignInPage();
          }
        },
      ),
    );
  }
}
