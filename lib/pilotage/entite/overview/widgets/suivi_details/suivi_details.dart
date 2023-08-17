import 'package:flutter/material.dart';

// import '../../../../../../constants/colors.dart';
import '../../../../../constant/colors.dart';
import 'chart_overview.dart';
import 'data_info_card.dart';

class SuiviDetails extends StatelessWidget {
  const SuiviDetails({
    Key? key,
  }) : super(key: key);

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
          Text(
            "Suivi des données",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: defaultPadding),
          const ChartOverview(),
          const DataInfoCard(
            svgSrc: "assets/icons/data_validated.png",
            title: "Données Validées",
            amountOfFiles: "450",
            numOfFiles: 1328,
            color: Colors.green,
          ),
          const DataInfoCard(
            svgSrc: "assets/icons/data_collect.png",
            title: "Données Collectées",
            amountOfFiles: "450",
            numOfFiles: 1328,
            color: Colors.amber,
          ),
          const DataInfoCard(
            svgSrc: "assets/icons/data_not_validated.png",
            title: "Données Non Collectées",
            amountOfFiles: "450",
            numOfFiles: 1328,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
