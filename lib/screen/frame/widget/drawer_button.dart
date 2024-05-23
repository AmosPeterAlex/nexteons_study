import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/utils/constants/color_constants.dart';

class DrawerButtonWidget extends StatelessWidget {
  const DrawerButtonWidget({super.key, this.onPress, required this.title});
  final void Function()? onPress;
  final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Text(title),
      color: ColorConstants.textFieldFillColor,
    );
  }
}
