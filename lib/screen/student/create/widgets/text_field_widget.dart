import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexteons_internship_task/utils/constants/color_constants.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validation;
  final TextInputType? keyBoardType;
  final List<TextInputFormatter>? inputFormatters;

  TextFieldWidget(
      {super.key, this.controller, this.validation, this.keyBoardType, this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validation,
      keyboardType: keyBoardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
          fillColor: ColorConstants.textFieldFillColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none)),
    );
  }
}
