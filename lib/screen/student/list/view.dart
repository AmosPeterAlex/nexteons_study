import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/responsive_layout_builder.dart';
import 'package:nexteons_internship_task/screen/student/list/responsive/iPad_result_view.dart';
import 'package:nexteons_internship_task/screen/student/list/responsive/iPhone_result_view.dart';
import 'package:nexteons_internship_task/screen/student/list/responsive/mac_result_view.dart';
import 'package:nexteons_internship_task/screen/frame/frame_view.dart';

class ListStudent extends StatefulWidget {
  const ListStudent({super.key});

  @override
  State<ListStudent> createState() => _ListStudentState();
}

class _ListStudentState extends State<ListStudent> {
  @override
  Widget build(BuildContext context) {
    return FrameView(
      child: ResponsiveLayoutBuilder(
          macView: MacResultPage(),
          iPhoneView: IPhoneResultPage(),
          iPadView: IPadResultPage()),
    );
  }
}
