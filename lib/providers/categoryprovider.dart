import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class CategoryModel {
  final String id;
  final String foodName;
  final String imageUrl;
  final String price;

  CategoryModel({this.id, this.foodName, this.imageUrl, this.price});
}

class CategoryItemProvider with ChangeNotifier {
  List<CategoryModel> _items = [];

  List<CategoryModel> get items {
    return [..._items];
  }

  Future categoryResults(String catid) async {
    final url = 'https://stated-heater.000webhostapp.com/restaurant/findcategory.php';
    var dio = Dio();
    final response =
        await dio.get(url, queryParameters: {'categoryid': catid});

    var extractedData = json.decode(response.data);

    List<CategoryModel> loadedProducts = [];

    extractedData.forEach((element) {
      loadedProducts.add(CategoryModel(
        id: element['id'],
        foodName: element['title'],
        imageUrl: element['imageurl'],
        price: element['price'],
      ));
    });

    _items = loadedProducts;

    notifyListeners();
  }
}
