import 'package:flutter/material.dart';
import 'package:gang_app/ui/products/controllers/product_controller.dart';
import 'package:get/get.dart';

class BuildActionsSearch extends StatelessWidget {
  const BuildActionsSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return (productController.isSearching.value)
        ? IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              if (productController.searchQueryController == null ||
                  productController.searchQueryController.text.isEmpty) {
                Navigator.pop(context);
                return;
              }
              productController.clearSearchQuery();
            },
          )
        : IconButton(
            onPressed: () {
              ModalRoute.of(context)?.addLocalHistoryEntry(
                  LocalHistoryEntry(onRemove: productController.stopSearching));
              productController.isSearching.value = true;
            },
            icon: Icon(Icons.search),
          );
  }
}
