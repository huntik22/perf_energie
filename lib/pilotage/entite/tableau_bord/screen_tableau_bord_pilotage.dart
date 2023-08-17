import 'package:flutter/material.dart';
import '../../../../helper/helper_methods.dart';
import '../../../../widgets/privacy_widget.dart';
import 'screen_indicateur.dart';
import 'tableau_bord_pilotage..dart';

class ScreenTableauBordPilotage extends StatefulWidget {
  /// Constructs a [ScreenTableauBordPilotage] widget.
  const ScreenTableauBordPilotage({Key? key}) : super(key: key);

  @override
  State<ScreenTableauBordPilotage> createState() => _ScreenTableauBordPilotageState();
}

class _ScreenTableauBordPilotageState extends State<ScreenTableauBordPilotage> {
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image.jpg'), // Remplace avec le bon chemin de ton image de fond.
            fit: BoxFit.cover,
          ),
        ),
        child:Padding(
        padding: EdgeInsets.only(top: 16,left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tableau de bord",style: TextStyle(fontSize: 24,color: Color(0xFF3C3D3F),fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            _isLoaded ? Expanded(
              child: Column(
                children: [
                  Expanded(child: Center(
                    child: TableauBordPilotage2(),
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
      )
      
    );
  }
}