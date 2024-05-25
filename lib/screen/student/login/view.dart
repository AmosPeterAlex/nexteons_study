import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/responsive_layout_builder.dart';
import 'package:nexteons_internship_task/screen/student/login/controller/login_controller.dart';
import 'package:nexteons_internship_task/screen/student/login/responsive/ipad_login.dart';
import 'package:nexteons_internship_task/screen/student/login/responsive/iphone_login.dart';
import 'package:nexteons_internship_task/screen/student/login/responsive/mac_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginControler controler;

  final String tag = DateTime.now().toString();

  @override
  void initState() {
    controler = Get.put(LoginControler(), tag: tag);
    // controller = Get.put(LoginControler(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<LoginControler>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      macView: MacLogin(
        controler: controler,
      ),
      iPhoneView: IPhoneLogin(
        controler: controler,
      ),
      iPadView: IPadLogin(
        controler: controler,
      ),
    );
  }
}
