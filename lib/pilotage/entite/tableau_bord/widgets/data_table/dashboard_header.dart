import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardHeader extends StatefulWidget {
  const DashBoardHeader({Key? key}) : super(key: key);

  @override
  State<DashBoardHeader> createState() => _DashBoardHeaderState();
}

class _DashBoardHeaderState extends State<DashBoardHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        height: 30,
        width: double.maxFinite,
        color: Colors.white,
        child: Row(
          children: [
            DashBoardHeaderTitle(color: Color((0xFFFF7700)), size: 70,title: "Id",),
            DashBoardHeaderTitle(color: Color((0xFFFF7700)), size: 400,title: "Indicateurs",),
            DashBoardHeaderTitle(color: Color((0xFFFF7700)), size: 170,title: "Processus",),
            DashBoardHeaderTitle(color: Color((0xFFFF7700)), size: 150,title: "Réalisé 2023",),
            DashBoardHeaderTitle(color: Color((0xFFFF7700)), size: 170,title: "Juillet",),
            DashBoardHeaderTitle(color: Color((0xFFFF7700)), size: 100,title: "Ecart",),
            DashBoardHeaderTitle(color: Color((0xFFFF7700)), size: 100,title: "Cible",),
          ],
        ),
      ));
  }
}

class DashBoardHeaderTitle extends StatefulWidget {
  final double size;
  final Color color;
  final String title;
  const DashBoardHeaderTitle({Key? key, required this.size, required this.color, required this.title}) : super(key: key);

  @override
  State<DashBoardHeaderTitle> createState() => _DashBoardHeaderTitleState();
}

class _DashBoardHeaderTitleState extends State<DashBoardHeaderTitle> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      onHover: (value){
        setState(() {
          isHovering = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.only(left: 2.0),
        width: widget.size,
        color: isHovering ? Color((0xFFFF7700)) :widget.color,
        alignment: Alignment.centerLeft,
        child: Text("${widget.title}",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
      ),
    );
  }
}

