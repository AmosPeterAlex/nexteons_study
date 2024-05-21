import 'package:go_router/go_router.dart';
import 'package:nexteons_internship_task/screen/student/create/view.dart';
import 'package:nexteons_internship_task/screen/student/list/view.dart';
import 'package:nexteons_internship_task/utils/constants/app_constants.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) =>  CreateStudent(),
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) =>  ListStudent(),
    ),
  ],
);