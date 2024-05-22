import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/login_working_sample/service.dart';
// import 'auth_service.dart';

class AuthController extends GetxController {
  final AuthService authService = Get.put(AuthService());
  var accessToken = ''.obs;

  void login() async {
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
          "_userType": 0,
          "deviceId": "",
          "deviceName": "test",
          "deviceToken": "test",
          "grant_type": "password"
        }
      }
    };

    try {
      final response = await authService.login(payload);
      print('Response data: $response');
      if (response != null && response['data'] != null && response['data']['Auth_Login'] != null) {
        accessToken.value = response['data']['Auth_Login']['accessToken'];
        print('Access Token: ${accessToken.value}');
      } else {
        print('Error: Auth_Login key not found in response');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}


class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Access Token: ${authController.accessToken.value}')),
            ElevatedButton(
              onPressed: () {
                authController.login();
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    home: LoginPage(),
  ));
}

