import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/model.dart';

class DetailController extends GetxController {
  List<Student> students = [
    Student(
        firstname: "Amos",
        lastname: "Peter",
        email: "amos@gmail.com",
        id: 123654,
        district: "Kollam",
        phoneNumber: 987654321,
        pincode: 2244557,
        country: "India")
  ];

  void addStudent(BuildContext context,
      {required String firstName,
        required String secondName,
        required String mail,
        required int userId,
        required String dist,
        required int phone,
        required int pin,
        required String country}) {
    students.add(Student(
        firstname: firstName,
        lastname: secondName,
        email: mail,
        id: userId,
        district: dist,
        phoneNumber: phone,
        pincode: pin,
        country: country));
  }
}
