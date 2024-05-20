import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/controller/controller.dart';


class ResultPage extends StatelessWidget {
  final DetailController controller = Get.find<DetailController>();

  ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text('First Name: ${controller.firstName.value}', style: TextStyle(fontSize: 18))),
            SizedBox(height: 8),
            Obx(() => Text('Last Name: ${controller.lastName.value}', style: TextStyle(fontSize: 18))),
            SizedBox(height: 8),
            Obx(() => Text('Email: ${controller.email.value}', style: TextStyle(fontSize: 18))),
            SizedBox(height: 8),
            Obx(() => Text('User ID: ${controller.userId.value}', style: TextStyle(fontSize: 18))),
            SizedBox(height: 8),
            Obx(() => Text('District: ${controller.district.value}', style: TextStyle(fontSize: 18))),
            SizedBox(height: 8),
            Obx(() => Text('Phone No: ${controller.phoneNo.value}', style: TextStyle(fontSize: 18))),
            SizedBox(height: 8),
            Obx(() => Text('Pincode: ${controller.pinCode.value}', style: TextStyle(fontSize: 18))),
            SizedBox(height: 8),
            Obx(() => Text('Country: ${controller.country.value}', style: TextStyle(fontSize: 18))),
          ],
        ),
      ),
    );
  }
}
