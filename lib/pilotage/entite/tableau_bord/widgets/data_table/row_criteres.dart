import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../models/pilotage/indicateur_model.dart';
import '../../../../controller/tableau_controller.dart';
import 'row_indicateur.dart';

final listIndicateurs = [
  IndicateurModel(
      id: "1",
      // reference: "GOUV1a-001",
      terminologie: "",
      intitule: "Chiffre d'affaires de l'entreprise",
      type: "Primaire",
      unite: "Nombre",
      ipe: "",
      definition: "Somme de tous les biens et services",
      processus: ["Administration"],
      // gri: "2-9",
      // odd: "16",
      data: 5,
      validated: true,
      formule: "Dernier mois renseigné",
      numero: 32,
      frequence: 12
  ),
  IndicateurModel(
      id: "2",
      // reference: "GOUV1a-002",
      terminologie: "",
      intitule: "Femmes dans le Conseil d'Administration",
      type: "Primaire",
      unite: "Nombre",
      ipe: "",
      definition: "",
      processus: ["Juridique"],
      gri: "2-9",
      odd: "5",
      formule: "Dernier mois renseigné",
      numero: 33,
      frequence: 12
  ),
  IndicateurModel(
      id: "3",
      reference: "GOUV1a-003",
      terminologie: "Système de gouvernance",
      intitule: "Taux de femmes dans le Conseil d'Administration",
      type: "Calculé",
      unite: "%",
      ipe: "",
      definition: "",
      processus: ["Juridique"],
      // gri: "2-9",
      // odd: "5",
      formule: "Dernier mois renseigné",
      numero: 34,
      frequence: 12
  ),
  IndicateurModel(
      id: "4",
      reference: "GOUV1a-004",
      terminologie: "Système de gouvernance",
      intitule: "Membres du Comité de Direction",
      type: "Primaire",
      unite: "Nombre",
      ipe: "",
      definition: "",
      processus: ["Juridique"],
      // gri: "2-9",
      // odd: "16",
      formule: "Dernier mois renseigné",
      numero: 35,
      frequence: 12
  ),
  IndicateurModel(
      id: "5",
      reference: "GOUV1a-005",
      terminologie: "Système de gouvernance",
      intitule: "Femme dans le Comité de Direction",
      type: "Primaire",
      unite: "Nombre",
      definition: "",
      processus: ["Juridique"],
      // gri: "2-10",
      // odd: "17",
      formule: "Dernier mois renseigné",
      numero: 36,
      frequence: 12
  ),
  IndicateurModel(
      id: "6",
      // reference: "GOUV1a-005",
      terminologie: "Communication",
      intitule: "Femme dans le Comité de Direction",
      type: "Primaire",
      unite: "Nombre",
      definition: "",
      processus: ["Juridique"],
      // gri: "2-10",
      // odd: "17",
      formule: "Dernier mois renseigné",
      numero: 36,
      frequence: 12
  ),
];

class RowCritere extends StatefulWidget {
  final String numero;
  final String idPilier;
  final String idCritere;
  final String critereTitle;
  final Map dropDownState;
  final Color color;
  const RowCritere(
      {Key? key,
        required this.critereTitle,
        required this.idCritere,
        required this.dropDownState,
        required this.idPilier,
        required this.color,
        required this.numero})
      : super(key: key);

  @override
  State<RowCritere> createState() => _RowCritereState();
}

class _RowCritereState extends State<RowCritere> {

  final TableauBordController tableauBordController  = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          padding: const EdgeInsets.only(left: 100),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: widget.color.withOpacity(0.7),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(4.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${widget.numero}. ${widget.critereTitle}",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              RotatedBox(
                quarterTurns: widget.numero == "1a" ? 1 : 3,
                child: IconButton(
                  splashRadius: 10,
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 15,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    if (widget.dropDownState[widget.idCritere]) {
                      //pDashBoardController.changeStateEnjeu(widget.idPilier, widget.idEnjeu, false);
                    } else {
                      //pDashBoardController.changeStateEnjeu(widget.idPilier, widget.idEnjeu, true);
                    }
                  },
                ),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
        ),
        Visibility(
          visible: widget.numero == "1a" ? true : false,
          child: Column(
            children: getIndicateurWidget()
            ,
          ),
        )
      ],
    );
  }

  List<Widget> getIndicateurWidget(){
    return listIndicateurs.map((indicateur) => RowIndicateur(indicateur: indicateur)).toList();
  }

}