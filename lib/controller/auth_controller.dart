import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
// import 'package:perfrse/models/common/user_model.dart';

import '../api/api_client.dart';
import '../models/common/user_models.dart';

class AuthController extends GetxController {

  var userModel = UserModel(email: "").obs;
  var isAlreadyConnected = false.obs;
  final storage = new FlutterSecureStorage();
  final ApiClient apiClient = ApiClient();

  void checkIslogin(){
    if (GetUtils.isEmail(userModel.value.email)){
      isAlreadyConnected.value = true;
    } else {
      isAlreadyConnected.value = false;
    }
  }

  Future initUser() async {
    userModel.value = UserModel(email: "");
    String? loggedPref = await storage.read(key: 'logged');
    if (loggedPref != null && loggedPref == "true") {
      try {
        String? email = await storage.read(key: 'email');
        String? jwt = await storage.read(key: 'jwt');
        final result = await apiClient.login(email: email, password: jwt);
        userModel.value = result;
      } catch(e) {
        final msg = e.toString();
      }
    }
    // If user is connected
  }


  @override
  Future<void> onInit() async {
    await initUser();
    checkIslogin();
    super.onInit();
  }

}