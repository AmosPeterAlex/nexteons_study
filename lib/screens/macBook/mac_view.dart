import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexteons_internship_task/constants/color_constants.dart';
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

