import 'package:firebase_auth_config/features/auth/domain/app_user.dart';
import 'package:firebase_auth_config/features/auth/repo/auth_repo.dart';
import 'package:firebase_auth_config/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final AuthRepo authRepo;
  final void Function()? onPressed;

  const LoginPage({super.key, required this.authRepo, required this.onPressed});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  AppUser? currentUser;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text("Email")
                      ],
                    ),
                    
                    TextFormField(
                      controller: emailController,
                    )
                  ],
                ),
                    
                const SizedBox(height: 10,),
                    
                Column(
                  children: [
                    Row(
                      children: [
                        Text("Password")
                      ],
                    ),
                    
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                    )
                  ],
                ),
                    
                const SizedBox(height: 15,),
                    
                ElevatedButton(
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;

                    if(email.isNotEmpty && password.isNotEmpty) {
                      currentUser = widget.authRepo.loginWithEmailPassword(email, password) as AppUser?;

                      if(currentUser != null) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(user: currentUser!)));
                      }

                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter both email and password")));
                    }
                  },
                  child: Text("Login")
                ),

                const SizedBox(height: 15,),

                Row(
                  children: [
                    Text("Don't have an account? "),
                    TextButton(
                      onPressed: widget.onPressed,
                      
                      child: Text("Sign up")
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}