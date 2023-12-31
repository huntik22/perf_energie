import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:login/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'api/api_client.dart';
import 'controller/auth_controller.dart';
// import 'helper/helper_methods.dart';
import 'helper/helper_methods.dart';
import 'widgets/copyright.dart';
import 'widgets/customtext.dart';
import 'package:supabase/supabase.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:login/api/api_client.dart';

class LogPage extends StatefulWidget {
  const LogPage({Key? key}) : super(key: key);

  @override
  State<LogPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LogPage> {
  final AuthController authController = Get.find();
  final ApiClient apiClient = ApiClient();
  final storage = new FlutterSecureStorage();
  User? _user;
  final _formKey = GlobalKey<FormState>();
  bool _obsureText = true;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool isLoadedPage = false;

  bool isHovering = false;

  bool onLogging = false;
  bool isLogging = false;

  void loadingLoginPage(BuildContext context) async {
    setState(() {
      isLoadedPage = true;
    });
    try {
      final hashPwd = hashPassword(_passwordController.text);
      final result = await apiClient.login(
          email: _emailController.text, password: hashPwd);
      authController.userModel.value = result;
      await storage.write(key: 'logged', value: "true");
      await storage.write(key: 'email', value: result.email);
      await storage.write(key: 'jwt', value: hashPwd);
      await Future.delayed(Duration(seconds: 2));
      context.go("/");
      setState(() {
        isLoadedPage = false;
      });
    } on Exception catch (e) {
      final message = e.toString().split("Exception: ").join("");
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        isLoadedPage = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(showSnackBar("Echec", message, Colors.red));
    }
  }
   /* Future<void> _getAuth() async {
    setState(() {
      _user = Supabase.instance.client.auth.currentUser;
    });
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      setState(() {
        _user = data.session?.user;
      });
    });
  } */

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    // _getAuth();
    super.initState();
  }

  void goToMainPage() async {
    final storage = new FlutterSecureStorage();
    String? loggedPref = await storage.read(key: 'logged');

    if (loggedPref != null && loggedPref == "true") {
      GoRouter.of(context).go('/');
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
  
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/fond_accueil.jpg",
                    ),
                    fit: BoxFit.cover)),child:
      
                Row(
                    children: [
                      if (width.round()>900)
                       Expanded(

                          // flex: 5,
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [
                              Row(
                                children: [
                            
                                  Text("Performance  ", style: TextStyle(
                              fontSize: 40, color: Colors.orange, fontStyle: FontStyle.italic
                            ) ,),
                                  Text("ENERGIE", style: TextStyle(
                              fontSize: 40, color: Colors.green, fontStyle: FontStyle.italic
                            ) ,),
                                ],
                              ),
                            
                            SizedBox(height: 20,),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child:Image.asset("assets/images/image_ordi.png",
                                fit: BoxFit.fitWidth,)))                          
                          ],)
                          ),
                      Expanded(
                        // flex: 3,
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 600 ,
                                child: Image.asset(
                                  "assets/images/logo_perfenerg.png", /* height: 150/factor, */
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 400,
                                height: 400 ,
                                child: Card(
                                  elevation: 25,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20.0, top: 20.0, left: 20.0),
                                    child: Form(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      key: _formKey,
                                      child: Column(
                                        // mainAxisAlignment:
                                        // MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Se connecter",
                                            style: TextStyle(
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold,
                                                // color: const Color.fromARGB(255, 42, 40, 40)),
                                                color: Colors
                                                    .green /* const Color(0xFFAAA095) */),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Column(
                                            children: [
                                              TextFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty ||
                                                      !GetUtils.isEmail(
                                                          value)) {
                                                    return 'Svp veuillez entrer un mail correct';
                                                  }
                                                  return null;
                                                },
                                                decoration: const InputDecoration(
                                                    hintText: "Email",
                                                    suffixIcon:
                                                        Icon(Icons.email),
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 20.0),
                                                    border:
                                                        OutlineInputBorder(),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2))),
                                                controller: _emailController,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              TextFormField(
                                                obscureText: _obsureText,
                                                controller: _passwordController,
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
                                                          _obsureText =
                                                              !_obsureText;
                                                        });
                                                      },
                                                      child: Icon(_obsureText
                                                          ? Icons.visibility
                                                          : Icons
                                                              .visibility_off),
                                                    ),
                                                    hintText: "Mot de passe",
                                                    /* prefixIcon:
                                              Icon(Icons.vpn_key_sharp), */
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 20.0),
                                                    border:
                                                        const OutlineInputBorder(),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2))),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          InkWell(
                                            onHover: (value) {
                                              setState(() {
                                                isHovering = value;
                                              });
                                            },
                                            onTap: () {},
                                            child: ElevatedButton(
                                                onPressed: isLoadedPage
                                                    ? null
                                                    : () async {
                                                        if (_formKey
                                                            .currentState!
                                                            .validate()) {
                                                          loadingLoginPage(
                                                              context);
                                                        }
                                                      },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Color(0xFFFF9B11),
                                                    side: BorderSide(
                                                        width: 1,
                                                        color:
                                                            Colors.transparent),
                                                    shape: StadiumBorder()
                                                    // shape: isHovering ? StadiumBorder() : RoundedRectangleBorder(),
                                                    ),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: double.maxFinite,
                                                  height: 50,
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: isLoadedPage
                                                      ? SpinKitWave(
                                                          color: Colors.black,
                                                          size: 20,
                                                        )
                                                      : const CustomText(
                                                          text: "Se connecter",
                                                          color: Colors.white,
                                                          size: 20,
                                                        ),
                                                )),
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                context.go(
                                                    '/account/forgot-password');
                                              },
                                              child: const CustomText(
                                                text:
                                                    "Récupérer votre mot de passe",
                                                color: Colors.blue,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        ),
        const CopyRight()
      ],
    ));
  }
}
