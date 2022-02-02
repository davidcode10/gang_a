import 'package:flutter/material.dart';
import 'package:gang_app/ui/auth/controller/api_controller.dart';
import 'package:gang_app/ui/auth/controller/product_controller.dart';
import 'package:gang_app/ui/auth/screens/details_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APITest extends StatelessWidget {
  const APITest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JsonController>(
        init: JsonController(),
        builder: (jsonController) => Scaffold(
              body: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: jsonController.beer.length,
                    itemBuilder: (context, index) {
                      return Column(children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              ProductController productController =
                                  Get.put(ProductController());

                              jsonController.beer[index].isFavorite =
                                  (prefs.getBool(
                                      "cerveza${jsonController.beer[index].id}"));
                              (jsonController.beer[index].isFavorite != null)
                                  ? productController.isFavourite.value =
                                      jsonController.beer[index].isFavorite!
                                  : productController.isFavourite.value = false;
                              Get.to(() => DetailsBeer(
                                  beer: jsonController.beer[index]));
                            },
                            leading: Container(
                                child: ClipRRect(
                              child: SizedBox(
                                child: Image.network(
                                  jsonController.beer[index].image_url!,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            )),
                            title: Text(jsonController.beer[index].name!),
                            subtitle: Text(jsonController.beer[index].tagline!),
                          ),
                        )
                      ]);
                    },
                  )),
            ));
  }
}