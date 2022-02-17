import 'package:flutter/material.dart';
import 'package:gang_app/ui/proof/controllers/product_proof_controller.dart';
import 'package:get/get.dart';

class BuildActionsSearch extends StatelessWidget {
  const BuildActionsSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProofController productProofController = Get.find();
    return (productProofController.isSearching.value)
        ? IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              if (productProofController.searchQueryController == null ||
                  productProofController.searchQueryController.text.isEmpty) {
                Navigator.pop(context);
                return;
              }
              productProofController.clearSearchQuery();
            },
          )
        : IconButton(
            onPressed: () {
              ModalRoute.of(context)?.addLocalHistoryEntry(LocalHistoryEntry(
                  onRemove: productProofController.stopSearching));
              productProofController.isSearching.value = true;
            },
            icon: Icon(Icons.search),
          );
  }
}