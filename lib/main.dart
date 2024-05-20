import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/screens/iPhone/iPhone_view.dart';
import 'package:nexteons_internship_task/screens/macBook/mac_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: IPhoneView(),
    );
  }
}
