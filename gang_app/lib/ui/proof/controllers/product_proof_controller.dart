import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductProofController extends GetxController {
  TextEditingController searchQueryController = TextEditingController();
  Rx<bool> isSearching = false.obs;
  String searchQuery = "Search query";
  Rx<List<String>> palabras = Rx<List<String>>(["hoooo", "holaaa", "hoo"]);
  Rx<List<String>> addPalabras = Rx<List<String>>([]);

  void updateSearchQuery(String newQuery) async {
    addPalabras.value.clear();
    searchQuery = newQuery;
    addPalabras.value.addAll(palabras.value
        .where((element) => element.contains(searchQueryController.text)));

    addPalabras.refresh();
    print(addPalabras);
  }

  void clearSearchQuery() {
    searchQueryController.clear();
    updateSearchQuery("");
  }

  void stopSearching() {
    clearSearchQuery();
    isSearching.value = false;
  }
}
