import 'package:flutter/material.dart';
import 'package:gang_app/services/firestore/firestore_service_products.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataBaseProducts dataBaseProducts = DataBaseProducts();
    return Scaffold(
      body: Center(
        child: Text("Page 1"),
      ),
    );
  }
}
