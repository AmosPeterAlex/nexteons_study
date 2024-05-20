

  import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/model.dart';

class DetailController extends GetxController {
  var students = <Student>[].obs; // Observable list of students

  // Observable fields for form data
  var firstName = ''.obs;
  var lastName = ''.obs;
  var email = ''.obs;
  var userId = 0.obs;
  var district = ''.obs;
  var phoneNo = ''.obs;
  var pinCode = 0.obs;
  var country = ''.obs;

  // Method to add a student
  void addStudent({
  required String fname,
  required String lname,
  required String mail,
  required int id,
  required String dist,
  required String phone,
  required int pin,
  required String country,
  }) {
  final student = Student(
  firstname: fname,
  lastname: lname,
  email: mail,
  id: id,
  district: dist,
  phoneNumber: int.parse(phone), // Assuming phone number is stored as an integer
  pincode: pin,
  country: country,
  );

  // Add the new student to the list
  students.add(student);

  // Update observable fields
  firstName.value = fname;
  lastName.value = lname;
  email.value = mail;
  userId.value = id;
  district.value = dist;
  phoneNo.value =
  int.parse(phone) as String;
  pinCode.value = pin;
  this.country.value = country;
  }
  }

  // Observable fields for form data
  var firstName = ''.obs;
  var lastName = ''.obs;
  var email = ''.obs;
  var userId = 0.obs;
  var district = ''.obs;
  var phoneNo = ''.obs;
  var pinCode = 0.obs;
  var country = ''.obs;

  // Method to add a student
  void addStudent({
    required String fname,
    required String lname,
    required String mail,
    required int id,
    required String dist,
    required String phone,
    required int pin,
    required String country,
  }) {
    final student = Student(
      firstname: fname,
      lastname: lname,
      email: mail,
      id: id,
      district: dist,
      phoneNumber: int.parse(phone), // Assuming phone number is stored as an integer
      pincode: pin,
      country: country,
    );

    // Add the new student to the list
    students.add(student);

    // Update observable fields
    firstName.value = fname;
    lastName.value = lname;
    email.value = mail;
    userId.value = id;
    district.value = dist;
    phoneNo.value = int.parse(phone) as String;
    pinCode.value = pin;
    country.value = country;
  }
}

/*
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
  var firstName = ''.obs;
  var lastName = ''.obs;
  var email = ''.obs;
  var userId = 0.obs;
  var district = ''.obs;
  var phoneNo = 0.obs;
  var pinCode = 0.obs;
  var country = ''.obs;

  void addStudent({
    required String fname,
    required String lname,
    required String mail,
    required int id,
    required String dist,
    required String phone,
    required int pin,
    required String country,
  }) {
    firstName.value = fname;
    lastName.value = lname;
    email.value = mail;
    userId.value = id;
    district.value = dist;
    phoneNo.value = phone;
    pinCode.value = pin;
    country.value = country;
  }
}
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
  //       lastname: secondName,
  //       email: mail,
  //       id: userId,
  //       district: dist,
  //       phoneNumber: phone,
  //       pincode: pin,
  //       country: country));
  // }
}


 */