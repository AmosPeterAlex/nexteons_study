import 'package:flutter/material.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return iPhoneView;
        } else if (constraints.maxWidth < 1000) {
          return iPadView;
        } else {
          return macView;
        }
      },
    );
  }
}
