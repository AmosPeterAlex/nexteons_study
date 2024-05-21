import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/screen/student/create/view.dart';
import 'package:nexteons_internship_task/utils/constants/app_constants.dart';

import 'model/model.dart';

RxList<Student> students = [
  Student(
      firstname: "Amos",
      secondName: "Peter",
      email: "amos@gmail.com",
      id: 123654,
      district: "Kollam",
      phoneNumber: 987654321,
      pincode: 2244557,
      country: "India")
].obs;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: CreateStudent(),
    );
  }
}
