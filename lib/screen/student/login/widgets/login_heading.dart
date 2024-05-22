import 'package:flutter/material.dart';

class LoginHeading extends StatelessWidget {
  const LoginHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome back!",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text("Login your account", textAlign: TextAlign.left)
        ],
      ),
    );
  }
}
