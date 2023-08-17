import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/modules/styled_scrollview.dart';
import '../../../../widgets/copyright.dart';
import 'widgets/appbar_pilotage_accueil.dart';
import 'widgets/content_pilotage_accueil.dart';
import 'widgets/header_pilotage_accueil.dart';

class PilotageHome extends StatefulWidget {
  const PilotageHome({Key? key}) : super(key: key);

  @override
  State<PilotageHome> createState() => _PilotageHomeState();
}

class _PilotageHomeState extends State<PilotageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarPilotageHome(name: "Pilotage"),
          Expanded(
            child: StyledScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 750), // Définissez la hauteur maximale souhaitée
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Column(
                        children: const [
                          HeaderPilotageHome(),
                          SizedBox(height: 60,),
                          Expanded(child: ContentPilotageHome()),
                        ],
                      ),
                      /* Positioned(
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            context.go("/");
                          },
                          // child: Image.asset("assets/icons/page-daccueil.png",width: 75,),
                        ),
                      ) */
                    ],
                  ),
                ),
              ),
            ),
          ),
          const CopyRight(),
        ],
      ),
    );
  }
}
