import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_internship_task/screen/frame/controller/frame_controller.dart';
import 'package:nexteons_internship_task/utils/constants/color_constants.dart';

import '../widget/drawer_button.dart';

class IPhoneDrawer extends StatelessWidget {
  final FrameController controller;

  final double? drawerwidth;

  const IPhoneDrawer({super.key, required this.controller, this.drawerwidth});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: drawerwidth,
      child: Wrap(
        children: [
          Container(
            color: ColorConstants.primaryColor,
            child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/nexteons_logo.png",
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.drawerButton.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: DrawerButtonWidget(
                    title: '${controller.drawerButton[index].title}',
                    onPress: () {
                      context.goNamed(controller.drawerButton[index].route);
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
