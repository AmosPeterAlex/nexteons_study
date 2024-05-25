import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/screen/frame/controller/frame_controller.dart';
import 'package:nexteons_internship_task/screen/frame/responsive/Iphone_drawer.dart';
import 'package:nexteons_internship_task/screen/frame/responsive/ipad_frame.dart';
import 'package:nexteons_internship_task/screen/frame/responsive/iphone_frame.dart';
import 'package:nexteons_internship_task/screen/frame/responsive/mac_frame.dart';
import 'package:nexteons_internship_task/utils/constants/size_check.dart';

class FrameView extends StatefulWidget {
  const FrameView({super.key, required this.child});

  final Widget child;

  @override
  State<FrameView> createState() => _FrameViewState();
}

class _FrameViewState extends State<FrameView> {
  late FrameController controller;
  final String tag = DateTime.now().toString();

  @override
  void initState() {
    controller = Get.put(FrameController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<FrameController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var size = MediaQuery.of(context).size;

      return Scaffold(
        appBar: fnCheckIphone(size.width) ? IPhoneFrame() : null,
        drawer: fnCheckIphone(size.width)
            ? IPhoneDrawer(
                controller: controller,
                drawerwidth: size.width * .4,
              )
            : null,
        body: Row(
          children: [
            if (fnCheckIPad(size.width) && !fnCheckIphone(size.width))
              IPadFrame(
                controller: controller,
              ),
            if (!fnCheckIphone(size.width) && !fnCheckIPad(size.width))
              MacFrame(
                controller: controller,
              ),
            Expanded(child: widget.child)
          ],
        ),
      );
    });
  }
}
