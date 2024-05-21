import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/utils/constants/color_constants.dart';


class IPhoneFrame extends StatelessWidget implements PreferredSizeWidget {
  const IPhoneFrame({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // toolbarHeight: 80,
      title: Image.asset(
        "assets/images/nexteons_logo.png",
        width: 100,
        height: 16,
      ),
      backgroundColor: ColorConstants.primaryColor,
    );
  }
}