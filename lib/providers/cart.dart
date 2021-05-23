import 'dart:convert';
import 'package:restaurant/screens/scanner_screen.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../providers/orders.dart' show Orders;

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingProduct) => CartItem(
          id: DateTime.now().toString(),
          title: existingProduct.title,
          price: existingProduct.price,
          quantity: existingProduct.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              ));
    }
    Orders.orders = items;
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  int get itemCount {
    return _items.length;
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
            id: existingCartItem.id,
            title: existingCartItem.title,
            quantity: existingCartItem.quantity - 1,
            price: existingCartItem.price),
      );
    } else {
      _items.remove(productId);
    }
    Orders.orders = items;
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  Future<Map> confirmOrder(String totalAmount, List<String> cartItem) async {
    if (items.isNotEmpty) {
      var dio = Dio();
      var uuid = Uuid();
      String orderId = uuid.v1();
      final url =
          'https://stated-heater.000webhostapp.com/restaurant/add_order.php';

      final orderData = {
        'orderid': orderId,
        'tableId': ScannerScreen.tableId,
        'amount': totalAmount,
        'dateTime': DateTime.now().toString(),
        'products': json.encode(cartItem.map((foodid) {
          return foodid;
        }).toList()),
      };

      final response = await dio.get(url, queryParameters: orderData);

      return {'orderStatus': response.data, 'orderId': orderId};
    } else {
      notifyListeners();
      return {};
    }
  }
}
