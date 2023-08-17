import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/widgets/bannier.dart';
import 'package:login/mainpage/custom_cadre.dart';
import 'package:login/mainpage/header_mainpage.dart';
import 'package:login/widgets/copyright.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  // final AuthController authController  = Get.find();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Accès refusé'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Vous n'avez pas l'accès à cet espace."),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/forbidden.png",
                  width: 50,
                  height: 50,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        body: Column(
          children: [
            HeaderMainPage(),
            Expanded(child: Container(
              padding:const EdgeInsets.all(5.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/background_image.jpg"),
                        fit: BoxFit.fitWidth)),
              child: (
                Padding(padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                      text: "Bienvenue dans ",
                                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(text: "Performance ",style: TextStyle(color:  Color((0xFFFF7700)))),
                                        TextSpan(text: "ENERGIE",style: TextStyle(color: Color(0xFF2A9836))),
                                      ]
                                  ),
                                ),
                                /* Image.asset(
                                  "assets/images/logo_cie.png",
                                  height: 50,
                                  width: 200,
                                ), */
                              ],
                            ),
                            const SizedBox(
                              height: 20,),
                            const Center(child:Banniere(),),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomCadre(                               
                                  onTap: () async {
                                    /* _showMyDialog(); */
                                  },
                                  imagePath: "assets/images/audit.png",
                                  titreCadre: "Audit",
                                ),
                                CustomCadre(

                                  onTap: (){
                                    context.go('/pilotage');
                                  },
                                  imagePath: "assets/images/pilotage.png",
                                  titreCadre: "Pilotage",
                                ),
                                CustomCadre(
                                  onTap: (){
                                    /* _showMyDialog(); */
                                  },
                                  imagePath: "assets/images/rapport.png",
                                  titreCadre: "Rapport",
                                ),
                              ],
                            )
                      ],
                    )
                  ],
                ))
              ),
            )
            ),
            const CopyRight() 
            ],
        ),
      ),
    );
  }
}
