import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moval/firebase_options.dart';

import 'auth_gate/auth_gate.dart';

/// started on 23Apr 18:38 2023
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green,
        useMaterial3: true,
      ),
      home: const AuthGate(),
      // home: const HomeScreen(title: 'Moval'),
    );
  }
}
