import 'package:go_router/go_router.dart';
import 'package:nexteons_internship_task/screen/student/create/view.dart';
import 'package:nexteons_internship_task/screen/student/list/view.dart';
import 'package:nexteons_internship_task/screen/student/login/view.dart';
import 'package:nexteons_internship_task/utils/constants/app_constants.dart';
import 'package:nexteons_internship_task/utils/constants/route_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: "/login",
  redirect: (context, state) async {
    if (await isTokenAvailable() == false) {
      return "/login";
    } else {
      if (state.fullPath == "/login") {
        print(
            "state.fullpath->${state.fullPath}state.name->${state.name}state.error${state.error}");
        return "/result";
      } else {
        return null;
      }
    }
  },
  routes: [
    GoRoute(
      name: RouteNames.loginPage,
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      name: RouteNames.homePage,
      path: '/home',
      builder: (context, state) => CreateStudent(),
    ),
    GoRoute(
      name: RouteNames.listPage,
      path: '/result',
      builder: (context, state) => ListStudent(),
    ),
  ],
);

Future<bool> isTokenAvailable() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? accessToken = prefs.getString("LOGIN");
  return accessToken != null;
}
