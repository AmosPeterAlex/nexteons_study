import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/constants/color_constants.dart';
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
      return 'This field cannot be empty';
    }
    return null;
  }

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var basicDetails = [
      {
        "title": "First Name",
        "controller": firstNameController,
        "validation": addValidation,
      },
      {
        "title": "Last Name",
        "controller": secondNameController,
        "validation": addValidation,
      },
      {
        "title": "Email Address",
        "controller": emailController,
        "validation": addValidation,
      },
      {
        "title": "User ID",
        "controller": userIdController,
        "validation": addValidation,
      },
      {
        "title": "District",
        "controller": districtController,
        "validation": addValidation,
      },
      {
        "title": "Phone No",
        "controller": phoneNoController,
        "validation": addValidation,
      },
      {
        "title": "Pincode",
        "controller": pinCodeController,
        "validation": addValidation,
      },
      {
        "title": "Country",
        "controller": countryController,
        "validation": addValidation,
      },
    ];
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
            padding: EdgeInsets.only(top: size.height * .06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "BASIC DETAILS",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                Form(
                  key: formKey,
                  child: SizedBox(
                    height: size.height * .64,
                    width: size.width * .62,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: basicDetails.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 110,
                            childAspectRatio: 2.2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          var title = basicDetails[index]['title'];
                          var controller = basicDetails[index]['controller']
                              as TextEditingController?;
                          var validator = basicDetails[index]['validation']
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
                        Text(
                          "Reset all",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
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
import 'package:nexteons_internship_task/constants/color_constants.dart';
import 'package:nexteons_internship_task/widgets/save_button.dart';
import 'package:nexteons_internship_task/widgets/text_field_widget.dart';

class MacView extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  MacView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var basicDetails = [
      {
        "title": "First Name",
        "controller": firstNameController,
        "validation": addvalidation,
      },
      {
        "title": "Last Name",
        "controller": secondNameController,
        "validation": addvalidation,
      },
      {
        "title": "Email Address",
        "controller": emailController,
        "validation": addvalidation,
      },
      {
        "title": "User ID",
        "controller": userIdController,
        "validation": addvalidation,
      },
      {
        "title": "District",
        "controller": districtController,
        "validation": addvalidation,
      },
      {
        "title": "Phone No",
        "controller": phoneNoController,
        "validation": addvalidation,
      },
      {
        "title": "Pincode",
        "controller": pinCodeController,
        "validation": addvalidation,
      },
      {
        "title": "Country",
        "controller": countryController,
        "validation": addvalidation,
      },
    ];
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
            padding: EdgeInsets.only(top: size.height * .06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "BASIC DETAILS",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                SizedBox(
                  height: size.height * .52,
                  width: size.width * .62,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: basicDetails.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 80,
                          childAspectRatio: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 15),
                      itemBuilder: (context, index) {
                        var title = basicDetails[index]['title'];
                        var controller = basicDetails[index]['controller']
                            as TextEditingController?;
                        var validator= basicDetails[index]['validation'];
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
                            )
                          ],
                        );
                      },
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
                        Text(
                          "Reset all",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SaveButton(
                          onPressed: () {},
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
