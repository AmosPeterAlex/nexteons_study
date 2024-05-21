import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexteons_internship_task/utils/constants/color_constants.dart';
import 'package:nexteons_internship_task/widgets/save_button.dart';
import 'package:nexteons_internship_task/widgets/text_field_widget.dart';

import '../controller/controller.dart';

class IPhoneView extends StatelessWidget {
  final DetailController controller;

  IPhoneView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "BASIC DETAILS",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Form(
                key: controller.formKey,
                child: SizedBox(
                  height: size.height * .75,
                  width: size.width * .92,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * .045),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text("First Name")),
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

                                final emailRegex =
                                    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

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
                              keyBoardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
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
                              keyBoardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
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
                              keyBoardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
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
                              keyBoardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Column(
                  children: [
                    SaveButton(
                      onPressed: controller.addStudent,
                    ),
                    InkWell(
                      onTap: controller.clearDetails,
                      child: Text(
                        "Reset all",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            // fontSize: 16,
                            color: ColorConstants.blackColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
