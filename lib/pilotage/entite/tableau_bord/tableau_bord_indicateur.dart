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

class TableauBordIndicateur extends StatefulWidget {
  const TableauBordIndicateur({Key? key}) : super(key: key);

  @override
  State<TableauBordIndicateur> createState() => _TableauBordIndicateurState();
}

class _TableauBordIndicateurState extends State<TableauBordIndicateur> {
  final tableauBordController =  Get.put(TableauBordController());
  late ScrollController _scrollController;


  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
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
  }
}


