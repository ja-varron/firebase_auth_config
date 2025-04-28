import 'package:firebase_auth_config/features/auth/pages/login_page.dart';
import 'package:firebase_auth_config/features/auth/pages/signup_page.dart';
import 'package:firebase_auth_config/features/auth/repo/auth_repo.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  final AuthRepo authRepo;

  const AuthPage({super.key, required this.authRepo});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLoginPage ? LoginPage(authRepo: widget.authRepo, onPressed: togglePages) 
        : SignupPage(authRepo: widget.authRepo, onPressed: togglePages);
  }
}