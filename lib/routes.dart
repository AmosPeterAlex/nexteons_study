import 'package:go_router/go_router.dart';
import 'package:nexteons_internship_task/screen/student/create/view.dart';
import 'package:nexteons_internship_task/screen/student/list/view.dart';
import 'package:nexteons_internship_task/screen/student/login/view.dart';
import 'package:nexteons_internship_task/utils/constants/app_constants.dart';
import 'package:nexteons_internship_task/utils/constants/route_names.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: "/login",
  routes: [
    GoRoute(
      name: RouteNames.loginPage,
      path: '/login',
      builder: (context, state) =>  LoginPage(),
    ),
    GoRoute(
      name: RouteNames.homePage,
      path: '/home',
      builder: (context, state) =>  CreateStudent(),
    ),
    GoRoute(
      name: RouteNames.listPage,
      path: '/result',
      builder: (context, state) =>  ListStudent(),
    ),
  ],
);