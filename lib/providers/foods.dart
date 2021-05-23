import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Foods {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final bool todaySpecial;
  final bool bestSeller;

  Foods({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.price,
    this.todaySpecial,
    this.bestSeller,
  });
}

class FoodProvider with ChangeNotifier {
  List<Foods> _items = [
    // Foods(
    //   id: 'f1',
    //   title: 'Pizza',
    //   description: 'PIzza is Goods',
    //   imageUrl:
    //       'https://media02.stockfood.com/largepreviews/MzQ2MTY2OTI1/11166675-Veggie-Pizza-Sliced-Once-on-a-White-Background-From-Above.jpg',
    //   price: 20.3,
    //   todaySpecial: true,
    //   bestSeller: true,
    // ),
    // Foods(
    //   id: 'f1',
    //   title: 'Pizza',
    //   description: 'PIzza is Goods',
    //   imageUrl:
    //       'https://previews.123rf.com/images/danilsneg/danilsneg1706/danilsneg170600158/81077084-pepperoni-pizza-italian-pizza-on-white-background-.jpg',
    //   price: 20.3,
    //   todaySpecial: true,
    //   bestSeller: true,
    // ),
    // Foods(
    //   id: 'f1',
    //   title: 'Pizza',
    //   description: 'PIzza is Goods',
    //   imageUrl:
    //       'https://media02.stockfood.com/largepreviews/MzQ2MTY2OTI1/11166675-Veggie-Pizza-Sliced-Once-on-a-White-Background-From-Above.jpg',
    //   price: 20.3,
    //   todaySpecial: true,
    //   bestSeller: true,
    // ),
    // Foods(
    //   id: 'f1',
    //   title: 'Pizza',
    //   description: 'PIzza is Goods',
    //   imageUrl:
    //       'https://media02.stockfood.com/largepreviews/MzQ2MTY2OTI1/11166675-Veggie-Pizza-Sliced-Once-on-a-White-Background-From-Above.jpg',
    //   price: 20.3,
    //   todaySpecial: true,
    //   bestSeller: true,
    // ),
    // Foods(
    //   id: 'f1',
    //   title: 'Pizza',
    //   description: 'PIzza is Goods',
    //   imageUrl:
    //       'https://media02.stockfood.com/largepreviews/MzQ2MTY2OTI1/11166675-Veggie-Pizza-Sliced-Once-on-a-White-Background-From-Above.jpg',
    //   price: 20.3,
    //   todaySpecial: true,
    //   bestSeller: true,
    // ),
    // Foods(
    //   id: 'f1',
    //   title: 'Pizza',
    //   description: 'PIzza is Goods',
    //   imageUrl:
    //       'https://media02.stockfood.com/largepreviews/MzQ2MTY2OTI1/11166675-Veggie-Pizza-Sliced-Once-on-a-White-Background-From-Above.jpg',
    //   price: 20.3,
    //   todaySpecial: true,
    //   bestSeller: true,
    // ),
  ];

  List get items {
    return [..._items];
  }

  void addItem(Foods food) {
    items.add(food);
  }

  bool toBoolean(String value) {
    if (value == '1') {
      return true;
    } else {
      return false;
    }
  }

  Future<void> fetchAndSetFoods() async {
    final url =
        'https://stated-heater.000webhostapp.com/restaurant/getfoods.php';
    final response = await http.get(Uri.parse(url));
    final extractedProducts = json.decode(response.body);
    final List<Foods> loadedItems = [];
    Foods foodItem;

    extractedProducts.forEach(
      (food) {
        foodItem = Foods(
          id: food['id'],
          title: food['title'],
          description: food['description'],
          imageUrl: food['imageurl'],
          price: double.parse(food['price']),
          todaySpecial: toBoolean(food['todayspecial']),
          bestSeller: toBoolean(food['bestseller']),
        );
        loadedItems.add(foodItem);
      },
    );

    _items = loadedItems;
    notifyListeners();
  }
}
