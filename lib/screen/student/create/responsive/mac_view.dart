import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/constants/color_constants.dart';
import 'package:nexteons_internship_task/screen/student/create/controller/controller.dart';
import 'package:nexteons_internship_task/screen/student/list/result.dart';
import 'package:nexteons_internship_task/widgets/save_button.dart';
import 'package:nexteons_internship_task/widgets/text_field_widget.dart';

import '../../../../constants/text_field_config.dart';

class MacView extends StatelessWidget {
  final DetailController controller;

  MacView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: ColorConstants.primaryColor,
            height: size.height,
            width: size.width * .35,
            child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
                  child: Image.asset("assets/images/nexteons_logo.png"),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * .06,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .045,
                    ),
                    Text(
                      "BASIC DETAILS",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
                    ),
                  ],
                ),
                Form(
                  key: controller.formKey,
                  child: SizedBox(
                    height: size.height * .64,
                    width: size.width * .62,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .045),
                      child: GridView(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 16,
                                mainAxisExtent: 120,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 80),
                        children: [
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("First Name")),
                              SizedBox(
                                height: 10,
                              ),
                              TextFieldWidget(
                                controller: controller.firstNameController,
                                validation: (value) {
                                  if (value == null || value.length < 3) {
                                    return 'Min 3 letter required';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Last Name")),
                              SizedBox(
                                height: 10,
                              ),
                              TextFieldWidget(
                                controller: controller.secondNameController,
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Email Address")),
                              SizedBox(
                                height: 10,
                              ),
                              TextFieldWidget(
                                controller: controller.emailController,
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }

                                  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                                  if (!emailRegex.hasMatch(value)) {
                                    return 'Type a valid email';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("User ID")),
                              SizedBox(
                                height: 10,
                              ),
                              TextFieldWidget(
                                controller: controller.userIdController,
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'User Id is required';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("District")),
                              SizedBox(
                                height: 10,
                              ),
                              TextFieldWidget(
                                controller: controller.districtController,
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Phone No")),
                              SizedBox(
                                height: 10,
                              ),
                              TextFieldWidget(
                                controller: controller.phoneNoController,
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Pincode")),
                              SizedBox(
                                height: 10,
                              ),
                              TextFieldWidget(
                                controller: controller.pinCodeController,
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Country")),
                              SizedBox(
                                height: 10,
                              ),
                              TextFieldWidget(
                                controller: controller.countryController,
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  return null;
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .12,
                  width: size.width * .62,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: controller.clearDetails,
                          child: Text(
                            "Reset all",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),

                        SaveButton(
                          onPressed: controller.addStudent,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/constants/color_constants.dart';
import 'package:nexteons_internship_task/controller/controller.dart';
import 'package:nexteons_internship_task/widgets/save_button.dart';
import 'package:nexteons_internship_task/widgets/text_field_widget.dart';

class MacView extends StatefulWidget {
  MacView({
    super.key,
  });

  @override
  State<MacView> createState() => _MacViewState();
}

class _MacViewState extends State<MacView> {
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
    var size = MediaQuery
        .of(context)
        .size;
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

    final getController = Get.put(DetailController());
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: ColorConstants.primaryColor,
            height: size.height,
            width: size.width * .35,
            child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
                  child: Image.asset("assets/images/nexteons_logo.png"),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * .06,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .045,
                    ),
                    Text(
                      "BASIC DETAILS",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                  ],
                ),
                Form(
                  key: formKey,
                  child: SizedBox(
                    height: size.height * .64,
                    width: size.width * .62,
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: size.width * .045),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: allTextFields.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: size.height * .16,
                            childAspectRatio: 2.2,
                            mainAxisSpacing: size.height * .015,
                            crossAxisSpacing: size.width * .025),
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
                              TextFieldWidget(
                                controller: controller,
                                validation: validator,
                                keyBoardType: allTextFields[index]
                                ["keyboard_type"] as TextInputType?,
                                inputFormatters: allTextFields[index]
                                ["input_format"]
                                as List<TextInputFormatter>?,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .12,
                  width: size.width * .62,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
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
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SaveButton(
                          onPressed: () {
                            final valid = formKey.currentState?.validate();
                            if (valid == true) {
                              getController.addStudent(
                                  context, firstName: firstNameController.text,
                                  secondName: secondNameController.text,
                                  mail: emailController.text,
                                  userId: int.parse(userIdController.text),
                                  dist: districtController.text,
                                  phone: int.parse(userIdController.text),
                                  pin: int.parse(pinCodeController.text),
                                  country: countryController.text);
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //     content: Text("Good"),
                              //     backgroundColor: Colors.green,
                              //   ),
                              // );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Failed"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

 */
