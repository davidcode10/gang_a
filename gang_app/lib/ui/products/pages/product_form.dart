import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gang_app/global_widgets/get_image/get_image.dart';
import 'package:gang_app/global_widgets/global_textfield.dart';
import 'package:gang_app/model/product_model.dart';
import 'package:gang_app/services/firestore/firestore_service_products.dart';
import 'package:gang_app/theme/color_theme.dart';
import 'package:gang_app/ui/products/controllers/product_controller.dart';
import 'package:gang_app/ui/products/controllers/product_edit_controller.dart';
import 'package:gang_app/ui/utils/form_validator.dart';
import 'package:get/get.dart';

class ProductForm extends StatelessWidget {
  ProductForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ProductEditController productEditController =
        Get.put(ProductEditController());
    ProductController productController = Get.find();

    productEditController.dropdownValue.value =
        productController.categoryProducts.first;

    GetImage getImage = GetImage();
    DataBaseProducts dataBaseProducts = DataBaseProducts();

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 30),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: 40,
                        width: 40,
                        color: AppColors.secondary[100],
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Padding(
                  padding:
                      const EdgeInsets.only(top: 70.0, left: 80, right: 80),
                  child: ClipRRect(
                    child: (productEditController.pathImage.value != '')
                        ? Container(
                            color: Colors.green,
                            height: 200,
                            width: 400,
                            child: Image.file(
                                File(productEditController.pathImage.value))

                            //  Image.network(
                            //   authController.firestoreUser.value!.photoUrl!,
                            //   fit: BoxFit.fill,
                            // ),
                            )
                        : Container(
                            color: Colors.green,
                            height: 200,
                            width: 400,
                          ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[200])),
                    child: const Text(
                      "EDITAR FOTO",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () async {
                      await getImage.showPicker(context);
                      print(getImage.pathImage);
                      productEditController.pathImage.value =
                          getImage.pathImage;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  width: double.infinity,
                  child: GlobalTextField(
                    controller: productEditController.nameProduct,
                    obscureText: false,
                    hintText: "Introduce el nombre del producto",
                    keyboardType: TextInputType.emailAddress,
                    validator: FormValidator().isValidName,
                    maxLines: 1,
                    minLines: 1,
                    onSave: (value) {
                      productEditController.nameProduct.text = value!;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  width: double.infinity,
                  child: GlobalTextField(
                    controller: productEditController.originalPrice,
                    obscureText: false,
                    hintText: "Introduce precio original en euros",
                    keyboardType: TextInputType.number,
                    validator: FormValidator().isValidPrice,
                    maxLines: 1,
                    minLines: 1,
                    onSave: (value) {
                      productEditController.nameProduct.text = value!;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  width: double.infinity,
                  child: GlobalTextField(
                    controller: productEditController.realPrice,
                    obscureText: false,
                    hintText: "Introduce precio de la Ganga en euros",
                    keyboardType: TextInputType.number,
                    validator: FormValidator().isValidPrice,
                    inputFormaters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}'))
                    ],
                    maxLines: 1,
                    minLines: 1,
                    onSave: (value) {
                      productEditController.realPrice.text = value!;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  width: double.infinity,
                  child: GlobalTextField(
                    controller: productEditController.descriptionProduct,
                    obscureText: false,
                    hintText: "Introduce la descripción del producto",
                    validator: FormValidator().isValidDescription,
                    keyboardType: TextInputType.multiline,
                    maxLines: 20,
                    minLines: 5,
                    onSave: (value) {
                      productEditController.descriptionProduct.text = value!;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Obx(
                  () => DropdownButton<String>(
                    value: productEditController.dropdownValue.value,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      productEditController.dropdownValue.value = newValue!;
                    },
                    items: productController.categoryProducts
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, bottom: 40, top: 40),
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[200])),
                      child: const Text(
                        "ENVIAR DATOS",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () async {
                        productEditController.productUid.value =
                            dataBaseProducts.generateIdProduct();
                        ProductModel newProduct = ProductModel(
                            uid: productEditController.productUid.value,
                            name: productEditController.nameProduct.text,
                            description:
                                productEditController.descriptionProduct.text,
                            originalPrice:
                                productEditController.originalPrice.text + "€",
                            realPrice:
                                productEditController.realPrice.text + "€",
                            productCategory:
                                productEditController.dropdownValue.value);
                        print(newProduct.uid);
                        print(newProduct.photoUrl);

                        if (productEditController.pathImage.value != '') {
                          await getImage.uploadFileProduct(
                            context,
                            File(productEditController.pathImage.value),
                            productEditController.productUid.value,
                            newProduct,
                          );
                        }

                        productEditController.createProduct(newProduct);
                        Get.back();

                        // if (_formKey.currentState!.validate()) {
                        //   // ProductModel newProduct = ProductModel(
                        //   //   uid: "",
                        //   //   name: productController.nameProduct.text,
                        //   //   description:
                        //   //       productController.descriptionProduct.text,
                        //   //   originalPrice:
                        //   //       productController.originalPrice.text + "€",
                        //   //   realPrice: productController.realPrice.text + "€",
                        //   // );

                        //   // productController.createProduct(newProduct);
                        // } else {
                        //   showAlertDialog(
                        //       context, "Error", "Rellene todos los campos");
                        // }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
