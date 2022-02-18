import 'package:flutter/material.dart';
import 'package:gang_app/model/product_model.dart';
import 'package:gang_app/ui/products/controllers/product_controller.dart';
import 'package:get/instance_manager.dart';

class RowCategories extends StatelessWidget {
  final List<String> categories;
  const RowCategories({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ElevatedButton(
            onPressed: () async {
              productController.productsCategoryList.value =
                  await productController.categorySelected(categories[index]);
              productController.updateSearchQuery(
                  productController.searchQueryController.text);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green[300])),
            child: Text(categories[index]),
          ),
        );
      },
    );
  }
}
