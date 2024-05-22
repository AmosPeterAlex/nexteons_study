import 'package:flutter/material.dart';

class LTextFields extends StatelessWidget {
  final String title;
  final String? hintText;

  const LTextFields({super.key, required this.title, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Text(title))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
