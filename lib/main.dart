import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_internship_task/routes.dart';
import 'package:url_strategy/url_strategy.dart';

import 'model/model.dart';

RxList<dynamic> students = [

].obs;

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      // navigatorKey: navigatorKey,
    );
  }
}
