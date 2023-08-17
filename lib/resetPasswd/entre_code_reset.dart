import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:login/resetPasswd/resetpasswordcontroller.dart';
import '../widgets/specialcopyright.dart';
import 'demande_reset_mail.dart';
import 'validate_code.dart';
import 'resetpasswordcontroller.dart';
import 'confirmer_reset_passwd.dart';
import 'package:login/widgets/copyright.dart';
import 'package:login/widgets/customtext.dart';

class ForgotPasswd extends StatefulWidget {
  const ForgotPasswd({Key? key}) : super(key: key);

  @override
  State<ForgotPasswd> createState() => _ForgotPasswdState();
}

class _ForgotPasswdState extends State<ForgotPasswd> {
  final resetPassWordController = Get.put(ResetPassWordController());
  var onHoverLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/fond_accueil.jpg",
                ),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              height: 60,
              color: Color((0xFFFF7700)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(width: 10,),
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    decoration: BoxDecoration(color: Colors.white),
                    height: 50,
                    child: Container(
                      // margin: EdgeInsets.only(left: 0),
                      child: Center(
                        child: Image.asset(
                          "assets/images/perf_rse.png",
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 300),
                  Container(
                    margin: EdgeInsets.only(right: 100),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              resetPassWordController.resetStep.value = 1;
                              context.go('/account/login');
                            },
                            onHover: (value) {
                              if (value) {
                                setState(() {
                                  onHoverLogin = true;
                                });
                              } else {
                                setState(() {
                                  onHoverLogin = false;
                                });
                              }
                            },
                            child: CustomText(
                              text: "Se Connecter",
                              size: 20,
                              color:
                                  Colors.white /* onHoverLogin ? Colors. :  */,
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomText(
                          text: "FR",
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Center(
                child: Obx(() {
                  final step = resetPassWordController.resetStep.value;
                  if (step == 1) {
                    return AskCode();
                  } else if (step == 2) {
                    return ValidateCode();
                  } else {
                    return ResetPwd();
                  }
                }),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Specialcopyright(),
          ],
        ),
      ),
    );
  }
}
