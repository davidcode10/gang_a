import 'dart:convert';
import 'package:gang_app/model/beer_model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class JsonController extends GetxController {

  final Rx<List<Beer>> _beerList = Rx<List<Beer>>([]);
  List<Beer> get beer => _beerList.value.obs;

  @override
  void onReady() {
    loadJson();
  }

  loadJson() async {
    try {
      // String data = await rootBundle.loadString("assets/api.json");
      // List jsonResultBeer = jsonDecode(data);
      // final listResultBeer =
      //     jsonResultBeer.map((e) => Beer.fromJson(e)).toList();
      // _beerList.value = listResultBeer;

      var url = Uri.parse("https://api.punkapi.com/v2/beers");

      http.get(url).then((res) {
        List jsonResultBeers = jsonDecode(res.body);
        _beerList.value = jsonResultBeers.map((e) => Beer.fromJson(e)).toList();
      });
    } catch (err) {
      print(err);
    }
  }

  isFavorite() {
    
  }
}
