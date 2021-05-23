import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/providers/categoryprovider.dart';
import '../screens/cart_screen.dart';
import '../widgets/category_search.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = '/category';
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategoryItemProvider>(context).items;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'Search Result',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: HexColor('#ffffff'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              }),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return CategorySearch(
            categoryData[i].id,
            categoryData[i].foodName,
            categoryData[i].imageUrl,
            categoryData[i].price,
          );
        },
        itemCount: categoryData.length,
      ),
    );
  }
}
