//last to be added
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/responsive_layout_builder.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getData();});
    //frame build ayi kayinj
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ApiDataGridController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
        macView: ApiDataGridMac(
          controller: controller,
        ),
        iPhoneView: ApiDataGridMac(
          controller: controller,
        ),
        iPadView: ApiDataGridMac(
          controller: controller,
        ));
  }
}
/*
Context in Flutter
Flutter uses a widget tree to describe the user interface, and this tree is built and updated by the framework. Certain operations need to be performed after the widget tree has been built or updated, which is where WidgetsBinding and frame callbacks come in.

Explanation
WidgetsBinding.instance:

WidgetsBinding is a class that interacts with the Flutter engine and manages the widget tree.
instance is a singleton instance of WidgetsBinding that provides access to various methods and properties for interacting with the framework.
addPostFrameCallback:

This method registers a callback that will be executed after the current frame is drawn.
Essentially, it schedules a piece of code to run once the current frame has been rendered on the screen.
(timeStamp) { controller.getData(); }:

This is an anonymous function (or lambda) that takes a timeStamp parameter. The timeStamp represents the point in time when the callback is executed.
Inside this function, controller.getData() is called.
Purpose
By using addPostFrameCallback, you ensure that controller.getData() is called only after the current frame has been rendered. This is useful for scenarios where you need to perform operations that depend on the widget tree being fully built and laid out, such as:

Fetching data that requires the UI to be ready.
Interacting with elements that are only available after the layout pass.
Avoiding unnecessary rebuilds or side effects during the widget tree construction.
Example Scenario
Imagine you have a widget that needs to fetch and display data from an API once it's rendered. You can't initiate the data fetching in the widget's constructor or initState method because the widget tree might not be fully built yet. By using addPostFrameCallback, you ensure that the API call to fetch data (controller.getData()) happens right after the initial build, making sure the UI is ready to handle and display the fetched data.

Summary
In summary, the code you provided ensures that controller.getData() is executed after the widget tree has been built and the initial frame has been rendered. This is a common practice in Flutter to handle tasks that need to wait until the UI is fully set up.
 */