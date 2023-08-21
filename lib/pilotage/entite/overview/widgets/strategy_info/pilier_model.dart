import 'package:flutter/material.dart';

// import '../../../../../../constants/colors.dart';

class PilierInfoModel {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;


  PilierInfoModel({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoPiliers = [
  PilierInfoModel(
    title: " GOUVERNANCE\n ENERGETIQUE",
    numOfFiles: 50,
    svgSrc: "assets/icons/gouvernance.png",
    totalStorage: "125",
    color: Colors.purple,
    percentage: 45,
  ),
  PilierInfoModel(
    title: " MAITRISE\n OPERATIONNELLE",
    numOfFiles: 80,
    svgSrc: "assets/icons/economie.png",
    totalStorage: "120",
    color: Color(0xFF007EE5),
    percentage: 70,
  ),
  PilierInfoModel(
    title: " PERFORMANCE\n ENERGETIQUE",
    numOfFiles: 20,
    svgSrc: "assets/icons/social.png",
    totalStorage: "140",
    color: Colors.amber,
    percentage: 15,
  ),
  PilierInfoModel(
    title: " AMELIORATION DU\n MANAGEMENT ENERGETIQUE",
    numOfFiles: 63,
    svgSrc: "assets/icons/environnement.png",
    totalStorage: "70",
    color: Colors.green,
    percentage: 88,
  ),
];
