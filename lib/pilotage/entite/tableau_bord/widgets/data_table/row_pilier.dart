import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../controller/tableau_controller.dart';
import '/models/pilotage/indicateur_model.dart';
// import '/views/pilotage/controllers/tableau_controller.dart';
import 'row_enjeu.dart';
import 'row_indicateur.dart';

class RowPilier extends StatefulWidget {
  final String idPilier;
  final String title;
  final Color color;
  final Map dropDownState;
  const RowPilier({Key? key, required this.title, 
  required this.color, 
  required this.dropDownState,
  required this.idPilier}) : super(key: key);

  @override
  State<RowPilier> createState() => _RowPilierState();
}

class _RowPilierState extends State<RowPilier> {

  var listIconData = {
    "pilier0":Icons.camera_outlined, "pilier1":Icons.manage_accounts, "pilier2":Icons.money,
    "pilier3":Iconsax.people, "pilier4":Iconsax.tree,
  };

  final TableauBordController tableauBordController  = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color:Colors.transparent,
                border: Border.all(color: widget.color,width: 2.0),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0),topRight: Radius.circular(4.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 4,bottom: 4,right: 14,left: 20),
                child: Row(
                  children: [
                    Icon(listIconData[widget.idPilier],color: widget.color,size: 24,),
                    SizedBox(width: 20,),
                    Text(widget.title,style: TextStyle(color: widget.color,fontSize: 16,fontWeight: FontWeight.bold),),
                    Expanded(child: Container()),
                    RotatedBox(
                      quarterTurns: widget.dropDownState["value"] ? 1:3,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),
                        splashRadius: 20,
                        onPressed: (){
                          if (widget.dropDownState["value"]){
                            //pDashBoardController.changeStatePilier(widget.idPilier, false);
                          }else {
                            //pDashBoardController.changeStatePilier(widget.idPilier, true);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: widget.dropDownState["value"],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getPilierSubWidget(widget.idPilier)
              ),
            )
          ],
        )
    );
  }

  List<Widget> getPilierSubWidget(String idPilier ){
    switch(idPilier){
      case "pilier0" :
        return getIndicateurWidgetGeneral();
      case "pilier1" :
        return [
          SizedBox(height: 1,),
          RowEnjeu(numero:"1a",idPilier: widget.idPilier,idEnjeu: "enjeu1a",enjeuTitle: "Gouvernance DD et stratégie",dropDownState: widget.dropDownState,color: widget.color,),
          SizedBox(height: 1,),
          RowEnjeu(numero:"1b",idPilier: widget.idPilier,idEnjeu: "enjeu1b",enjeuTitle: "Pilotage DD",dropDownState: widget.dropDownState,color: widget.color),
          SizedBox(height: 1,),
          RowEnjeu(numero:"2",idPilier: widget.idPilier,idEnjeu: "enjeu2",enjeuTitle: "Éthique des affaires et achats responsables",dropDownState: widget.dropDownState,color: widget.color),
          SizedBox(height: 1,),
          RowEnjeu(numero:"3",idPilier: widget.idPilier,idEnjeu: "enjeu3",enjeuTitle: "Intégration des attentes DD des clients et consommateurs",dropDownState: widget.dropDownState,color: widget.color,),
          SizedBox(height: 1,),
        ];
      case "pilier2" :
        return [
          SizedBox(height: 1,),
          RowEnjeu(numero:"4",idPilier: widget.idPilier,idEnjeu: "enjeu4",enjeuTitle: "Égalité de traitement",dropDownState: widget.dropDownState,color: widget.color,),
          SizedBox(height: 1,),
          RowEnjeu(numero:"5",idPilier: widget.idPilier,idEnjeu: "enjeu5",enjeuTitle: "Conditions de travail",dropDownState: widget.dropDownState,color: widget.color),
          SizedBox(height: 1,),
          RowEnjeu(numero:"6",idPilier: widget.idPilier,idEnjeu: "enjeu6",enjeuTitle: "Amélioration du cadre de vie",dropDownState: widget.dropDownState,color: widget.color),
          SizedBox(height: 1,),
        ];
      case "pilier3" :
        return [
          SizedBox(height: 1,),
          RowEnjeu(numero:"7",idPilier: widget.idPilier,idEnjeu: "enjeu7",enjeuTitle: "Inclusion sociale et développement des communautés",dropDownState: widget.dropDownState,color: widget.color,),
          SizedBox(height: 1,),
        ];
      case "pilier4" :
        return [
          SizedBox(height: 1,),
          RowEnjeu(numero:"8",idPilier: widget.idPilier,idEnjeu: "enjeu8",enjeuTitle: "Changement climatique et déforestation",dropDownState: widget.dropDownState,color: widget.color),
          SizedBox(height: 1,),
          RowEnjeu(numero:"9",idPilier: widget.idPilier,idEnjeu: "enjeu9",enjeuTitle: "Gestion et traitement de l’eau",dropDownState: widget.dropDownState,color: widget.color),
          SizedBox(height: 1,),
          RowEnjeu(numero:"10",idPilier: widget.idPilier,idEnjeu: "enjeu10",enjeuTitle: "Gestion des ressources et déchets",dropDownState: widget.dropDownState,color: widget.color,),
          SizedBox(height: 1,),
        ];
      default:
        return [
          Text("default"),
        ];
    }
  }


  List<Widget> getIndicateurWidgetGeneral(){
    List<IndicateurModel> listIndicateurs = tableauBordController.indicateurs.where((indicateur) => indicateur.idEnjeu == "enjeu0").toList();

    return listIndicateurs.map((indicateur) => RowIndicateur(indicateur: indicateur)).toList();
  }

}
