import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gang_app/model/product_model.dart';
import 'package:gang_app/services/firestore/firestore_services.dart';

class DataBaseProducts {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static String _collection = "products";
  static FirestoreService _service = FirestoreService(_collection);

  Future<bool> createNewProduct(ProductModel product) async {
    try {
      product.uid = _service.generateId();
      await _firestore.collection(_collection).doc(product.uid).set({
        "uid": product.uid,
        "name": product.name,
        "description": product.description,
        "photoUrl": product.photoUrl,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// GENERATE ID
  String generateIdProduct() {
    return FirebaseFirestore.instance.collection(_collection).doc().id;
  }
}