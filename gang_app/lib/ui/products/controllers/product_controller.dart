import 'package:gang_app/model/product_model.dart';
import 'package:gang_app/services/firestore/firestore_service_products.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  Rx<List<ProductModel>> productsList = Rx<List<ProductModel>>([]);
  Rx<List<ProductModel>> productsCategoryList = Rx<List<ProductModel>>([]);
  List<String> categoryProducts = ['Man', 'Woman', 'Kids', 'Tools'];
  void onReady() {
    productsList.bindStream(DataBaseProducts().productsStream());
    super.onReady();
  }

  Future<List<ProductModel>> categorySelected(String category) async {
    productsCategoryList.value = [];
    for (var element in productsList.value) {
      if (element.productCategory == category) {
        productsCategoryList.value.add(element);
      }
    }
    return productsCategoryList.value;
  }
}
