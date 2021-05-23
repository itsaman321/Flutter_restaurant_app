import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/widgets/search_item.dart';
import '../providers/search.dart';
import '../screens/cart_screen.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = Provider.of<SearchProvider>(context).items;

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
          return SearchItem(
            searchResults[i].id,
            searchResults[i].foodName,
            searchResults[i].imageUrl,
            searchResults[i].price,
          );
        },
        itemCount: searchResults.length,
      ),
    );
  }
}
