import 'package:gang_app/ui/home/controllers/nav_controller.dart';
import 'package:get/instance_manager.dart';

class NavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavController());
  }
}