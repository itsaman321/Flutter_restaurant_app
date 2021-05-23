import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class SearchModel {
  final String id;
  final String foodName;
  final String imageUrl;
  final String price;

  SearchModel({this.id, this.foodName, this.imageUrl, this.price});
}

class SearchProvider with ChangeNotifier {
  List<SearchModel> items = [];

  Future fetchSearchResults(String searchKeyword) async {
    final url = 'https://stated-heater.000webhostapp.com/restaurant/search.php';
    var dio = Dio();
    final response =
        await dio.get(url, queryParameters: {'searchKey': searchKeyword});

    // print(json.decode(response.data));

    var extractedData = json.decode(response.data);

    List<SearchModel> loadedProducts = [];

    extractedData.forEach((element) {
      loadedProducts.add(SearchModel(
        id: element['id'],
        foodName: element['title'],
        imageUrl: element['imageurl'],
        price: element['price'],
      ));
    });

    items = loadedProducts;

    notifyListeners();
  }
}
