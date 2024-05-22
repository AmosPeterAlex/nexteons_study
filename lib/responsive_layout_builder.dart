import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/utils/constants/size_check.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget iPhoneView;
  final Widget iPadView;
  final Widget macView;

  ResponsiveLayoutBuilder(
      {super.key,
      required this.macView,
      required this.iPhoneView,
      required this.iPadView});

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (fnCheckIphone(size.width)) {
          return iPhoneView;
        } else if (fnCheckIPad(size.width)) {
          return iPadView;
        } else {
          return macView;
        }
      },
    );
  }
}
