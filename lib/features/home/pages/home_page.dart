import 'package:firebase_auth_config/features/auth/domain/app_user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final AppUser user;

  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(widget.user.name),
              ),

              const SizedBox(height: 15,),

              Center(
                child: Text(widget.user.email),
              )
            ],
          ),
        )
      ),
    );
  }
}