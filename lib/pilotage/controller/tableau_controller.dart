import 'dart:convert';
import 'data.dart' as data;

import 'package:get/get.dart';
import '/models/pilotage/indicateur_model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class TableauBordController extends GetxController {

  final indicateurs = <IndicateurModel>[].obs;

  var dropDownState = Map().obs;

  final isIndicateursLoaded = false.obs;

  bool checkIndicateurs() {
    if (indicateurs.isNotEmpty ) {
      isIndicateursLoaded.value = true;
      return true;
    }
    isIndicateursLoaded.value = false;
    return false ;
  }

  Future<bool> loadIndicateurs() async {
    try {
      //final response = await http.get(Uri.parse('http://127.0.0.1:5000/v2/indicateur/list'));
      final statusCode = 200;

      if (statusCode == 200) {
        await Future.delayed(Duration(seconds: 3));
        //final dataJson = jsonDecode(response.body);
        //final listJson = dataJson["doc"] as List<dynamic>;
        final listJson = data.data;
        print(listJson.length);
        for (var i = 0; i < listJson.length ; i++) {
          indicateurs.add(IndicateurModel.fromJson(listJson[i]));
        }
        isIndicateursLoaded.value = true;
       return true;
      } else {
        developer.log('Failed to load indicateurs', name: 'IndicateurController');
        return false ;
      }
    } catch (e) {
      return false ;
    }
  }

  @override
  Future<void> onReady() async {
    developer.log('IndicateurController Ready', name: 'IndicateurController');
    await loadIndicateurs();
    super.onReady();
  }

  @override
  void onInit() {
    dropDownState.value = {
      "pilier0":{
        "value":false
      },
      "pilier1":{
        "value":true,
        "enjeu1a":false,
        "enjeu1b":false,
        "enjeu2":false,
        "enjeu3":false,
      },
      "pilier2":{
        "value":true,
        "enjeu4":false,
        "enjeu5":false,
        "enjeu6":false,
      },
      "pilier3":{
        "value":true,
        "enjeu7":false,
      },
      "pilier4":{
        "value":true,
        "enjeu8":false,
        "enjeu9":false,
        "enjeu10":false
      }
    };
    super.onInit();
  }
}