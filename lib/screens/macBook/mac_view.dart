import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/constants/color_constants.dart';
import 'package:nexteons_internship_task/controller/controller.dart';
import 'package:nexteons_internship_task/screens/macBook/result.dart';
import 'package:nexteons_internship_task/widgets/save_button.dart';
import 'package:nexteons_internship_task/widgets/text_field_widget.dart';

import '../../constants/text_field_config.dart';

class MacView extends StatefulWidget {
  MacView({
    super.key,
  });

  @override
  State<MacView> createState() => _MacViewState();
}

class _MacViewState extends State<MacView> {
  final formKey = GlobalKey<FormState>();
  final DetailController controller = Get.put(DetailController());
  void handleFormSubmission() {
    final valid = formKey.currentState?.validate();
    if (valid == true) {
      controller.addStudent(
        fname: allTextFields[0]['controller'].text,
        lname: allTextFields[1]['controller'].text,
        mail: allTextFields[2]['controller'].text,
        id: int.parse(allTextFields[3]['controller'].text),
        dist: allTextFields[4]['controller'].text,
        phone: allTextFields[5]['controller'].text,
        pin: int.parse(allTextFields[6]['controller'].text),
        country: allTextFields[7]['controller'].text,
      );

      Get.to(() => ResultPage());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Failed"),
        backgroundColor: Colors.red,
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    final getxController = Get.put(DetailController());
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
                            for (var field in allTextFields) {
                              (field['controller'] as TextEditingController)
                                  .clear();
                            }
                          },
                          child: Text(
                            "Reset all",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SaveButton(onPressed: handleFormSubmission,)
                        // SaveButton(
                        //   onPressed: () {
                        //     final valid = formKey.currentState?.validate();
                        //     if (valid == true) {
                        //       String firstName =
                        //           allTextFields[0]['controller'].text;
                        //       String lastName =
                        //           allTextFields[1]['controller'].text;
                        //       String email =
                        //           allTextFields[2]['controller'].text;
                        //       int userId = int.parse(
                        //           allTextFields[3]['controller'].text);
                        //       String district =
                        //           allTextFields[4]['controller'].text;
                        //       String phoneNo =
                        //           allTextFields[5]['controller'].text;
                        //       int pinCode = int.parse(
                        //           allTextFields[6]['controller'].text);
                        //       String country =
                        //           allTextFields[7]['controller'].text;
                        //
                        //       getxController.addStudent(
                        //         context,
                        //         firstName: firstName,
                        //         secondName: lastName,
                        //         mail: email,
                        //         userId: userId,
                        //         dist: district,
                        //         phone: int.parse(phoneNo),
                        //         pin: pinCode,
                        //         country: country,
                        //       );
                        //
                        //       // Navigator.push(
                        //       //   context,
                        //       //   MaterialPageRoute(
                        //       //     builder: (context) => ResultPage(
                        //       //       firstName: firstName,
                        //       //       lastName: lastName,
                        //       //       email: email,
                        //       //       userId: userId,
                        //       //       district: district,
                        //       //       phoneNo: int.parse(phoneNo),
                        //       //       pinCode: pinCode,
                        //       //       country: country,
                        //       //     ),
                        //       //   ),
                        //       // );
                        //       Get.to(ResultPage(firstName: firstName,
                        //           lastName: lastName,
                        //           email: email,
                        //           userId: userId,
                        //           district: district,
                        //           phoneNo: int.parse(phoneNo),
                        //           pinCode: pinCode,
                        //           country: country));
                        //     } else {
                        //       ScaffoldMessenger.of(context)
                        //           .showSnackBar(const SnackBar(
                        //         content: Text("Failed"),
                        //         backgroundColor: Colors.red,
                        //       ));
                        //     }
                        //   },
                        // )
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
