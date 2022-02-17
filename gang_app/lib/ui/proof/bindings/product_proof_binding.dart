import 'package:gang_app/ui/proof/controllers/product_proof_controller.dart';
import 'package:get/get.dart';

class ProductProofBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductProofController());
  }
}
