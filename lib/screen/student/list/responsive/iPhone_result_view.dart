import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_internship_task/screen/student/list/widget/detail_cart.dart';

import '../../../../main.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/constants/color_constants.dart';

class IPhoneResultPage extends StatelessWidget {
  const IPhoneResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        toolbarHeight: 70,
        //added fixed height
        title: SizedBox(
          height: 60,
          width: 140,
          child: Image.asset("assets/images/nexteons_logo.png"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "BASIC DETAILS",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            SizedBox(
              // color: Colors.red,
              height: size.height * .8,
              width: size.width * .8,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: students.value.length + 1,
                itemBuilder: (context, index) {
                  return index == students.length
                      ? InkWell(
                          onTap: () {
                            GoRouter.of(navigatorKey.currentContext!).go("/home");
                            // Get.to(
                            //   CreateStudent(),
                            // );
                          },
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: ColorConstants.cardFillColor),
                                color: ColorConstants.cardFillColor
                                    .withOpacity(.4),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle_outline,
                                    size: size.width * .07,
                                  ),
                                  Text(
                                    "Add New Student",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : Card(
                          child: DetailCard(
                              firstname: students[index].firstname,
                              secondName: students[index].secondName,
                              mail: students[index].email,
                              id: students[index].id,
                              district: students[index].district,
                              phone: students[index].phoneNumber,
                              pincode: students[index].pincode,
                              country: students[index].country),
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
