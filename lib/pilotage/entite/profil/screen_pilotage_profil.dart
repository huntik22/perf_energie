import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
// import 'package:perfrse/models/pilotage/acces_pilotage_model.dart';
import '../../../../controller/auth_controller.dart';
import '../../../../helper/helper_methods.dart';
import '../../../../utils/utils.dart';
import '../../../models/pilotage/access_pilotage_model.dart';
import 'profil_pilotage.dart';


class ScreenPilotageProfil extends StatefulWidget {
  /// Constructs a [ScreenPilotageProfil] widget.
  const ScreenPilotageProfil({Key? key}) : super(key: key);

  @override
  State<ScreenPilotageProfil> createState() => _ScreenPilotageProfilState();
}

class _ScreenPilotageProfilState extends State<ScreenPilotageProfil> {


  bool _isLoaded = false;
  final AuthController authController  = Get.find();
  final storage = new FlutterSecureStorage();


  void loadScreen() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    loadScreen();
  }

  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.round();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 16,left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Profil",style: TextStyle(fontSize: 24,color: Color(0xFF3C3D3F),fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            _isLoaded ? Expanded(
              child: Column(
                children: [
                  Expanded(child: Container(
                    child: Obx((){
                      final userModel = authController.userModel.value;
                      final accesPilotageModel = AccesPilotageModel();
                      return ProfilPilotage(userModel: userModel, accesPilotageModel: accesPilotageModel);
                    }),
                  ))
                ],
              ),
            ) : Expanded(
              child: Column(
                children: [
                  Expanded(child: Center(
                    child: loadingPageWidget(),//const SpinKitRipple(color: Colors.blue,),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}