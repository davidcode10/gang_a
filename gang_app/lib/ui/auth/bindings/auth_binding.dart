import 'package:gang_app/ui/auth/controller/auth_controller.dart';
import 'package:gang_app/ui/home/controllers/nav_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}