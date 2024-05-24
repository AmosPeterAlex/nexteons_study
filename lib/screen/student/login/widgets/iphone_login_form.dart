import 'package:flutter/material.dart';

// import 'package:flutter/widgets.dart';

class IPhoneFormWidget extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final TextEditingController? nameCntrl;
  final TextEditingController? passCntrl;
  final void Function()? onLoginPress;

  const IPhoneFormWidget(
      {super.key,
      this.onLoginPress,
      required this.firstTitle,
      required this.secondTitle, this.nameCntrl, this.passCntrl});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(firstTitle))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SizedBox(
            height: size.height * .07,
            width: size.width * .87,
            child: TextFormField(
              controller: nameCntrl,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(secondTitle),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SizedBox(
            height: size.height * .07,
            width: size.width * .87,
            child: TextFormField(
              controller: passCntrl,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: Text(
              "Forgot Password",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        // MaterialButton(
        //   onPressed: onLoginPress,
        //   minWidth: size.width * .89,
        //   height: size.height * .07,
        //   child: Text(
        //     "Login",
        //     style: TextStyle(color: ColorConstants.whiteColor),
        //   ),
        //   color: ColorConstants.loginButtonColor,
        // )
      ],
    );
  }
}
