import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:login/resetPasswd/resetpasswordcontroller.dart';
import 'package:login/widgets/copyright.dart';
import 'package:login/widgets/customtext.dart';

import '../api/api_client.dart';
import '../helper/helper_methods.dart';

class AskCode extends StatefulWidget {
  const AskCode({Key? key}) : super(key: key);

  @override
  State<AskCode> createState() => _AskCodeState();
}

class _AskCodeState extends State<AskCode> {
  final ResetPassWordController resetPassWordController = Get.find();
  var onHoverLogin = false;
  final ApiClient apiClient = ApiClient();
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _mailController;

  bool isLoadedPage = false;
  /* bool isHovering = false;

  bool onLogging = false;
  bool isLogging = false; */

    void sendResetCode() async{
    setState(() {
      isLoadedPage = true;
    });

    try {

      final result = await apiClient.forgotPassword(email: _mailController.text);

      if (result["status"]) {

        print(result);
        await Future.delayed(Duration(seconds: 2));
        resetPassWordController.resetStep.value = 2;
        resetPassWordController.email.value = _mailController.text;
        resetPassWordController.resetCode.value = result["code"];
      }
      setState(() {
        isLoadedPage = false;
      });
    } catch (e) {
      final message = e.toString().split("Exception: ").join("");
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        isLoadedPage = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(showSnackBar("Echec",message,Colors.red));
    }
  }

  @override
  void initState() {
    _mailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Changement de mot de passe",
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 430,
          height: 360,
          child: Card(
            elevation: 30,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 20.0, top: 20.0, left: 20.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Inscrivez votre adresse mail,puis cliquez sur <VALIDER LE CODE>",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      child: Divider(),
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(

                          controller: _mailController,
                          validator: (value) {
                            if (value == null || value.isEmpty || ! GetUtils.isEmail(value)) {
                              return 'Veuillez saisir une adresse mail';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              labelText: "Email",
                              suffixIcon: Icon(Icons.person),
                              contentPadding:
                                  EdgeInsets.only(left: 20.0, right: 20.0),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2))),
                          
                        ),
                      ],
                    ),
                    SizedBox(height: 40, /* child: const Divider() */),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          // isHovering = value;
                        });
                      },
                      onTap: () {},
                      child: ElevatedButton(
                          onPressed:
                               isLoadedPage
                              ? null
                              : ()
                              async {
                            if (_formKey.currentState!.validate()) {
                               sendResetCode();
                              //loadingAskCode(context);
                              // resetPassWordController.resetStep.value = 2;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF7700),
                            side: BorderSide(color: Colors.black),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: double.maxFinite,
                            height: 50,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: isLoadedPage
                                ? SpinKitWave(
                                    size: 20,
                                    color: Color(0xFFFF7700),
                                  )
                                : const CustomText(
                                    text: "Demander un code de vérification",
                                    color: Colors.white,
                                    size: 20,
                                  ),
                          )),
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
