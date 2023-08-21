import 'package:flutter/material.dart';
// import '../../../../constants/colors.dart';
import '../../../../helper/responsive.dart';
import '../../../constant/colors.dart';
import 'widgets/suivi_details/collecte_globale_filiale.dart';
import 'widgets/suivi_details/section_suivi.dart';
import 'widgets/contributeur/liste_contributeur.dart';
import 'widgets/suivi_details/suivi_details.dart';

class OverviewPilotage extends StatelessWidget {
  const OverviewPilotage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5,child: Column(
          children: [
            // SizedBox(width: 20,),
            SectionSuivi(),
            SizedBox(height: 50),
            ListeContributeur()
          ],
        )),
        const SizedBox(width: defaultPadding,),
        Card(
          elevation: 30,
          child: Container(
            width: 300,
            height: 370,
            // decoration: BoxDecoration(color: Colors.white),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("Progrès de collecte globale usines",style: Theme.of(context).textTheme.titleMedium,),
              // SizedBox(height: defaultPadding),
              CollecteGlobale()
            ],
          ),),

        ),
        // const SizedBox(width: defaultPadding),
      ],
    ),
  );
}
}
