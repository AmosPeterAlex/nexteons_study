import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_internship_task/utils/constants/app_constants.dart';
import 'package:nexteons_internship_task/utils/constants/route_names.dart';

//getxcontroller extends cheyande
class LoginControler extends GetxController {
  void onLogin(){
    GoRouter.of(navigatorKey.currentContext!).goNamed(RouteNames.homePage);
  }
}