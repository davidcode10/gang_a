import 'package:flutter/material.dart';
import 'package:gang_app/model/product_model.dart';
import 'package:gang_app/ui/home/widgets/product_image.dart';
import 'package:gang_app/ui/products/pages/product_details.dart';
import 'package:get/get.dart';

class CardProduct extends StatelessWidget {
  final ProductModel productModel;
  const CardProduct({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductDetails(
            productModel: productModel,
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (productModel.photoUrl != null)
              Expanded(
                flex: 7,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: ProductImage(
                    imageUrl: productModel.photoUrl!,
                  ),
                ),
              ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: Text("${productModel.name}"),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: Text(
                  "${productModel.realPrice}",
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
