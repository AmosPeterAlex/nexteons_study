import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/responsive_layout_builder.dart';
import 'package:nexteons_internship_task/screen/student/create/controller/controller.dart';
import 'package:nexteons_internship_task/screen/student/create/responsive/iPad_view.dart';
import 'package:nexteons_internship_task/screen/student/create/responsive/iPhone_view.dart';
import 'package:nexteons_internship_task/screen/student/create/responsive/mac_view.dart';
import 'package:nexteons_internship_task/screen/student/widgets/frame_build.dart';

class CreateStudent extends StatefulWidget {
  const CreateStudent({super.key});

  @override
  State<CreateStudent> createState() => _CreateStudentState();
}

class _CreateStudentState extends State<CreateStudent> {
  late DetailController controller;
  final String tag = DateTime.now().toString();

  @override
  void initState() {
    controller = Get.put(DetailController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<DetailController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FrameBuild(
      child: ResponsiveLayoutBuilder(
        macView: MacView(
          controller: controller,
        ),
        iPhoneView: IPhoneView(
          controller: controller,
        ),
        iPadView: IPadView(
          controller: controller,
        ),
      ),
    );
  }
}
