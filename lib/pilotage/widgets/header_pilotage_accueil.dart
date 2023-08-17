import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/bannier.dart';
import '../../constant/colors.dart';
import '../../widgets/customtext.dart';

class HeaderPilotageHome extends StatefulWidget {
  const HeaderPilotageHome({Key? key}) : super(key: key);

  @override
  State<HeaderPilotageHome> createState() => _HeaderPilotageHomeState();
}

class _HeaderPilotageHomeState extends State<HeaderPilotageHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: CustomText(
              text: "PILOTAGE PERFOMANCE ENERGIE",
              weight: FontWeight.bold,
              size: 30,
            ),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          height: 200,
          decoration: BoxDecoration(color: Colors.transparent),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             /*  Container(
                height: 150,
                width: 200,
                margin: EdgeInsets.only(right: 30),
                child: Image.asset('assets/images/barage_cie.jpg'),
              ), */
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 6),
                              color: lightGrey.withOpacity(.1),
                              blurRadius: 12)
                        ],
                        border: Border.all(color: lightGrey, width: .5),),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/images/banniere_energ.png',
                          height: 450,
                          fit: BoxFit.cover,
                        )),
                  )),
              /* Container(
                height: 150,
                width: 250,
                margin: EdgeInsets.only(left: 20),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green, width: 2.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: CustomText(
                            text: "Ressources",
                            color: Colors.black,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                      /* TextButton.icon(
                          onPressed: () {
                            context.go('/pilotage/ressoures/organigramme');
                          },
                          icon: const Icon(
                            Icons.account_tree,
                            color: Colors.amber,
                          ),
                          label: Text("Organigramme",
                              style: TextStyle(color: activeBlue))
                      ), */
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.telegram,
                            color: Colors.green,
                          ),
                          label: Text("Stratégie",
                              style: TextStyle(color: activeBlue))
                      ),
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person,
                            color: Colors.orange,
                          ),
                          label: Text("Contributeurs",
                              style: TextStyle(color: activeBlue))),
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.batch_prediction,
                            color: Colors.brown,
                          ),
                          label: Text(
                            "Politique ENERGIE",
                            style: TextStyle(color: activeBlue),
                          ))
                    ],
                  ),
                ),
              ), */
            ],
          ),
        ),
      ],
    );
  }
}
