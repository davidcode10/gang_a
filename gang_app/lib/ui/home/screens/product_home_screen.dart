import 'package:flutter/material.dart';
import 'package:gang_app/routes/app_pages.dart';
import 'package:gang_app/theme/color_theme.dart';
import 'package:gang_app/ui/home/widgets/product_image.dart';
import 'package:gang_app/ui/products/controllers/product_controller.dart';
import 'package:gang_app/ui/products/controllers/product_edit_controller.dart';
import 'package:gang_app/ui/products/pages/product_details.dart';
import 'package:get/get.dart';

class ProductHomeScreen extends StatelessWidget {
  const ProductHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    ProductEditController productEditController =
        Get.put(ProductEditController());
    return Scaffold(
        backgroundColor: Colors.green,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: AppColors.white,
            size: 40.0,
          ),
          onPressed: () {
            Get.toNamed(Routes.PRODUCTFORM);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Obx(() => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.8),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ProductDetails(
                            productModel:
                                productController.productsList.value[index],
                          ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (productController
                                  .productsList.value[index].photoUrl !=
                              null)
                            Expanded(
                                child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: ProductImage(
                                imageUrl: productController
                                    .productsList.value[index].photoUrl!,
                              ),
                            )),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              child: Text(
                                  '${productController.productsList.value[index].name}'),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              child: Text(
                                '${productController.productsList.value[index].realPrice}',
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                          SizedBox(height: 10)
                        ],
                      ),
                    ),
                  );
                },
                itemCount: productController.productsList.value.length,
              )),
        ));
  }
}
