import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexteons_internship_task/screen/student/create/controller/controller.dart';
import 'package:nexteons_internship_task/utils/constants/color_constants.dart';
import 'package:nexteons_internship_task/screen/student/create/widgets/save_button.dart';
import 'package:nexteons_internship_task/screen/student/create/widgets/text_field_widget.dart';

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
                    width: size.width * .66,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .055),
                      child: GridView(
                        shrinkWrap: true,
                        gridDelegate:
                             SliverGridDelegateWithFixedCrossAxisCount(
                               //baki yik add akenm
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                mainAxisExtent: 105,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: size.width*.1),
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

                                  final emailRegex = RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

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
