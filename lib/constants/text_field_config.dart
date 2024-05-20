import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String? addValidation(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return null;
}

String? nameValidation(String? value) {
  if (value == null || value.length < 3) {
    return 'Min 3 letter required';
  }
  return null;
}

String? emailValidation(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }

  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  if (!emailRegex.hasMatch(value)) {
    return 'Type a valid email';
  }
  return null;
}

String? idValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'User Id is required';
  }
  return null;
}

final List<Map<String, dynamic>> allTextFields = [
  {
    "title": "First Name",
    "controller": TextEditingController(),
    "validation": nameValidation,
    "input_format": null,
    "keyboard_type": null
  },
  {
    "title": "Last Name",
    "controller": TextEditingController(),
    "validation": addValidation,
    "input_format": null,
    "keyboard_type": null
  },
  {
    "title": "Email Address",
    "controller": TextEditingController(),
    "validation": emailValidation,
    "input_format": null,
    "keyboard_type": null
  },
  {
    "title": "User ID",
    "controller": TextEditingController(),
    "validation": idValidation,
    "input_format": null,
    "keyboard_type": null
  },
  {
    "title": "District",
    "controller": TextEditingController(),
    "validation": addValidation,
    "input_format": null,
    "keyboard_type": null
  },
  {
    "title": "Phone No",
    "controller": TextEditingController(),
    "validation": addValidation,
    "input_format": [FilteringTextInputFormatter.digitsOnly],
    "keyboard_type": TextInputType.number
  },
  {
    "title": "Pincode",
    "controller": TextEditingController(),
    "validation": addValidation,
    "input_format": [FilteringTextInputFormatter.digitsOnly],
    "keyboard_type": TextInputType.number
  },
  {
    "title": "Country",
    "controller": TextEditingController(),
    "validation": addValidation,
    "input_format": null,
    "keyboard_type": null
  },
];
