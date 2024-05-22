import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/utils/constants/color_constants.dart';

class LoginButton extends StatelessWidget {
  final void Function()? onLogin;
  const LoginButton({super.key, this.onLogin});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialButton(
      onPressed: onLogin,
      minWidth: size.width * .89,
      height: size.height * .07,
      child: Text(
        "Login",
        style: TextStyle(color: ColorConstants.whiteColor),
      ),
      color: ColorConstants.loginButtonColor,
    );
  }
}
