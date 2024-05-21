import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/constants/app_constants.dart';
import 'package:nexteons_internship_task/screen/student/list/result.dart';

import '../../../../constants/text_field_config.dart';
import '../../../../main.dart';
import '../../../../model/model.dart';

class DetailController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController secondNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController userIdController = TextEditingController();

  final TextEditingController districtController = TextEditingController();

  final TextEditingController phoneNoController = TextEditingController();

  final TextEditingController pinCodeController = TextEditingController();

  final TextEditingController countryController = TextEditingController();

  // void addStudent(BuildContext context,
  //     {required String firstName,
  //       required String secondName,
  //       required String mail,
  //       required int userId,
  //       required String dist,
  //       required int phone,
  //       required int pin,
  //       required String country}) {
  //   students.add(Student(
  //       firstname: firstName,
  //       secondName: secondName,
  //       email: mail,
  //       id: userId,
  //       district: dist,
  //       phoneNumber: phone,
  //       pincode: pin,
  //       country: country));
  // }

  void addStudent() {
    if (formKey.currentState!.validate()) {
      students.add(Student(
          firstname: firstNameController.text,
          secondName: firstNameController.text,
          email: firstNameController.text,
          id: int.parse(userIdController.text),
          district: districtController.text,
          phoneNumber: int.parse(phoneNoController.text),
          pincode: int.parse(pinCodeController.text),
          country: countryController.text));
      Get.to(ResultPage());
      print("validate working");
      log("${firstNameController.toString()}");
    } else {
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(const SnackBar(
        content: Text("Failed"),
        backgroundColor: Colors.red,
      ));
    }
  }

  void clearDetails() {
    firstNameController.clear();
    secondNameController.clear();
    emailController.clear();
    userIdController.clear();
    districtController.clear();
    pinCodeController.clear();
    phoneNoController.clear();
    countryController.clear();
  }
}
