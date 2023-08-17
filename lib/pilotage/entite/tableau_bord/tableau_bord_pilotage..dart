import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/pilotage/entite/tableau_bord/widgets/data_table/row_indicateur.dart';
import 'package:login/widgets/specialcopyright.dart';
import '../../../../widgets/privacy_widget.dart';
import '../../../constant/colors.dart';
import '../../controller/tableau_controller.dart';
import 'widgets/collecte_status.dart';
import 'widgets/dasboard_filtre.dart';
import 'widgets/data_table/dashboard_header.dart';
import 'widgets/data_table/dashboard_list_view.dart';
import 'widgets/entete_widget.dart';
import 'package:go_router/go_router.dart';
/* class TableauBordPilotage extends StatefulWidget {
  const TableauBordPilotage({Key? key}) : super(key: key);

  @override
  State<TableauBordPilotage> createState() => _TableauBordPilotageState();
}

class _TableauBordPilotageState extends State<TableauBordPilotage> {

  final tableauBordController =  Get.put(TableauBordController());
  late ScrollController _scrollController;


  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: defaultPadding,right: defaultPadding,bottom: defaultPadding,top: 5),
      color: Colors.orange,
      child: Obx((){
        return Column(
          children: [
            // const EnteteTableauBord(),
            // const DashBoardFiltre(),
            // CollecteStatus(),
            // DashBoardHeader(),
            /*Expanded(child: Column(
              children: [
                DashBoardListView(),
                Text("${tableauBordController.indicateurs}"),
              ],
            )),*/
            Expanded(child: Theme(
              data: Theme.of(context).copyWith(scrollbarTheme: ScrollbarThemeData(
                trackColor:  MaterialStateProperty.all(Colors.black12),
                trackBorderColor: MaterialStateProperty.all(Colors.black38),
                thumbColor: MaterialStateProperty.all(Colors.black),
                interactive: true,
              )),
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                thickness: 8,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Column(
                      children: tableauBordController.indicateurs.map(
                              (indicateur) => RowIndicateur(indicateur: indicateur)
                      ).toList(),
                    ),
                  ),
                ),
              ),
            ))
          ],
        );
      }),
    );
  }
} */


class TableauBordPilotage2 extends StatefulWidget {
  const TableauBordPilotage2({Key? key}) : super(key: key);

  @override
  State<TableauBordPilotage2> createState() => _TableauBordPilotage2State();
}

class _TableauBordPilotage2State extends State<TableauBordPilotage2> {
  final tableauBordController =  Get.put(TableauBordController());
  late ScrollController _scrollController;


  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  /* Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          EnteteTableauBord(),
          SizedBox(height: 20,),
          DashBoardFiltre(),
          CollecteStatus(),
          SizedBox(height: 20,),
          DashBoardHeader(),
          Expanded(child: Theme(
            data: Theme.of(context).copyWith(scrollbarTheme: ScrollbarThemeData(
              trackColor:  MaterialStateProperty.all(Colors.black12),
              trackBorderColor: MaterialStateProperty.all(Colors.black38),
              thumbColor: MaterialStateProperty.all(Color(0xFF80868B)),
              interactive: true,
            )),
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              thickness: 8,
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    children: const [
                      // DashBoardListView(),
                      SizedBox(height: 20,),
                      // PrivacyWidget(),
                      // Specialcopyright(),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  } */
  Widget build(BuildContext context) {
    return Container(
      /* decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fond_accueil.jpg'),
          fit: BoxFit.cover,
        ),
      ), */
      // color: Colors.transparent,
      width: 800,
      height: 500,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          StrategyButton(
            postionLeft: 0,
            onTap: (){
              context.go("/pilotage/espace/ayame/tableau-de-bord/indicateurs");
            },
            crossAxisAlignment: CrossAxisAlignment.start,
            margin: const EdgeInsets.only(right: 25,bottom: 25),//EdgeInsets.only(right: 25,top: 25),
            postionBotton: 250,
            colors: [Colors.green, Colors.green, Colors.green,Colors.green],
            // colors: [Colors.green, Color(0xFF76A278), Color(0xFFA3C1A5),Color(0xFFE0EAE1)],
            widgets: [
              Container(width:320,child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Image.asset("assets/icons/social.png",width: 20,height: 20,),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: 270,height: 30,
                    child: Text("GOUVERNANCE ENERGETIQUE",maxLines: 2,style: TextStyle(
                        color: Colors.white,fontSize: 18,fontStyle: FontStyle.italic
                    ),),
                  )
                ],
              )),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 20,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        child: Center(child: Text("1",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(width: 300,height: 20, child: Text("Contexe énergétique et engagement",maxLines: 1,))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 20,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        child: Center(child: Text("2",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(width: 300,height: 20, child: Text("Risques, empreintes et opportunités énergétique",maxLines: 2,))
                  ],
                ),
              ),
              // SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 20,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        child: Center(child: Text("3",style: TextStyle(color: Colors.white,fontSize: 12),)),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(width: 300,height: 20, child: Text("Management énergétique",maxLines: 1,))
                  ],
                ),
              ),
            ],),
          StrategyButton(
            postionLeft: 400,
            crossAxisAlignment: CrossAxisAlignment.start,
            margin:  EdgeInsets.only(left: 25,bottom: 25),//EdgeInsets.only(right: 25,top: 25),
            postionBotton: 250,
            colors: [Colors.blue, Colors.blue, Colors.blue,Colors.blue],
            // colors: [Colors.blue, Color(0xFF6BB9F7), Color(0xFF9CD0F9),Color(0xFFBDDFFB)],
            widgets: [
              Container(width:370,child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Image.asset("assets/icons/social.png",width: 20,height: 20,),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: 320,height: 30,
                    child: Text("MAITRISE OPERATIONNELLE",maxLines: 2,style: TextStyle(
                        color: Colors.white,fontSize: 18,fontStyle: FontStyle.italic
                    ),),
                  )
                ],
              )),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 20,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        child: Center(child: Text("4",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(width: 230,height: 20, child: Text("Processus et usages énergétiques",maxLines: 2,))
                  ],
                ),
              ),
              // SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 20,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        child: Center(child: Text("5",style: TextStyle(color: Colors.white,fontSize: 12),)),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(width: 230,height: 20, child: Text("Soutien",maxLines: 2,))
                  ],
                ),
              ),
              // SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 20,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        child: Center(child: Text("6",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(width: 230,height: 20, child: Text("Planification",maxLines: 2,))
                  ],
                ),
              ),
              SizedBox(height: 5,),
              /* Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        child: Center(child: Text("3",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(width: 230,height: 40, child: Text("Mesurage",maxLines: 2,))
                  ],
                ),
              ), */
            ],),
          StrategyButton(
            postionLeft: 400,
            postionBotton: 0,
            crossAxisAlignment: CrossAxisAlignment.start,
            margin: EdgeInsets.only(left: 25,top: 25),
            colors: [Colors.amber,Colors.amber, Colors.amber, Colors.amber],
            // colors: [Colors.amber,Color(0xFFFFEB3B), Color(0xFFFFF17C), Color(0xFFFFFAD3)],
            widgets: [
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Container(width:320,child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Image.asset("assets/icons/social.png",width: 20,height: 20,),
                    ),
                    // SizedBox(width: 5,),
                    Container(
                      width: 280,height: 30,
                      child: Text(" PERFORMANCE ENERGETIQUE",maxLines: 2,style: TextStyle(
                          color: Colors.white,fontSize: 18,fontStyle: FontStyle.italic
                      ),),
                    )
                  ],
                )),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 20,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle
                              ),
                              child: Center(child: Text("7",style: TextStyle(color: Colors.white),)),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Container(width: 230,height: 20, child: Text("Mesurage",maxLines: 2,))
                        ],
                      ),
                    ),
                    SizedBox(height: 0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 20,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle
                              ),
                              child: Center(child: Text("8",style: TextStyle(color: Colors.white),)),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Container(width: 230,height: 20, child: Text("Analyse et évaluation",maxLines: 2,))
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    /* Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle
                              ),
                              child: Center(child: Text("6",style: TextStyle(color: Colors.white),)),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Container(width: 250,height: 20, child: Text("Management énergétique",maxLines: 1,))
                        ],
                      ),
                    ), */
                  ],
                ),
              ),
            ],
          ),
          StrategyButton(
            postionLeft: 0,
            crossAxisAlignment: CrossAxisAlignment.start,
            margin: EdgeInsets.only(right: 25,top: 25),//EdgeInsets.only(right: 25,top: 25),
            postionBotton: 0,
            colors: [Color(0xFFF36C2B), Color(0xFFF36C2B), Color(0xFFF36C2B), Color(0xFFF36C2B)],
            // colors: [Color(0xFFF36C2B), Color(0xFFF89D61), Color(0xFFFABA8D), Color(0xFFFDD6B9)],
            widgets: [
              Container(width:340,child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Image.asset("assets/icons/social.png",width: 20,height: 20,),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: 300,height: 80,
                    child: Text("AMELIORATION DU MANAGEMENT\n ENERGETIQUE",maxLines: 2,style: TextStyle(
                        color: Colors.white,fontSize: 18,fontStyle: FontStyle.italic
                    ),),
                  )
                ],
              )),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 20,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        child: Center(child: Text("9",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(width: 230,height: 20, child: Text("Amélioration",maxLines: 2,))
                  ],
                ),
              ),
            ],),
          /* Positioned(
              left: 260,
              bottom: 110,
              child: Container(
                height: 280,
                width: 280,
                decoration: const BoxDecoration(
                    color: Color(0xFFFDFDFD),
                    shape: BoxShape.circle
                ),
                child: Center(
                 /*  child: Container(
                    height: 250,
                    width: 250,
                    decoration: const BoxDecoration(
                        color: Colors.brown,
                        shape: BoxShape.circle
                    ),
                    child: Center(child: Text("GÉNÉRAL",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),)),
                  ), */
                ),
              )
          ), */
        ],
      ),
    );
  }
}

class StrategyButton extends StatefulWidget {
  final double postionLeft;
  final double postionBotton;
  final List<Widget> widgets;
  final List<Color> colors;
  final EdgeInsetsGeometry margin;
  final CrossAxisAlignment crossAxisAlignment;
  final Function()? onTap;
  const StrategyButton({Key? key, required this.postionLeft,
     required this.postionBotton,
     required this.widgets,
     required this.colors, 
     required this.margin,
     required this.crossAxisAlignment, this.onTap}) : super(key: key);

  @override
  State<StrategyButton> createState() => _StrategyButtonState();
}

class _StrategyButtonState extends State<StrategyButton> {
  double elevation = 20;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: widget.postionLeft,
        bottom: widget.postionBotton,
        child: InkWell(
          onTap: widget.onTap,
          child: Container(
            padding: widget.margin,
            width: 400,height: 250,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: widget.colors,
                    stops: [0.3,0.5,0.7,0.9],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: widget.crossAxisAlignment,
                children: widget.widgets,
              ),
            ),
          ),
        )
    );
  }
}


