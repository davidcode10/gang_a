import 'package:flutter/material.dart';
import 'package:gang_app/model/product_model.dart';
import 'package:gang_app/services/firestore/firestore_service_products.dart';

class ProductController {
  TextEditingController nameProduct = TextEditingController();
  TextEditingController originalPrice = TextEditingController();
  TextEditingController realPrice = TextEditingController();
  TextEditingController descriptionProduct = TextEditingController();
  DataBaseProducts dataBaseProducts = DataBaseProducts();

  Future<bool> createProduct(ProductModel product) async {
    return dataBaseProducts.createNewProduct(product);
  }
}
