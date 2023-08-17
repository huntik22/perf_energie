import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../constant/colors.dart';
import '../../widgets/customtext.dart';
import '/modules/styled_scrollview.dart';

// import '../../../../widgets/custom_text.dart';
import 'overview_card.dart';
// import 'overview_item.dart';
import 'overview_items.dart';

class ContentPilotageHome extends StatefulWidget {
  const ContentPilotageHome({Key? key}) : super(key: key);

  @override
  State<ContentPilotageHome> createState() => _ContentPilotageHomeState();
}

class _ContentPilotageHomeState extends State<ContentPilotageHome> {
  ScrollController scrollController = ScrollController();
  double mheight = 150;
  double height = 200;
  double bHeight = 250;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Wrap(
          spacing: 10,
          runSpacing: 4.0,
          children: [
            Container(
              height: 380,
              width: 550,
              // margin: EdgeInsets.only(left: 20),
              child: Container(
                width: 200,
                /* decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green, width: 2.0)), */
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
                          text: "SUIVI DES DONNEES",
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 300,
                            width: 160,
                            child: OverviewCard(
                              title: "CONSOLIDE",
                              titleColor: ma_couleur,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const CustomText(
                                      text: "GENERAL",
                                      weight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 300,
                            width: 160,
                            child: OverviewCard(
                              title: "PERIMETRES",
                              titleColor: ma_couleur,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const CustomText(
                                      text: "Siège",
                                      weight: FontWeight.bold,
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: const CustomText(
                                      text: "SME-DP",
                                      weight: FontWeight.bold,
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: const CustomText(
                                      text: "Base Niangon",
                                      weight: FontWeight.bold,
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: const CustomText(
                                      text: "CME",
                                      weight: FontWeight.bold,
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: const CustomText(
                                      text: "Dispatching",
                                      weight: FontWeight.bold,
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: const CustomText(
                                      text: "Distribution",
                                      weight: FontWeight.bold,
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: const CustomText(
                                      text: "DME",
                                      weight: FontWeight.bold,
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: const CustomText(
                                      text: "Parc-auto",
                                      weight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 300,
                            width: 160,
                            child: OverviewCard(
                              title: "USINES",
                              titleColor: ma_couleur,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      context
                                          .go('/pilotage/espace/ayame/accueil');
                                    },
                                    child: const CustomText(
                                      text: "Ayamé",
                                      weight: FontWeight.bold,
                                      isTooltip: true,
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: const CustomText(
                                      text: "Kossou",
                                      weight: FontWeight.bold,
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: const CustomText(
                                      text: "Taabo",
                                      weight: FontWeight.bold,
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: const CustomText(
                                      text: "UTAG",
                                      weight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              height: 370,
              width: 550,
              // margin: EdgeInsets.only(left: 20),
              child: Container(
                width: 200,
                /* decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green, width: 2.0)), */
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
                          text: "GESTION SME",
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 25,),
                        Expanded(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                            height: 300,
                            width: 230,
                            child: OverviewCard(
                              title: "",
                              titleColor: ma_couleur,
                              children: [
                                SizedBox(height: 5,),
                                TextButton(
                                onPressed: () {},
                                child: const CustomText(
                                  text: "Politique SME",
                                  color: /* activeBlue */ Colors.black,
                                  weight: FontWeight.bold,
                                )),
                                SizedBox(height: 5,),
                            TextButton(
                                onPressed: () {},
                                child: const CustomText(
                                  text: "Attentes des parties intéressées",
                                  color: Colors.black,
                                  weight: FontWeight.bold,
                                )),
                                SizedBox(height: 5,),
                            TextButton(
                                onPressed: () {},
                                child: const CustomText(
                                  text: "Responsabilités et autorités",
                                  color: Colors.black,
                                  weight: FontWeight.bold,
                                )),
                                SizedBox(height: 5,),
                            TextButton(
                                onPressed: () {},
                                child: const CustomText(
                                  text: "Fonction/Périmètre",
                                  color: Colors.black,
                                  weight: FontWeight.bold,
                                )),
                                SizedBox(height: 5,),
                            TextButton(
                                onPressed: () {},
                                child: const CustomText(
                                  text:
                                      "Non conformités et actions correctives",
                                  color: Colors.black,
                                  weight: FontWeight.bold,
                                )),
                              ],
                            ),
                          ),
                            
                          ],
                        )),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                            height: 300,
                            width: 230,
                            child: OverviewCard(
                              title: "",
                              titleColor: ma_couleur,
                              children: [
                                SizedBox(height: 5,),
                                TextButton(
                              onPressed: () {},
                              child: const CustomText(
                                text: "Suivi des objectifs énergétiques",
                                color: Colors.black,
                                weight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5,),
                            TextButton(
                                onPressed: () {},
                                child: const CustomText(
                                  text: "Revues de management énergétique",
                                  color: Colors.black,
                                  weight: FontWeight.bold,
                                )),
                                SizedBox(height: 5,),
                            TextButton(
                                onPressed: () {},
                                child: const CustomText(
                                  text: "Audit interne",
                                  color: Colors.black,
                                  weight: FontWeight.bold,
                                )),
                                SizedBox(height: 5,),
                            TextButton(
                                onPressed: () {},
                                child: const CustomText(
                                  text: "Risques et opportunités",
                                  color: Colors.black,
                                  weight: FontWeight.bold,
                                )),
                                SizedBox(height: 5,),
                            TextButton(
                                onPressed: () {},
                                child: const CustomText(
                                  text: "Revues énergétiques",
                                  color: Colors.black,
                                  weight: FontWeight.bold,
                                )),
                              ],
                            ),
                          ),
                            
                          ],
                        )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Element extends StatelessWidget {
  const Element({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      color: Colors.red,
    );
  }
}
