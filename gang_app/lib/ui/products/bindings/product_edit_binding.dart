import 'package:gang_app/ui/products/controllers/product_edit_controller.dart';
import 'package:get/get.dart';

class ProductEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductEditController());
  }
}