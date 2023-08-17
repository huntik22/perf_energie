import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:iconsax/iconsax.dart';
// import '../../../../../constants/colors.dart';
import '../../../../../widgets/custom_full_screen_dialog.dart';
// import '../../../../../widgets/custom_text.dart';
import '../../../../../widgets/menu_deroulant.dart';
import '../../../../../widgets/unimpleted_widget.dart';
import '../../../../constant/colors.dart';
import '../../../../widgets/customtext.dart';

class EnteteTableauBord extends StatefulWidget {
  const EnteteTableauBord({Key? key}) : super(key: key);

  @override
  State<EnteteTableauBord> createState() => _EntityWidgetWidgetState();
}

class _EntityWidgetWidgetState extends State<EnteteTableauBord> {
  String? selectedValueYear;
  String? selectedValueMonth;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomText(
            text: "Année",
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          MenuDeroulant(
            indication: "",
            initValue: "2023",
            items: ["2021", "2022", "2023"],
            width: 100,
            selectedValue: selectedValueYear,
            onChanged2: (value) {},
          ),
          const SizedBox(
            width: 10,
          ),
          const CustomText(
            text: "Mois",
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          MenuDeroulant(
            initValue: "Juillet",
            indication: "",
            items: [
              "Janvier",
              "Février",
              "Mars",
              "Avril",
              "Mai",
              "Juin",
              "Juillet"
            ],
            width: 125,
            selectedValue: "Juillet",
          ),
          const SizedBox(
            width: 10,
          ),
          const CustomText(
            text: "Processus",
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          MenuDeroulant(
            initValue: "Processus",
            indication: "",
            items: [
              "Tous",
              "Administration",
              "Exploitation industrielle",
              "Habitat",
              "SME"
            ],
            width: 125,
            selectedValue: "Tous",
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                splashRadius: 20,
                padding: EdgeInsets.zero,
                onPressed: () async {},
                icon: const Icon(
                  Iconsax.refresh,
                  color: Color(0xFF4F80B5),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () {
                  UnimplementedWidget.showDialog();
                },
                icon: const Icon(
                  Iconsax.export,
                  color: Colors.white,
                ),
                label: const CustomText(
                  text: "Exporter",
                  color: light,
                  size: 15,
                )),
          ),
          Container(
              padding:
                  const EdgeInsets.only(right: 5, left: 5, top: 2, bottom: 2),
              decoration: BoxDecoration(
                border: Border.all(width: 3.0),
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
              child: const CustomText(
                text: "Collecteur",
                size: 15,
                color: Colors.black,
              ))
        ],
      ),
    
    );
  }
}
