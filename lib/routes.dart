import 'package:go_router/go_router.dart';
import 'package:nexteons_internship_task/screen/frame/frame_view.dart';
import 'package:nexteons_internship_task/screen/student/api_data_grid/view.dart';
import 'package:nexteons_internship_task/screen/student/create/view.dart';
import 'package:nexteons_internship_task/screen/student/data_grid/view.dart';
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
        //full path check later
        print(
            "state.fullpath->${state.fullPath}state.name->${state.name}state.error${state.error}");
        return "/result";
      } else {
        return null;
      }
    }
  },
  routes: [
    ShellRoute(
        builder: (context, state, child) {
          return FrameView(child: child);
        },
        routes: [
          GoRoute(
              name: RouteNames.listPage,
              path: '/result',
              builder: (context, state) => ListStudent(),
              routes: [
                GoRoute(
                  name: RouteNames.homePage,
                  path: 'home',
                  //y remove / from home page
                  builder: (context, state) => CreateStudent(),
                ),
              ]),
          GoRoute(
            name: RouteNames.gridPage,
            path: '/dataGrid',
            builder: (context, state) => DataGridView(),
          ),
          GoRoute(
            name: RouteNames.apiGridPage,
            path: '/apiDataGrid',
            builder: (context, state) => ApiDataGridView(),
          )
        ]),
    GoRoute(
      name: RouteNames.loginPage,
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
  ],
);

Future<bool> isTokenAvailable() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? accessToken = prefs.getString("LOGIN");
  return accessToken != null;
}
