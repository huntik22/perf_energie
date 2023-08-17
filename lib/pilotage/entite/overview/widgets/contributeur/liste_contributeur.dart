import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// import '../../../../../../constants/colors.dart';
import '../../../../../../helper/responsive.dart';
import '../../../../../constant/colors.dart';
import 'contributeur_model.dart';

class ListeContributeur extends StatefulWidget {
  const ListeContributeur({
    Key? key,
  }) : super(key: key);

  @override
  State<ListeContributeur> createState() => _ListeContributeurState();
}

class _ListeContributeurState extends State<ListeContributeur> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Liste des contributeurs",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                    defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text("Ajouter"),
              )
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
                columnSpacing: 12,
                horizontalMargin: 12,
                columns: const [
                  DataColumn(
                    label: Text("Nom"),
                  ),
                  DataColumn(
                    label: Text("Filiale"),
                  ),
                  DataColumn(
                    label: Text("Accès"),
                  ),
                ],
                rows: List.generate(
                  demoContributeurs.length,
                      (index) => contributeursDataRow(demoContributeurs[index]),
                )
            ),
          )
        ],
      ),
    );
  }

  DataRow contributeursDataRow(ContributeurModel fileInfo) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Image.asset(
                fileInfo.photo_url!,
                height: 30,
                width: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(fileInfo.name!),
              ),
            ],
          ),
        ),
        DataCell(Text(fileInfo.entite!)),
        DataCell(Text(fileInfo.access!)),
      ],
    );
  }
}



