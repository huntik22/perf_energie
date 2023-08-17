import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/resetPasswd/demande_reset_mail.dart';
import 'package:login/resetPasswd/confirmer_reset_passwd.dart';
import 'package:login/resetPasswd/entre_code_reset.dart';
import 'package:login/routes/routes.dart';
import 'controller/auth_controller.dart';
import 'loginpage.dart';
import 'package:login/resetPasswd/resetpasswordcontroller.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Get.put(ResetPassWordController());
  await Get.put(AuthController());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
    @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Performance Energie',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: RouteClass.router,
    );
  }
}



