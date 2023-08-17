import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:login/widgets/copyright.dart';
import 'package:login/resetPasswd/resetpasswordcontroller.dart';
import '../../widgets/customtext.dart';
import '../api/api_client.dart';
import '../helper/helper_methods.dart';
import '../utils/utils.dart';

class ResetPwd extends StatefulWidget {
  const ResetPwd({Key? key}) : super(key: key);

  @override
  State<ResetPwd> createState() => _ResetPwdState();
}

class _ResetPwdState extends State<ResetPwd> {
  final ApiClient apiClient = ApiClient();
  final ResetPassWordController resetPassWordController = Get.find();
  var onHoverLogin = false;
  final _formKey = GlobalKey<FormState>();
  bool _obsureText1 = true;
  bool _obsureText2 = true;
  late final TextEditingController _confpasswordController;
  late final TextEditingController _newpasswordController;

  bool isLoadedPage = false;
  bool isHoveringbtn1 = false;
  // bool isHoveringbtn2 = false;

  bool onLogging = false;
  bool isLogging = false;

  void resetPwd(BuildContext context) async {
    setState(() {
      isLoadedPage = true;
    });

    try {
      final hashPwd = hashPassword(_newpasswordController.text);

      final result = await apiClient.resetPassword(
          email: resetPassWordController.email.value,
          code: resetPassWordController.resetCode.value,
          password: hashPwd);

      if (result["status"]) {
        await Future.delayed(Duration(seconds: 2));
        ScaffoldMessenger.of(context).showSnackBar(
            showSnackBar("Succès", result["message"], Colors.green));
        resetPassWordController.initValue();
        context.go("/account/login");
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
      ScaffoldMessenger.of(context)
          .showSnackBar(showSnackBar("Echec", message, Colors.red));
    }
  }

  @override
  void initState() {
    _confpasswordController = TextEditingController();
    _newpasswordController = TextEditingController();
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
          height: 10,
        ),
        SizedBox(
          width: 430,
          height: 380,
          child: Card(
            elevation: 30,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Veuillez fournir ou confirmer les renseignements suivants :",
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
                      height: 2,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _obsureText1,
                          controller: _newpasswordController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 8) {
                              return 'Le mot de passe doit avoir au moins de 8 caractères';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obsureText1 = !_obsureText1;
                                  });
                                },
                                child: Icon(_obsureText1
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              hintText: "Nouveau mot de passe",
                              /* prefixIcon:
                              Icon(Icons.vpn_key_sharp), */
                              contentPadding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2))),
                        ),
                        SizedBox(
                          height: 15, /* child: const Divider() */
                        ),
                        TextFormField(
                            obscureText: _obsureText2,
                            controller: _confpasswordController,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 8) {
                                return 'Le mot de passe doit avoir au moins de 8 caractères';
                              }
                               if (value == null || value.isEmpty) {
                                return "Ce champ est vide.";
                              }
                              if (value != _newpasswordController.text) {
                                return "Les mots de passe renseignés ne sont identiques.";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obsureText2 = !_obsureText2;
                                    });
                                  },
                                  child: Icon(_obsureText2
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                hintText: "Confirmer mot de passe",
                                /* prefixIcon:
                              Icon(Icons.vpn_key_sharp), */
                                contentPadding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2))),
                            
                            
                            
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          
                          width: 150,
                          height: 50,
                          child: InkWell(
                            onHover: (value) {
                              setState(() {
                                isHoveringbtn1 = value;
                              });
                            },
                            onTap: () {},
                            child: ElevatedButton(
                                onPressed: isLoadedPage
                                    ? null
                                    : () async {
                                        if (_formKey.currentState!.validate()) {
                                          //loadingResetpwd(context);
                                          /* resetPassWordController
                                              .resetStep.value = 1;
                                          context.go('/account/login'); */
                                          resetPwd(context);
                                        }
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isHoveringbtn1
                                      ? Colors.green
                                      : Color(0xFFFF7700),
                                  side:
                                      BorderSide(width: 1, color: Colors.black),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.maxFinite,
                                  height: 50,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: isLoadedPage
                                      ? SpinKitWave(
                                          color: Color(0xFFFF7700),
                                          size: 20,
                                        )
                                      : const CustomText(
                                          text: "Confirmer",
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        /* SizedBox(height: 55,),
        CopyRight(), */
      ],
    );
  }
}
