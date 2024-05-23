import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_internship_task/screen/student/login/service/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/constants/route_names.dart';

class LoginControler extends GetxController {
  late SharedPreferences sharedPreferences;
  final LoginService loginService = Get.put(LoginService());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  // var value = {}.obs;
  var accessToken = '';

  void onLogin() async {
    Map<String, dynamic> payload = {
      "query": '''
        query Auth_Login(\$loginData: LoginInput!) {
          Auth_Login(loginData: \$loginData) {
            accessToken
          }
        }
      ''',
      "variables": {
        "loginData": {
          "_deviceType": 0,
          "_email": "developer.fayizalinp@gmail.com",
          "_password": "0RneWfb0",
          // "_email": nameController.text.trim(),
          // "_password": passController.text.trim(),
          "_userType": 0,
          "deviceId": "",
          "deviceName": "test",
          "deviceToken": "test",
          "grant_type": "password"
        }
      }
    };
    // email & password
    // developer.fayizalinp@gmail.com
    // 0RneWfb0
    try {
      final response = await loginService.logService(payload);
      log("response in controller ----> $response");
      log("access token ->${response['data']['Auth_Login']}");
      if (response != null &&
          response["data"] != null &&
          response['data']['Auth_Login'] != null) {
        accessToken = response['data']['Auth_Login']['accessToken'];
        print("access token. value--->>>>>${accessToken}");
        log("response[data] in controller log--> ${response["data"]} ");
        // var token= response['data']['Auth_Login']['accessToken'];
        storeReceivedData(accessToken);
        GoRouter.of(navigatorKey.currentContext!).goNamed(RouteNames.listPage);
      } else {
        print('Error: Auth_Login key not found in response');
      }
    } catch (e) {
      log("e---> $e");
    }
  }

  storeReceivedData(accessToken) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("LOGIN", json.encode(accessToken));
    // sharedPreferences.setBool("STATUS", true);
  }
}
