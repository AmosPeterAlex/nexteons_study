import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/responsive_layout_builder.dart';
import 'package:nexteons_internship_task/screens/iPad/iPad_view.dart';
import 'package:nexteons_internship_task/screens/iPhone/iPhone_view.dart';
import 'package:nexteons_internship_task/screens/macBook/mac_view.dart';
import 'package:nexteons_internship_task/screens/macBook/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResultPage(),
      // home: ResponsiveLayoutBuilder(
      //     macView: MacView(), iPhoneView: IPhoneView(), iPadView: IPadView()),
    );
  }
}
