// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/screen/student/login/controller/login_controller.dart';
// import 'package:flutter/widgets.dart';
// import 'package:nexteons_internship_task/screen/student/login/responsive/iphone_login.dart';
import 'package:nexteons_internship_task/screen/student/login/widgets/l_text_fields.dart';
import 'package:nexteons_internship_task/screen/student/login/widgets/login_button.dart';
import 'package:nexteons_internship_task/screen/student/login/widgets/login_heading.dart';

// import '../../../../utils/constants/color_constants.dart';

class MacLogin extends StatelessWidget {
  final LoginControler controler;
  const MacLogin({super.key, required this.controler});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Container(
              //   height: size.height * .55,
              //   width: size.width * .55,
              //   // color: Colors.amber,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage("assets\images\nexteons_login.png"),
              //     ),
              //   ),
              // ),
              Container(
                height: size.height * .55,
                width: size.width * .55,
                child: Image.network(
                    "https://s3-alpha-sig.figma.com/img/0d87/503e/be2e2d420e22d905dedad14739fe025c?Expires=1717372800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mu9YlbNEQg43Nay2eCGo3W4Bjb9VS~EE4VxnqdUK82K4d2DLgrmpDcHVi4nKZbrFTysXGMTskLVnfm-v~-NSRwfuVyZYyx3n75le4lkpLdDft9T~CoyJU47Pzr-TRq~Xf91PXHHF00E2CY3L7nHQgUn59FBzf-rWrklADGPcKZHmH4ryQrTu4Qbo05IVi1pXleTxo6aN97maup2k535SFvzVzo-dILwKpScgKQ-3-EvfIXSzTso0cmxvAokuTmsb7mwPmyTNxTv9fNYph-GzLYGd57TqSCupB377A7fbSFKV8dGbuzfyDPjFtPIwzgHyPFXgtZ~t3UCS99cUPkjLtA__"),
              ),
              Container(
                height: size.height * .6,
                width: size.width * .25,
                child: ListView(
                  children: [
                    LoginHeading(),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    LTextFields(title: "UserName or Email"),
                    LTextFields(title: 'Password'),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: LoginButton(
                        onLogin: controler.onLogin,
                      ),
                    ),
                    // Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                    //   child: MaterialButton(
                    //     onPressed: () {},
                    //     minWidth: size.width * .89,
                    //     height: size.height * .07,
                    //     child: Text(
                    //       "Login",
                    //       style: TextStyle(color: ColorConstants.whiteColor),
                    //     ),
                    //     color: ColorConstants.loginButtonColor,
                    //   ),
                    // ),
                    // MaterialButton(
                    //   onPressed: () {},
                    //   child: Text(
                    //     "Login",
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    //   color: Colors.blue,
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

