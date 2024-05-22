import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/utils/constants/color_constants.dart';


//edh phone view il login floating ayi nilkan aa

class CustomFloatingNavigationButton extends StatelessWidget {
  final FloatingButtonPosition position;
  final VoidCallback onPressed;
  final String buttonText;
  final double widthFactor;
  final double heightFactor;

  const CustomFloatingNavigationButton({
    Key? key,
    required this.position,
    required this.onPressed,
    required this.buttonText,
    this.widthFactor = 0.9,
    this.heightFactor = 0.07,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          bottom: position.bottom,
          top: position.top,
          left: position.left,
          right: position.right,
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: size.width * widthFactor,
            height: size.height * heightFactor,
            color: ColorConstants.loginButtonColor,

            ///shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            // RoundedRectangleBorder(
            //   borderRadius: BorderRadius.zero,
            //   side: BorderSide(color: Colors.red)
            // )
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            // shape: StadiumBorder(),
            child: Text(
              buttonText,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class FloatingButtonPosition {
  final double? bottom;
  final double? top;
  final double? left;
  final double? right;

  FloatingButtonPosition({
    this.bottom,
    this.top,
    this.left,
    this.right,
  });
}
