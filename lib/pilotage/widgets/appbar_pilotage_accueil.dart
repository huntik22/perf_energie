import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constant/colors.dart';
import '../../widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';
import '../../../../widgets/export_widget.dart';

class AppBarPilotageHome extends StatefulWidget {
  final String name;
  const AppBarPilotageHome({Key? key, required this.name}) : super(key: key);

  @override
  State<AppBarPilotageHome> createState() => _AppBarPilotageHomeState();
}

class _AppBarPilotageHomeState extends State<AppBarPilotageHome> {
  @override
  Widget build(BuildContext context) {
    List<QudsPopupMenuBase> getMenuItems() {
      String avatarString = "SE";
      return [
        QudsPopupMenuItem(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: Center(
                child: CustomText(
                  text: avatarString,
                  color: Colors.white,
                  weight: FontWeight.bold,
                ),
              ),
            ),
            title: const Text(
              'Serge EBRA',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            subTitle: Text('sergeebra@ayame.ci'),
            onPressed: () {}),
        QudsPopupMenuDivider(),
        QudsPopupMenuItem(
            leading: const Icon(Icons.person,color: Colors.blue,size: 30,),
            title: const Text(
              'Mon Profil',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            subTitle: const Text('Informations du compte et plus'),
            onPressed: () {
            }),
        QudsPopupMenuWidget(
            builder: (c) => Container(
                padding: const EdgeInsets.all(10),
                width: 200,
                child: IntrinsicHeight(
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Voulez-vous quitter cette application ?'),
                              content: const SizedBox(width:200,child: Text('Nous sommes désolés de vous voir partir...')),
                              actionsAlignment: MainAxisAlignment.spaceBetween,
                              actions: <Widget>[
                                OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Non'),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    context.go('/account/login');
                                  },
                                  child: Text('Oui'),
                                ),
                              ],
                            );
                          },);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF8CE0C),
                        shape: const StadiumBorder(),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const CustomText(
                          text: "Se déconnecter",
                          color: Colors.white,
                        ),
                      )),
                )))
      ];
    }
    return Container(
      height: 60,
      color: Color(0xFFFF7700),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Container(   
                height: 100,           
                decoration: BoxDecoration(
                  color: Colors.transparent
                ),
                child: Image.asset(
                "assets/images/logo_perfenerg.png",
                height: 50,
              ),
              ),
              
              const SizedBox(
                width: 100,
              ),
              CustomText(
                text: "Accueil Pilotage",
                color: Colors.white,
                weight: FontWeight.bold,
                size: 30,
              )
            ],
          ),
          Row(
            children: [
              const Center(
                child: CustomText(
                  text: "Serge EBRA",
                  color: Colors.white,
                  weight: FontWeight.bold,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              QudsPopupButton(
                items: getMenuItems(),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Center(
                    child: CustomText(
                      text: "SE",
                      color: Colors.white,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              TextButton(
                child: const Text(
                  "A propos de Perf ENERGIE",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                     /*  decoration: TextDecoration.underline */ ),
                ),
                onPressed: () async {
                  const url = "https://huboutils.visionstrategie.com";
                  final uri = Uri.parse(url);
                  if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                  }
                  else {
                  throw "Could not launch $url";
                  }
                },
              ),
              const SizedBox(
                width: 30,
              ),
            ],
      /* String avatarString = "SE";
      return [
        QudsPopupMenuItem(
            leading: CircleAvatar(
              backgroundColor: Color(0xFFFFFF00),
              child: Center(
                child: CustomText(
                  text: avatarString,
                  color: Color(0xFFF1C232),
                  weight: FontWeight.bold,
                ),
              ),
            ),
            title: const Text(
              'Serge EBRA',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            subTitle: Text('sergeebra@sucrivoire.ci'),
            onPressed: () {}),
        QudsPopupMenuDivider(),
        QudsPopupMenuItem(
            leading: const Icon(Icons.person,color: Colors.blue,size: 30,),
            title: const Text(
              'Mon Profil',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            subTitle: const Text('Informations du compte et plus'),
            onPressed: () {
            }),
        QudsPopupMenuWidget(
            builder: (c) => Container(
                padding: const EdgeInsets.all(10),
                width: 200,
                child: IntrinsicHeight(
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Voulez-vous quitter cette application ?'),
                              content: const SizedBox(width:200,child: Text('Nous sommes désolés de vous voir partir...')),
                              actionsAlignment: MainAxisAlignment.spaceBetween,
                              actions: <Widget>[
                                OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Non'),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    context.go('/account/login');
                                  },
                                  child: Text('Oui'),
                                ),
                              ],
                            );
                          },);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        shape: const StadiumBorder(),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const CustomText(
                          text: "Se déconnecter",
                          color: Colors.white,
                        ),
                      )),
                )))
      ];
    }
    return Container(
      height: 60,
      color: const Color(0xFFAAA095),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                "assets/logos/perf_rse.png",
                height: 50,
              ),
              const SizedBox(
                width: 20,
              ),
              CustomText(
                text: "Accueil ${widget.name}",
                color: Colors.black,
                weight: FontWeight.bold,
                size: 30,
              )
            ],
          ),
          Row(
            children: [
              const Center(
                child: CustomText(
                  text: "Serge EBRA",
                  color: Colors.white,
                  weight: FontWeight.bold,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              QudsPopupButton(
                items: getMenuItems(),
                child: const CircleAvatar(
                  backgroundColor: Color(0xFFFFFF00),
                  child: Center(
                    child: CustomText(
                      text: "SE",
                      color: Color(0xFFF1C232),
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              TextButton(
                child: const Text(
                  "A propos de Perf Energie",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      decoration: TextDecoration.underline),
                ),
                onPressed: () {},
              ),
              const SizedBox(
                width: 30,
              ),
            ], */
          )
        ],
      ),
    );
  }
}


