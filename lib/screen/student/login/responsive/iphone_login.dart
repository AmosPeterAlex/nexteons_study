import 'package:flutter/material.dart';
import 'package:nexteons_internship_task/screen/student/login/controller/login_controller.dart';
import 'package:nexteons_internship_task/screen/student/login/widgets/iphone_login_form.dart';
import 'package:nexteons_internship_task/screen/student/login/widgets/l_text_fields.dart';
import 'package:nexteons_internship_task/screen/student/login/widgets/login_heading.dart';
import 'package:nexteons_internship_task/utils/constants/color_constants.dart';

class IPhoneLogin extends StatelessWidget {
  final LoginControler controler;
  const IPhoneLogin({super.key, required this.controler});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * .4,
                width: size.width * .4,
                child: Image.network(
                    "https://s3-alpha-sig.figma.com/img/0d87/503e/be2e2d420e22d905dedad14739fe025c?Expires=1717372800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mu9YlbNEQg43Nay2eCGo3W4Bjb9VS~EE4VxnqdUK82K4d2DLgrmpDcHVi4nKZbrFTysXGMTskLVnfm-v~-NSRwfuVyZYyx3n75le4lkpLdDft9T~CoyJU47Pzr-TRq~Xf91PXHHF00E2CY3L7nHQgUn59FBzf-rWrklADGPcKZHmH4ryQrTu4Qbo05IVi1pXleTxo6aN97maup2k535SFvzVzo-dILwKpScgKQ-3-EvfIXSzTso0cmxvAokuTmsb7mwPmyTNxTv9fNYph-GzLYGd57TqSCupB377A7fbSFKV8dGbuzfyDPjFtPIwzgHyPFXgtZ~t3UCS99cUPkjLtA__"),
              ),
              LoginHeading(),
              IPhoneFormWidget( firstTitle: 'UserName or email', secondTitle: 'Password',onLoginPress: controler.onLogin,),
              // LTextFields(title: "UserName or email"),
              // LTextFields(title: "Password"),
              // Align(
              //     alignment: Alignment.bottomRight,
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //       child: Text(
              //         "Forgot Password",
              //         style: TextStyle(fontWeight: FontWeight.w500),
              //       ),
              //     )),
              // SizedBox(
              //   height: 20,
              // ),
              // MaterialButton(
              //   onPressed: (){},
              //   minWidth: size.width * .89,
              //   height: size.height * .07,
              //   child: Text(
              //     "Login",
              //     style: TextStyle(color: ColorConstants.whiteColor),
              //   ),
              //   color: ColorConstants.loginButtonColor,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
