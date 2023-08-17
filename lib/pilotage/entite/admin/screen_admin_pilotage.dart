import 'package:flutter/material.dart';
import '../../../../helper/helper_methods.dart';
import '../../../../widgets/privacy_widget.dart';
import 'admin_pilotage.dart';


class ScreenPilotageAdmin extends StatefulWidget {
  /// Constructs a [ScreenPilotageAdmin] widget.
  const ScreenPilotageAdmin({Key? key}) : super(key: key);

  @override
  State<ScreenPilotageAdmin> createState() => _ScreenPilotageAdminState();
}

class _ScreenPilotageAdminState extends State<ScreenPilotageAdmin> {
  bool _isLoaded = false;


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
            Text("Panneau d'administration",style: TextStyle(fontSize: 24,color: Color(0xFF3C3D3F),fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            _isLoaded ? Expanded(
              child: Column(
                children: [
                  Expanded(child: Container(
                    child: AdministrationPilotage(),
                  )),
                  SizedBox(height: 10,),
                  PrivacyWidget(),
                  SizedBox(height: 20,),
                ],
              ),
            ) : Expanded(
              child: Column(
                children: [
                  Expanded(child: Center(
                    child: loadingPageWidget(),//const SpinKitRipple(color: Colors.blue,),
                  )),
                  SizedBox(height: 20,),
                  PrivacyWidget(),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}