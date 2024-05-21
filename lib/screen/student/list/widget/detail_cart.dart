import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/constants/color_constants.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    super.key,
    required this.firstname,
    required this.secondName,
    required this.mail,
    required this.id,
    required this.district,
    required this.phone,
    required this.pincode,
    required this.country,
  });

  final String firstname;
  final String secondName;
  final String mail;
  final int id;
  final String district;
  final int phone;
  final int pincode;
  final String country;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: ColorConstants.cardFillColor),
          color: ColorConstants.cardFillColor..withOpacity(.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$firstname $secondName",
            style: TextStyle(fontSize: 18),
          ),
          Text(
            mail,
            style: TextStyle(fontSize: 18),
          ),
          Text(
            "$id",
            style: TextStyle(fontSize: 18),
          ),
          Text(
            district,
            style: TextStyle(fontSize: 18),
          ),
          Text(
            "$phone",
            style: TextStyle(fontSize: 18),
          ),
          Text(
            "$pincode",
            style: TextStyle(fontSize: 18),
          ),
          Text(
            country,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
