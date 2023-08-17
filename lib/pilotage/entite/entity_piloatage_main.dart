import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:login/pilotage/entite/widgets/app_bar_pilotage.dart';
import '../../../controller/auth_controller.dart';
// import '/views/pilotage/entite/widgets/app_bar_pilotage.dart';
import '../../../utils/utils.dart';
// import '../controllers/side_menu_controller.dart';
import '../controller/side_menu_controller.dart';
import 'widgets/drawer_menu_pilotage.dart';
import 'widgets/menu_nav_pilotage.dart';


class EntityPilotageMain extends StatefulWidget {
  final Widget child;
  const EntityPilotageMain({Key? key, required this.child}) : super(key: key);

  @override
  State<EntityPilotageMain> createState() => _EntityPilotageMainState();
}

class _EntityPilotageMainState extends State<EntityPilotageMain> {

  final SideMenuController sideMenuController = Get.put(SideMenuController());
  final AuthController authController  = Get.find();
  final storage = new FlutterSecureStorage();


  @override
  void initState() {
    loginTrigger(context: context,userModel :authController.userModel.value,route: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.round();
    String responsive = responsiveRule(width);
    return Obx( () {
      final userModel = authController.userModel.value;
      final shortName = "${userModel.prenom![0]}${userModel.nom![0]}";
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBarPilotage(shortName: shortName,),
        ),
        body: Scaffold(
          key: sideMenuController.scaffoldKey,
          drawer: const DrawerMenuPilotage(),
          body: Row(
            children: [MenuNavPilotage(responsive: responsive), Expanded(child: widget.child)],
          ),
        ),
      );
    });
  }
}
