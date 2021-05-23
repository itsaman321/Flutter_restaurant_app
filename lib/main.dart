import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import './screens/orders_screen.dart';
import './providers/category.dart';
import './screens/scanner_screen.dart';
import './screens/cart_screen.dart';
import './screens/home_screen.dart';
import './providers/foods.dart';
import './providers/cart.dart' show Cart;
import './providers/orders.dart';
import './screens/search_screen.dart';
import './providers/search.dart';
import './providers/categoryprovider.dart';
import './screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => FoodProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CategoryItemProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: ScannerScreen(),
        routes: {
          CartScreen.routeName: (ctx) => CartScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          SearchScreen.routeName: (ctx) => SearchScreen(),
          CategoryScreen.routeName: (ctx) => CategoryScreen(),
        },
      ),
    );
  }
}
