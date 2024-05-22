import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/utils/constants/color_constants.dart';


class IPadFrame extends StatelessWidget {
  const IPadFrame({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 240,
      color:ColorConstants.primaryColor,
      padding: const EdgeInsets.only(top: 63, right: 35, left: 35),
      child: Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            "assets/images/nexteons_logo.png",
          )),
    );
  }
}