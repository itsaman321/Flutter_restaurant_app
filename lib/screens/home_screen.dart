import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/providers/foods.dart';
import 'package:restaurant/screens/search_screen.dart';
import '../screens/scanner_screen.dart';
import 'package:restaurant/widgets/category_item.dart';
import 'package:restaurant/widgets/special_item.dart';
import '../screens/cart_screen.dart';
import '../providers/category.dart' show CategoryProvider;
import '../widgets/best_seller_item.dart';
import 'package:provider/provider.dart';
import '../providers/search.dart';
import '../screens/orders_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/homescreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<FoodProvider>(context).fetchAndSetFoods();
    Provider.of<CategoryProvider>(context).fetchAndSetCategory();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategoryProvider>(context).categories;
    final foodsData = Provider.of<FoodProvider>(context).items;

    final todaySpecialItems = [];
    final bestSellerItems = [];

    foodsData.forEach((food) {
      if (food.todaySpecial == true) {
        todaySpecialItems.add(food);
      }
    });

    foodsData.forEach((food) {
      if (food.bestSeller == true) {
        bestSellerItems.add(food);
      }
    });

    return Stack(children: <Widget>[
      Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Discover',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          Navigator.of(context).pushNamed(CartScreen.routeName);
                        })
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    controller: _searchController,
                    decoration: new InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            Provider.of<SearchProvider>(context, listen: false)
                                .fetchSearchResults(_searchController.text);
                            Navigator.of(context)
                                .pushNamed(SearchScreen.routeName);
                          },
                          child: Icon(
                            Icons.search,
                            color: HexColor('#FC4041'),
                          ),
                        ),
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "What are you Looking for ?"),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 140,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, i) {
                            return CategoryItem(
                                categoryData[i].categoryid,
                                categoryData[i].categoryname,
                                categoryData[i].catergoryimage);
                          },
                          itemCount: categoryData.length,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today\'s Special',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 240,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, i) {
                            return SpecialItem(
                              todaySpecialItems[i].id,
                              todaySpecialItems[i].title,
                              todaySpecialItems[i].imageUrl,
                              todaySpecialItems[i].price,
                            );
                          },
                          itemCount: todaySpecialItems.length,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Best Seller',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, i) {
                            return BestSellerItem(
                              bestSellerItems[i].id,
                              bestSellerItems[i].title,
                              bestSellerItems[i].imageUrl,
                              bestSellerItems[i].price,
                            );
                          },
                          itemCount: bestSellerItems.length,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration:
                new BoxDecoration(color: const Color(0xFF66BB6A), boxShadow: [
              new BoxShadow(
                color: Colors.black54,
                blurRadius: 20.0,
              ),
            ]),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(OrderScreen.routeName);
              },
              minWidth: double.infinity,
              height: 60,
              child: Text(
                'My Orders',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              color: HexColor('#FC4041'),
            ),
          ),
        ],
      )
    ]);
  }
}
