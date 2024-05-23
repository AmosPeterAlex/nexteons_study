import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_internship_task/screen/frame/controller/frame_controller.dart';
import 'package:nexteons_internship_task/screen/frame/widget/drawer_button.dart';
import 'package:nexteons_internship_task/utils/constants/color_constants.dart';

class IPadFrame extends StatelessWidget {
  final FrameController controller;
  const IPadFrame({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 240,
      color: ColorConstants.primaryColor,
      padding: const EdgeInsets.only(top: 63, right: 35, left: 35),
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
                      onPress: () {
                        context.goNamed(controller.drawerButton[index].route);
                      },
                      title: "${controller.drawerButton[index].title}"));
            },
          )
        ],
      ),
    );
  }
}
