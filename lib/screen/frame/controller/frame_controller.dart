import 'package:get/get.dart';
import 'package:nexteons_internship_task/utils/constants/route_names.dart';

import '../../../model/drawer_button_model.dart';

class FrameController extends GetxController {
  RxList<DrawerButtonModel> drawerButton = [
    DrawerButtonModel("Add Details", RouteNames.homePage),
    DrawerButtonModel("Add Student", RouteNames.listPage),
    // DrawerButtonModel("Grid", RouteNames.gridPage),
    DrawerButtonModel("Api Grid", RouteNames.apiGridPage),
  ].obs;
}
