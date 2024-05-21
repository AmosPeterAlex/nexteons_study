import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/utils/constants/color_constants.dart';

class MacFrame extends StatelessWidget {
  const MacFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 324,
      color: ColorConstants.primaryColor,
      padding: const EdgeInsets.only(top: 74, right: 54, left: 54),
      child: Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            "assets/images/nexteons_logo.png",
          )),
    );;
  }
}
