import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/screen/student/api_data_grid/controller/api_data_grid_controller.dart';

class DataAlertBox extends StatelessWidget {
  final ApiDataGridController controller;

  const DataAlertBox(
      {super.key,
      required this.controller,
      this.id,
      this.name,
      this.rate,
      required this.onPressed});

  final String? id;
  final String? name;
  final String? rate;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    if (id != null) {
      log("=======================================data$name $rate $id");
      controller.nameController = TextEditingController(text: name);
      controller.rateController = TextEditingController(text: rate);
    } else {
      controller.nameController = TextEditingController();
      controller.rateController = TextEditingController();
    }
    return AlertDialog(
      title: Center(
        child: Text("Add data"),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller.nameController,
            decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller.rateController,
            decoration: InputDecoration(
                hintText: "Rate",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          )
        ],
      ),
      actions: [
        MaterialButton(
          onPressed: onPressed,
          child: Text("Save"),
        ),
        SizedBox(
          width: 5,
        ),
        MaterialButton(
          onPressed: () {
            controller.nameController.clear();
            controller.rateController.clear();
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
        )
      ],
    );
  }
}
