import 'package:flutter/material.dart';

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

