import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexteons_internship_task/constants/color_constants.dart';
import 'package:nexteons_internship_task/widgets/save_button.dart';
import 'package:nexteons_internship_task/widgets/text_field_widget.dart';

class IPhoneView extends StatefulWidget {
  IPhoneView({
    super.key,
  });

  @override
  State<IPhoneView> createState() => _IPhoneViewState();
}

class _IPhoneViewState extends State<IPhoneView> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController secondNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController userIdController = TextEditingController();

  final TextEditingController districtController = TextEditingController();

  final TextEditingController phoneNoController = TextEditingController();

  final TextEditingController pinCodeController = TextEditingController();

  final TextEditingController countryController = TextEditingController();

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

  // String? emailValidation(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return null;
  //   }
  //   if (!value.contains('@')) {
  //     return 'Type a valid email';
  //   }
  //   return null;
  // }

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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allTextFields = [
      {
        "title": "First Name",
        "controller": firstNameController,
        "validation": nameValidation,
        "input_format": null,
        "keyboard_type": null
      },
      {
        "title": "Last Name",
        "controller": secondNameController,
        "validation": addValidation,
        "input_format": null,
        "keyboard_type": null
      },
      {
        "title": "Email Address",
        "controller": emailController,
        "validation": emailValidation,
        "input_format": null,
        "keyboard_type": null
      },
      {
        "title": "User ID",
        "controller": userIdController,
        "validation": idValidation,
        "input_format": null,
        "keyboard_type": null
      },
      {
        "title": "District",
        "controller": districtController,
        "validation": addValidation,
        "input_format": null,
        "keyboard_type": null
      },
      {
        "title": "Phone No",
        "controller": phoneNoController,
        "validation": addValidation,
        "input_format": [FilteringTextInputFormatter.digitsOnly],
        "keyboard_type": TextInputType.number
      },
      {
        "title": "Pincode",
        "controller": pinCodeController,
        "validation": addValidation,
        "input_format": [FilteringTextInputFormatter.digitsOnly],
        "keyboard_type": TextInputType.number
      },
      {
        "title": "Country",
        "controller": countryController,
        "validation": addValidation,
        "input_format": null,
        "keyboard_type": null
      },
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        toolbarHeight: 30,
        title: SizedBox(
            height: 60,
            width: 140,
            child: Image.asset("assets/images/nexteons_logo.png")),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "BASIC DETAILS",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Form(
                key: formKey,
                child: SizedBox(
                  height: size.height * .77,
                  width: size.width * .92,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .045),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemExtent: 70,
                        itemCount: allTextFields.length,
                        itemBuilder: (context, index) {
                          var title = allTextFields[index]['title'];
                          var controller = allTextFields[index]['controller']
                              as TextEditingController?;
                          var validator = allTextFields[index]['validation']
                              as String? Function(String?)?;
                          return Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("$title")),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: TextFieldWidget(
                                  controller: controller,
                                  validation: validator,
                                  keyBoardType: allTextFields[index]
                                      ["keyboard_type"] as TextInputType?,
                                  inputFormatters: allTextFields[index]
                                          ["input_format"]
                                      as List<TextInputFormatter>?,
                                ),
                              )
                            ],
                          );
                        },
                      )),
                ),
              ),
              Center(
                  child: Column(
                children: [
                  SaveButton(
                    onPressed: () {
                      final valid = formKey.currentState?.validate();
                      if (valid == true) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Good"),
                          backgroundColor: Colors.green,
                        ));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Failed"),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                  ),
                  InkWell(
                    onTap: () {
                      firstNameController.clear();
                      secondNameController.clear();
                      emailController.clear();
                      userIdController.clear();
                      districtController.clear();
                      phoneNoController.clear();
                      pinCodeController.clear();
                      countryController.clear();
                    },
                    child: Text(
                      "Reset all",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: ColorConstants.blackColor),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
