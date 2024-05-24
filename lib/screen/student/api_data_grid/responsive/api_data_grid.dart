import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/screen/student/api_data_grid/controller/api_data_grid_controller.dart';

class ApiDataGridMac extends StatelessWidget {
  final ApiDataGridController controller;
  const ApiDataGridMac({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: controller.onApiGridDataGet,
          child: Text("material button"),
        ),
      ),
    );
  }
}
