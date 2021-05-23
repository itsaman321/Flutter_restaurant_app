import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Category {
  final String categoryid;
  final String categoryname;
  final String catergoryimage;

  Category({this.categoryid, this.categoryname, this.catergoryimage});
}

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [
    // Category(
    //   categoryid: 'c1 ',
    //   categoryname: 'Burger',
    //   catergoryimage:
    //       'https://static.vecteezy.com/system/resources/previews/001/500/415/original/burger-icon-free-vector.jpg',
    // ),
    // Category(
    //   categoryid: 'c1 ',
    //   categoryname: 'Burger',
    //   catergoryimage:
    //       'https://static.vecteezy.com/system/resources/previews/001/500/415/original/burger-icon-free-vector.jpg',
    // ),
    // Category(
    //   categoryid: 'c1 ',
    //   categoryname: 'Burger',
    //   catergoryimage:
    //       'https://static.vecteezy.com/system/resources/previews/001/500/415/original/burger-icon-free-vector.jpg',
    // ),
    // Category(
    //   categoryid: 'c1 ',
    //   categoryname: 'Burger',
    //   catergoryimage:
    //       'https://static.vecteezy.com/system/resources/previews/001/500/415/original/burger-icon-free-vector.jpg',
    // ),
  ];

  List get categories {
    return [..._categories];
  }

  Future<void> fetchAndSetCategory() async {
    final url =
        'https://stated-heater.000webhostapp.com/restaurant/getcategory.php';
    final response = await http.get(Uri.parse(url));
    final extractedData = json.decode(response.body);
    final List<Category> loadedData = [];

    extractedData.forEach((category) {
      Category categoryItem = Category(
        categoryid: category['id'],
        categoryname: category['categoryname'],
        catergoryimage: category['imageurl'],
      );
      loadedData.add(categoryItem);
    });
    _categories = loadedData;
  }
}
