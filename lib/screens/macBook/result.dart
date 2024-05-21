import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/controller/controller.dart';
import 'package:nexteons_internship_task/screens/macBook/mac_view.dart';
import 'package:nexteons_internship_task/widgets/detail_cart.dart';

import '../../constants/color_constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                      "NEW STUDENTS",
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
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: getxController.students.length + 1,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: .75,
                          mainAxisSpacing: size.height * .015,
                          crossAxisSpacing: size.width * .025),
                      itemBuilder: (context, index) {
                        return index == getxController.students.length
                            ? InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MacView(),
                                      ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      color: Colors.grey.withOpacity(.4),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : DetailCard(
                                firstname:
                                    getxController.students[index].firstname,
                                secondName:
                                    getxController.students[index].secondName,
                                mail: getxController.students[index].email,
                                id: getxController.students[index].id,
                                district:
                                    getxController.students[index].district,
                                phone:
                                    getxController.students[index].phoneNumber,
                                pincode: getxController.students[index].pincode,
                                country:
                                    getxController.students[index].country);
                      },
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

/*
class ResultPage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final int userId;
  final String district;
  final int phoneNo;
  final int pinCode;
  final String country;

  const ResultPage({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userId,
    required this.district,
    required this.phoneNo,
    required this.pinCode,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('First Name: $firstName', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Last Name: $lastName', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: $email', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('User ID: $userId', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('District: $district', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Phone No: $phoneNo', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Pincode: $pinCode', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Country: $country', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
 */
