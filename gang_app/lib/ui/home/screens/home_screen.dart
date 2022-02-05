import 'package:flutter/material.dart';
import 'package:gang_app/global_widgets/animations/overlay_animation.dart';
import 'package:gang_app/global_widgets/navigation/custom_navigation_bar.dart';
import 'package:gang_app/ui/auth/controller/auth_controller.dart';
import 'package:gang_app/ui/home/controllers/nav_controller.dart';
import 'package:gang_app/ui/home/screens/product_home_screen.dart';
import 'package:gang_app/ui/profile/screens/profile_screen.dart';
import 'package:gang_app/ui/proof/screens/page1.dart';
import 'package:gang_app/ui/proof/screens/page2.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavController navController = Get.find();
    var screens = [
      Page1(),
      Page2(),
      ProductHomeScreen(),
      ProfileScreen(),
    ];

    AuthController authController = AuthController();

    // AuthController authController = Get.find();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.of(context).push(OverlayAnimation());
            },
          ),
        ),
        bottomNavigationBar: CustomNavigationBar(
          selectedIndex: navController.index.value,
          onIndexChanged: (i) {
            navController.index.value = i;
          },
        ),
        body: screens[navController.index.value],
      ),
    );
  }
}