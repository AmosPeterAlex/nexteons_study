import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_internship_task/screen/student/create/view.dart';
import 'package:nexteons_internship_task/screen/student/list/widget/detail_cart.dart';
import 'package:nexteons_internship_task/utils/constants/app_constants.dart';

import '../../../../utils/constants/color_constants.dart';
import '../../../../main.dart';

class IPadResultPage extends StatelessWidget {
  const IPadResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: ColorConstants.primaryColor,
            height: size.height,
            width: size.width * .27,
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
                      "NEW STUDENTS",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .74,
                  width: size.width * .62,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * .045),
                    child: Obx(
                      () => GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: students.value.length + 1,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            childAspectRatio: .2,
                            mainAxisExtent: size.width * .27,
                            mainAxisSpacing: size.height * .016,
                            crossAxisSpacing: size.width * .026,
                            maxCrossAxisExtent: size.width * .21
                            ),
                        itemBuilder: (context, index) {
                          return index == students.length
                              ? InkWell(
                                  onTap: () {
                                    GoRouter.of(navigatorKey.currentContext!).go("/home");
                                    // Get.to(CreateStudent());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        color: Colors.grey.withOpacity(.4),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add_circle_outline,
                                          size: size.width * .07,
                                        ),
                                        Text(
                                          "Add New Student",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : DetailCard(
                                  firstname: students[index].firstname,
                                  secondName: students[index].secondName,
                                  mail: students[index].email,
                                  id: students[index].id,
                                  district: students[index].district,
                                  phone: students[index].phoneNumber,
                                  pincode: students[index].pincode,
                                  country: students[index].country);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
