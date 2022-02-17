import 'package:flutter/material.dart';
import 'package:gang_app/ui/proof/controllers/product_proof_controller.dart';
import 'package:gang_app/ui/proof/widgets/build_actions_search.dart';
import 'package:gang_app/ui/proof/widgets/text_search_field.dart';
import 'package:get/get.dart';

class Page2 extends StatelessWidget {
  const Page2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProofController productProofController = Get.find();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: productProofController.isSearching.value
              ? BackButton()
              : Container(),
          title: productProofController.isSearching.value
              ? TextSearchField()
              : Text("Title"),
          actions: [
            BuildActionsSearch(),
          ],
        ),
        body: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: Image.network(
                "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            (productProofController.addPalabras.value.isNotEmpty)
                ? ListView.builder(
                    itemCount: productProofController.addPalabras.value.length,
                    itemBuilder: (context, index) {
                      return Text(
                          productProofController.addPalabras.value[index]);
                    })
                : ListView.builder(
                    itemCount: productProofController.palabras.value.length,
                    itemBuilder: (context, index) {
                      return Text(productProofController.palabras.value[index]);
                    }),
          ],
        ),
      ),
    );
  }
}
