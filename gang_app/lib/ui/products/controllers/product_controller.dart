import 'package:gang_app/model/product_model.dart';
import 'package:gang_app/services/firestore/firestore_service_products.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  Rx<List<ProductModel>> productsList = Rx<List<ProductModel>>([]);
  void onReady() {
    productsList.bindStream(DataBaseProducts().productsStream());
    super.onReady();
  }
}
