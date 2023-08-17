import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:login/api/api_client.dart';
import 'package:login/widgets/customtext.dart';
import 'package:login/resetPasswd/resetpasswordcontroller.dart';
import '../helper/helper_methods.dart';
import '../utils/utils.dart';


class ValidateCode extends StatefulWidget {
  const ValidateCode({Key? key}) : super(key: key);

  @override
  State<ValidateCode> createState() => _ValidateCodeState();
}

class _ValidateCodeState extends State<ValidateCode> {

  final ResetPassWordController resetPassWordController = Get.find();
  final _formKey = GlobalKey<FormState>();
  final ApiClient apiClient = ApiClient();
  late final TextEditingController _codeController;

  bool isLoadedPage = false;
  bool isHovering = false;
  // bool RemainBtn = false;
  bool activatePulse=false;

  /* bool onLogging = false;
  bool isLogging = false; */
  
  Future<void> confirmPulse() async {
    setState(() {
      activatePulse=false;
    });
    await Future.delayed(const Duration(seconds: 30));
    setState(() {
      activatePulse=true;
    });
  }

  void sendResetCode() async{
    try {

      final result = await apiClient.forgotPassword(email: resetPassWordController.email.value);
      if (result["status"]) {

        print(result);
        await Future.delayed(Duration(seconds: 2));
        resetPassWordController.resetCode.value = result["code"];
      }

    } catch (e) {
      final message = e.toString().split("Exception: ").join("");
      await Future.delayed(Duration(seconds: 2));
      ScaffoldMessenger.of(context).showSnackBar(showSnackBar("Echec",message,Colors.red));
    }

  }


  void validateCode() async{
    setState(() {
      isLoadedPage = true;
    });
    await Future.delayed(Duration(seconds: 2));
    if (_codeController.text == resetPassWordController.resetCode.value) {
      resetPassWordController.resetStep.value = 3;
    }else {
      ScaffoldMessenger.of(context).showSnackBar(showSnackBar("Echec","Le code renseigné est incorrect .",Colors.red));
    }
    setState(() {
      isLoadedPage = false;
    });

  }

  @override
  void initState() {
    _codeController = TextEditingController();
    confirmPulse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
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
                  const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
              child: Form(
                autovalidateMode: AutovalidateMode.disabled,
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Veuillez entrer le code de verification qui a été envoyé à votre adresse mail",
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
                          controller: _codeController,
                          validator: (value) {
                            if (value == null || value.isEmpty || !verifyCode(value)) {
                              return 'Veuillez saisir le code';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              labelText: "Code de vérification",
                              suffixIcon: Icon(Icons.vpn_key_outlined),
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
                      /* onHover: (value) {
                        setState(() {
                          // isHovering = value;
                        });
                      }, */
                      onTap: () {},
                      child: ElevatedButton(
                          onPressed: isLoadedPage
                              ? null
                              : () async {
                                  if (_formKey.currentState!.validate()) {
                                    //loadingValidateCode(context);
                                    validateCode();
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF7700),
                            /* isHovering ? Colors.red : */
                            side: BorderSide(width: 1, color: Colors.black),
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
                                    color: Color(0xFFFF7700),
                                    size: 20,
                                  )
                                : const CustomText(
                                    text: "Valider le code",
                                    color: Colors.white,
                                    size: 20,
                                  ),
                          )),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextButton(
                        onPressed: activatePulse ? () async{
                           confirmPulse();
                           sendResetCode();
                        }: null,
                        child: CustomText(
                          text: "Obtenir un nouveau code",
                          color: activatePulse ? Colors.blue : Colors.grey,
                        ))
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
