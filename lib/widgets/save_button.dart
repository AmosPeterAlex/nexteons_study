import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/constants/color_constants.dart';

class SaveButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final VoidCallback? onPressed;

  SaveButton({super.key, this.onPressed, this.buttonText, this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        "Save & Proceed",
        style: TextStyle(color: Colors.white),
      ),
      color: ColorConstants.saveButtonColor,shape: StadiumBorder(),
    );
  }
}
