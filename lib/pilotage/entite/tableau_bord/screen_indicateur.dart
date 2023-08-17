import 'package:flutter/material.dart';
import '../../../../helper/helper_methods.dart';
import '../../../../widgets/privacy_widget.dart';
import 'screen_indicateur.dart';
import 'tableau_bord_indicateur.dart';
import 'tableau_bord_pilotage..dart';

class ScreenTableauBordIndicateur extends StatefulWidget {
  /// Constructs a [ScreenTableauBordPilotage] widget.
  const ScreenTableauBordIndicateur({Key? key}) : super(key: key);

  @override
  State<ScreenTableauBordIndicateur> createState() => _ScreenTableauBordIndicateurState();
}

class _ScreenTableauBordIndicateurState extends State<ScreenTableauBordIndicateur> {
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
            Text("Tableau de bord",style: TextStyle(fontSize: 24,color: Color(0xFF3C3D3F),fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            _isLoaded ? Expanded(
              child: Column(
                children: [
                  Expanded(child: Container(
                    child: TableauBordIndicateur(),
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