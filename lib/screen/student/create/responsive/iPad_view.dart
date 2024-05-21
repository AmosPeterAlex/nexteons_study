import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/constants/color_constants.dart';
import 'package:nexteons_internship_task/screen/student/create/controller/controller.dart';
import 'package:nexteons_internship_task/widgets/save_button.dart';
import 'package:nexteons_internship_task/widgets/text_field_widget.dart';

class IPadView extends StatelessWidget {
  final DetailController controller;

  IPadView({
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
            width: size.width * .3,
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
                  key: controller.formKey,
                  child: SizedBox(
                    height: size.height * .64,
                    width: size.width * .68,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * .045), //ee
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
