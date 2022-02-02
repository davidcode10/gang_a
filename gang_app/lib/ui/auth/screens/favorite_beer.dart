import 'package:flutter/material.dart';
import 'package:gang_app/theme/color_theme.dart';
import 'package:gang_app/ui/auth/controller/product_controller.dart';
import 'package:gang_app/ui/auth/screens/details_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 40.0),
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    height: 40,
                    width: 40,
                    color: AppColors.orange,
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: productController.favouritesBeers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Column(children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();

                              productController
                                      .favouritesBeers[index].isFavorite =
                                  (prefs.getBool(
                                      "cerveza${productController.favouritesBeers[index].id}"));
                              (productController
                                          .favouritesBeers[index].isFavorite !=
                                      null)
                                  ? productController.isFavourite.value =
                                      productController
                                          .favouritesBeers[index].isFavorite!
                                  : productController.isFavourite.value = false;
                              Get.to(() => DetailsBeer(
                                  beer: productController
                                      .favouritesBeers[index]));
                            },
                            leading: Container(
                                child: ClipRRect(
                              child: SizedBox(
                                child: Image.network(
                                  productController
                                      .favouritesBeers[index].image_url!,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            )),
                            title: Text(
                                productController.favouritesBeers[index].name!),
                            subtitle: Text(productController
                                .favouritesBeers[index].tagline!),
                          ),
                        )
                      ]),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}