import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gang_app/controller/auth_controller.dart';
import 'package:gang_app/pages/home_page.dart';
import 'package:gang_app/pages/loading_page.dart';
import 'package:gang_app/pages/login.dart';
import 'package:gang_app/theme/app_theme.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put<AuthController>(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Material App', home: const LoadingPage(), theme: appTheme);
  }
}
