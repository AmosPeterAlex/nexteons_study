// import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
import 'package:nexteons_internship_task/utils/constants/route_names.dart';

import '../../../model/drawer_button_model.dart';

class FrameController extends GetxController {
  RxList<DrawerButtonModel> drawerButton = [
    DrawerButtonModel("Add Details", RouteNames.homePage),
    DrawerButtonModel("Add Student", RouteNames.listPage),
    DrawerButtonModel("Grid", RouteNames.gridPage)
  ].obs;
}