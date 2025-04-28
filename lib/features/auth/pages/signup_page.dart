import 'package:firebase_auth_config/features/auth/repo/auth_repo.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  final AuthRepo authRepo;
  final void Function()? onPressed;

  const SignupPage({super.key, required this.authRepo, required this.onPressed});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void register() {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if(name.isNotEmpty && email.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty) {
      if(password == confirmPassword) {
        widget.authRepo.signUpWithEmailPassword(email, password, name);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords not match")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please complete all fields.")));
    }
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
                textFieldWithLabel(nameController, "Name", false),
            
                const SizedBox(height: 10,),
            
                textFieldWithLabel(emailController, "Email", false),
            
                const SizedBox(height: 10,),
            
                textFieldWithLabel(passwordController, "Password", true),
            
                const SizedBox(height: 10,),
            
                textFieldWithLabel(confirmPasswordController, "Confirm password", true),
            
                const SizedBox(height: 15,),
            
                ElevatedButton(
                  onPressed: register,
                  child: Text("Sign up")
                ),
            
                const SizedBox(height: 15,),
            
                Row(
                  children: [
                    Text("Already sign up? "),
                    TextButton(
                      onPressed: widget.onPressed, 
                      child: Text("Sign in")
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget textFieldWithLabel(TextEditingController controller, String textFieldName, bool obscureText) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                Text(textFieldName)
              ],
            ),

            TextFormField(
              controller: controller,
              obscureText: obscureText,
            )
          ],
        )
      ],
    );
  }
}