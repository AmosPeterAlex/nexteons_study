//last to be added
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/responsive_layout_builder.dart';
import 'package:nexteons_internship_task/screen/frame/frame_view.dart';
import 'package:nexteons_internship_task/screen/student/api_data_grid/controller/api_data_grid_controller.dart';
import 'package:nexteons_internship_task/screen/student/api_data_grid/responsive/api_data_grid.dart';

class ApiDataGridView extends StatefulWidget {
 
  const ApiDataGridView({super.key});

  @override
  State<ApiDataGridView> createState() => _ApiDataGridViewState();
}

class _ApiDataGridViewState extends State<ApiDataGridView> {
  late ApiDataGridController controller;
  final String tag = DateTime.now().toString();

  @override
  void initState() {
    controller = Get.put(ApiDataGridController(), tag: tag);
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   controller.onApiGridDataGet();});
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ApiDataGridController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FrameView(
      child: ResponsiveLayoutBuilder(
          macView: ApiDataGridMac(
            controller: controller,
          ),
          iPhoneView: ApiDataGridMac(
            controller: controller,
          ),
          iPadView: ApiDataGridMac(
            controller: controller,
          )),
    );
  }
}
