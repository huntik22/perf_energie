import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '/views/pilotage/controllers/tableau_controller.dart';
import '../../../../controller/tableau_controller.dart';
import 'row_pilier.dart';

class DashBoardListView extends StatefulWidget {
  const DashBoardListView({Key? key}) : super(key: key);

  @override
  State<DashBoardListView> createState() => _DashBoardListViewState();
}

class _DashBoardListViewState extends State<DashBoardListView> {
  late ScrollController _scrollController;

  final TableauBordController tableauBordController  = Get.find();


  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      final dropDownState = tableauBordController.dropDownState.value;
      return Theme(
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
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: true),
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Container(
                //padding: const EdgeInsets.only(right: 10.0),
                child: Column(
                  children: [
                    // RowPilier(idPilier: "pilier0",title: "Général",color: Colors.brown,dropDownState: dropDownState["pilier0"],),
                    RowPilier(idPilier: "pilier0",title: "Gouvernance énergétique",color: Color(0xFFEE8E16),dropDownState: dropDownState["pilier0"]),
                    RowPilier(idPilier: "pilier1",title: "Maîtrise opérationnelle",color: Color(0xFFEE8E16),dropDownState: dropDownState["pilier1"]),
                    RowPilier(idPilier: "pilier2",title: "Performance énergétique",color: Color(0xFFEE8E16),dropDownState: dropDownState["pilier2"]),
                    RowPilier(idPilier: "pilier3",title: "Amélioration du management énergétique",color: Color(0xFFEE8E16),dropDownState: dropDownState["pilier3"])
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
