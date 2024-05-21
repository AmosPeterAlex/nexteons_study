import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/screen/student/widgets/ipad_frame.dart';
import 'package:nexteons_internship_task/screen/student/widgets/iphone_frame.dart';
import 'package:nexteons_internship_task/screen/student/widgets/mac_frame.dart';
import 'package:nexteons_internship_task/utils/constants/size_check.dart';

class FrameBuild extends StatelessWidget {
  const FrameBuild({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var size = MediaQuery.of(context).size;

      return Scaffold(
        appBar: fnCheckIphone(size.width) ? IPhoneFrame() : null,
        body: Row(children: [ if (fnCheckIPad(size.width) && !fnCheckIphone(size.width))
           IPadFrame(),
          if (!fnCheckIphone(size.width) && !fnCheckIPad(size.width))
             MacFrame(),
          Expanded(child: child)],),
      );
    });
  }
}
