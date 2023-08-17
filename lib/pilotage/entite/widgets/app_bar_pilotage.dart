import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:login/constant/colors.dart';
import '../../../../utils/utils.dart';
// import '../../../../widgets/custom_text.dart';
// import '../../controllers/side_menu_controller.dart';
import '../../../widgets/customtext.dart';
import '../../controller/side_menu_controller.dart';
import 'entity_widget_pilotage.dart';

class AppBarPilotage extends StatefulWidget {
  final String shortName;
  const AppBarPilotage({Key? key,  required this.shortName}) : super(key: key);

  @override
  State<AppBarPilotage> createState() => _AppBarPilotageState();
}

class _AppBarPilotageState extends State<AppBarPilotage> {

  final SideMenuController sideMenuController = Get.find();

  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.round();
    String responsive = responsiveRule(width);
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.orange,
          border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
              top: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (responsive == "cas-4"){
                sideMenuController.controlMenuCas4();
              }else {
                sideMenuController.controlMenu();
              }
            },
            splashRadius: 20,
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.menu,
              size: 30,
              color: Colors.black,
            ),
            hoverColor: Colors.orange,
          ),
          SizedBox(
            width: responsive == "cas-0" ? 10 : 20,
          ),
          responsive == "cas-0" ? Container() : Image.asset("assets/logos/logo_cie1.png", height: 40, fit: BoxFit.fitWidth),
          SizedBox(
            width: responsive == "cas-0" ? 10 : 20,
          ),
          responsive == "cas-0" ? Text("Ayamé ",style: TextStyle(fontSize: 18),) : const EntityWidget(),
          Expanded(child: Container()),
          const Icon(
            Icons.notifications_none_outlined,
            size: 30,
            color: Colors.black,
          ),
          SizedBox(
            width: responsive == "cas-0" ? 10 : 20,
          ),
          InkWell(
            onTap: (){
              context.go("/pilotage/espace/ayame/profil");
            },
            radius: 20,
              child: CircleAvatar( backgroundColor: Colors.black,
                child: Center(child: CustomText(text: "${widget.shortName}",color: Colors.white,weight: FontWeight.bold,),)),
            ),//Image.asset("assets/images/person1.png", height: 50,width: 50, fit: BoxFit.fitWidth)),
        ],
      ),
    );
  }
}
