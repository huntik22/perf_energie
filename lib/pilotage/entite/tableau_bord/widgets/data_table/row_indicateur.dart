import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../models/pilotage/indicateur_model.dart';
import 'dashboard_utils.dart';

class RowIndicateur extends StatefulWidget {
  final IndicateurModel indicateur;
  const RowIndicateur({Key? key, required this.indicateur})
      : super(key: key);

  @override
  State<RowIndicateur> createState() => _RowIndicateurState();
}

class _RowIndicateurState extends State<RowIndicateur> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHovering = value;
        });
      },
      child: Material(
        elevation: isHovering ? 10 : 0,
        child: Container(
          padding: const EdgeInsets.only(left: 2.0),
          decoration: BoxDecoration(
            border: isHovering ? Border.all(color: Colors.black, width: 1.0) : null,
            color: widget.indicateur.type != "Primaire" ? Color(0xFFFDDDCC) : Colors.transparent,
          ),
          height: 40,
          child: Row(
            children: [
              // Réf
              Container(
                height: 40,
                width: 120,
                alignment: Alignment.centerLeft,
                color: Colors.transparent,
                child: Row(
                  children: [
                    if (isHovering)
                      const Icon(
                        Icons.mouse,
                        size: 12,
                      ),
                    if (isHovering)
                      const SizedBox(
                        width: 2,
                      ),
                    Text(
                      "#${widget.indicateur.numero} ${widget.indicateur.reference}",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              // Intitule
              Container(
                height: 40,
                width: 400,
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
                child: Text(
                  "${widget.indicateur.intitule}",
                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              // Processus
              Container(
                height: 40,
                width: 170,
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
                child: Text(widget.indicateur.processus![0],
                    style: const TextStyle(fontStyle: FontStyle.italic,fontSize: 12)),
              ),
              // Réalise Annuel
              Container(
                  height: 40,
                  width: 150,
                  color: Colors.transparent,
                  alignment: Alignment.centerLeft,
                  child: buildRealiseAnColumn(widget.indicateur.data)),
              // Réalise Mois
              Container(
                height: 40,
                width: 170,
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
                child: buildRealiseMoisColumn(context,widget.indicateur.data),
              ),
              Container(
                height: 40,
                width: 100,
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
                child: const Text("XXXX",
                    style: TextStyle(color: Colors.blueAccent)),
              ),
              Container(
                height: 40,
                width: 95,
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
                child: const Text("+XX %", style: TextStyle(color: Colors.green)),
              ),
              const SizedBox(width: 10,),
              const Center(child: Icon(Icons.more_vert_sharp))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRealiseAnColumn(num? data) {
    return  Row(
        children: [
          Container(
            height: 40,
            width: 110,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(data ==null ?"": "${data} ",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "(${widget.indicateur.unite!})",
                  style: TextStyle(fontStyle: FontStyle.italic,fontSize: 12),
                )
              ],
            ),
          ),
          Checkbox(value: false, onChanged: null ),
          SizedBox(width: 3,),
          Container(height: 35,color: Colors.grey,width: 2,)
        ],
      );
  }

  Widget buildRealiseMoisColumn(BuildContext context,num? data) {
    List<Icon> icons = [
      const Icon(
        Icons.verified,
        color: Colors.green,
      ),
      const Icon(
        Icons.circle,
        color: Colors.yellow,
      ),
      const Icon(
        Icons.circle,
        color: Colors.red,
      ),
    ];

    final num? dataValue = data;
    final bool? dataValidation = false;
    final estConsolide = false;

    return Row(
        children: [
          Container(width: 64,height: 40,alignment: Alignment.center,child: Text("${dataValue ?? " -- "}")),
          Container(width: 32,height: 40,alignment: Alignment.centerLeft,
            child: (widget.indicateur.type! == "Primaire" && dataValidation != true && estConsolide == false) ? IconButton(splashRadius: 20,splashColor: Colors.amber,
            onPressed: () {
              renseignerLaDonnee(context,widget.indicateur,dataValue,"Juillet");
            },icon: const Icon(Icons.edit, size: 12,)):null
          ),
          Container(width: 32,height: 40,alignment: Alignment.centerLeft,
            child: dataValidation != true ? Padding(padding: const EdgeInsets.only(right: 2.0, left: 2.0),
              child: Checkbox(checkColor: Colors.white, fillColor: dataValidation == true ? MaterialStateProperty.all(Colors.green) : null,
                value: dataValidation ?? false,
                onChanged: null,
              ),
            ):null
          ),
          Container(width: 32,height: 40,alignment: Alignment.centerLeft,
            child: dataValidation != true ? dataValue == null ? icons[2] : icons[1] : icons[0],
          ),
          SizedBox(width: 3,),
          Container(height: 35,color: Colors.grey,width: 2,)
        ],
      );
  }

  String getIdDoc(String idIndicateur) {
    return idIndicateur;
  }

  Future validateDataIndicator(bool? value, int numeroIndicateur) async {}

  Future<bool> renseignerLaDonnee(BuildContext context,IndicateurModel indicator, num? value, String? mois) async {
    if (indicator.intitule != null && mois != null) {
      DashBoardUtils.editDataRow(context,indicator, value, mois);
      return true;
    }
    return false;
  }
}
