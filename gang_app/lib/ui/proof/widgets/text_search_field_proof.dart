import 'package:flutter/material.dart';
import 'package:gang_app/ui/proof/controllers/product_proof_controller.dart';
import 'package:get/get.dart';

class TextSearchFieldProof extends StatelessWidget {
  const TextSearchFieldProof({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProofController productProofController = Get.find();
    return TextField(
      controller: productProofController.searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
          hintText: "Search Data....",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white30)),
      style: TextStyle(color: Colors.white, fontSize: 16),
      onChanged: (query) => productProofController.updateSearchQuery(query),
    );
  }
}
