import 'package:flutter/material.dart';

import '../../../../../constant/colors.dart';

// import '../../../../../../constants/colors.dart';

class CollecteGlobale extends StatefulWidget {
  const CollecteGlobale({
    Key? key,
  }) : super(key: key);

  @override
  State<CollecteGlobale> createState() => _CollecteGlobaleState();
}

class _CollecteGlobaleState extends State<CollecteGlobale> {

  final entityInfos = [
    /* {
      "nom":"SUCRIVOIRE",
      "2022":65,
      "2023":78
    }, */
    {
      "nom":"Ayamé",
      "2022":25,
      "2023":68
    },
    {
      "nom":"Buyo",
      "2022":25,
      "2023":68
    },
    {
      "nom":"Kossou",
      "2022":70,
      "2023":45
    },
    {
      "nom":"Taabo",
      "2022":69,
      "2023":80
    },
    {
      "nom":"UTAG",
      "2022":69,
      "2023":80
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 370,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Progrès de collecte globale usines",style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 10,),
          DataTable(
              columnSpacing: 12,
              horizontalMargin: 12,
              columns: const [
                DataColumn(
                  label: Text("Usines"),
                ),
                DataColumn(
                  label: Text("2022"),
                ),
                DataColumn(
                  label: Text("2023"),
                ),
              ],
              rows: List.generate(
                entityInfos.length,
                    (index) => dataRow(entityInfos[index]),
              )
          )
        ],
      ),
    );
  }

  DataRow dataRow(Map entityInfo) {
    return DataRow(
      cells: [
        DataCell(Text(entityInfo["nom"])),
        DataCell(Text("${entityInfo["2022"]} %",style: TextStyle(fontWeight: FontWeight.bold,color: entityInfo["2022"] < 30 ?  Colors.red :
        entityInfo["2022"] < 60 ? Colors.yellow : entityInfo["2022"] < 75 ?
        Colors.green : Colors.blue),)),
        DataCell(Text("${entityInfo["2023"]} %",style: TextStyle(fontWeight: FontWeight.bold,color: entityInfo["2023"] < 30 ?  Colors.red :
        entityInfo["2023"] < 60 ? Colors.yellow : entityInfo["2023"] < 75 ?
        Colors.green : Colors.blue),))

      ],
    );
  }
}