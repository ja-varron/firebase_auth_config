import 'package:firebase_auth_config/features/auth/pages/auth_page.dart';
import 'package:firebase_auth_config/firebase/auth/firebase_auth_repo.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  final authRepo = FirebaseAuthRepo();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Firebase Auth Configuration",
      home: AuthPage(authRepo: authRepo),
    );
  }
}