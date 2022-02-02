import 'dart:convert';
import 'package:gang_app/model/beer_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductController extends GetxController {
  RxBool isFavourite = false.obs;

  final favouritesBeersString = <String>[].obs;

  final favouritesBeers = <Beer>[].obs;

  Future<void> getFavourites() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final _response = prefs.getString("favouritesBeers");

      final List<dynamic> _mapResponse = jsonDecode(_response!);

      print(_mapResponse);

      final List<Beer> _listResponse =
          _mapResponse.map((e) => Beer.fromJson(e)).toList();

      print(_listResponse);

      favouritesBeers.value = _listResponse;

      print(favouritesBeers);
    } catch (e) {
      print(e);
    }
  }

  Beer? findBeer(int id) {
    try {
      return favouritesBeers.firstWhere((book) => book.id == id);
    } catch (e) {
      print(e);
    }
  }
}