import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'dart:convert';


class Orders with ChangeNotifier {

 static Map orders = {};

 int get itemCount {
    return orders.length;
  }

  // List get orders {
  //   return [..._orders];
  // }

  // Future fetchOrders(String orderId) async {
  //   List loadedOrder = [];
  //   if (orderId != '') {
  //     final dio = Dio();
  //     final url =
  //         'https://stated-heater.000webhostapp.com/restaurant/fetch_orders.php';
  //     final response = await dio.get(url, queryParameters: {
  //       'orderId': orderId,
  //     });

  //     print(json.decode(response.data));

  //   } else {
  //     return;
  //   }
  // }
}
