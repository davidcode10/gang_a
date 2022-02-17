import 'package:flutter/material.dart';
import 'package:gang_app/model/product_model.dart';
import 'package:gang_app/ui/home/widgets/card_product.dart';

class GridCardProduct extends StatelessWidget {
  final List<ProductModel> listProduct;
  const GridCardProduct({Key? key, required this.listProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.8,
      ),
      itemCount: listProduct.length,
      itemBuilder: (context, index) {
        return CardProduct(
          productModel: listProduct[index],
        );
      },
    );
  }
}
