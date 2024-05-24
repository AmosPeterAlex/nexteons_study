import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_internship_task/screen/frame/controller/frame_controller.dart';
import 'package:nexteons_internship_task/screen/frame/widget/drawer_button.dart';
import 'package:nexteons_internship_task/utils/constants/color_constants.dart';

class MacFrame extends StatelessWidget {
  final FrameController controller;
  const MacFrame({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 324,
      color: ColorConstants.primaryColor,
      padding: const EdgeInsets.only(top: 74, right: 54, left: 54),
      child: Wrap(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/nexteons_logo.png",
              )),
          ListView.builder(
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
          )
        ],
      ),
    );
  }
}
