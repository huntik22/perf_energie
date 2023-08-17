// import 'package:login/models/common/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/common/user_models.dart';

class ApiClient {

  static const String baseUrl = "http://127.0.0.1:5000";

  Future<UserModel> login({required email, required password}) async {
    final response = await http.post(
        Uri.parse(baseUrl+"/user/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': email,
          'password': password,
        }),
    );

    if (response.statusCode == 200) {

      final user = UserModel.fromJson(jsonDecode(response.body));

      print(user);

      return user;

    } else if (response.statusCode == 400) {
       final jsonData = jsonDecode(response.body);
       throw Exception(jsonData["message"]);
    }
    else {
      throw Exception('La connexion a échoué.');
    }
  }

  Future<Map<String,dynamic>> forgotPassword({required email}) async {

    final response = await http.post(
      Uri.parse(baseUrl+"/user/forgot-password"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {

      final Map<String,dynamic> jsonData = jsonDecode(response.body);

      return jsonData;

    } else if (response.statusCode == 400) {
      final jsonData = jsonDecode(response.body);
      throw Exception(jsonData["message"]);
    }
    else {
      throw Exception("La réquête a échoué veuillez réessayer.");
    }
  }


  Future<Map<String,dynamic>> resetPassword({required email,required code,required password}) async {

    final response = await http.post(
      Uri.parse(baseUrl+"/user/reset-password"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'token_code':code,
        'password':password
      }),
    );

    if (response.statusCode == 200) {

      final Map<String,dynamic> jsonData = jsonDecode(response.body);

      return jsonData;

    } else if (response.statusCode == 400) {
      final jsonData = jsonDecode(response.body);
      throw Exception(jsonData["message"]);
    }
    else {
      throw Exception("La réquête a échoué veuillez réessayer.");
    }
  }

}