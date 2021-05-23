import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../screens/home_screen.dart';
import '../screens/orders_screen.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart' as ci;
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  static String foodOrderId = '';

  @override
  Widget build(BuildContext context) {

    final snackBar = SnackBar(content: Text('Please select Items'));
    final cart = Provider.of<Cart>(
      context,
    );

    showAlertDialog(BuildContext ctx, String orderStatus, String orderId) {
      return showDialog(
          context: context,
          builder: (ctx) => Container(
                height: 100,
                width: 150,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        orderStatus,
                        style: TextStyle(
                            color: orderStatus != "Order Successful"
                                ? Colors.green
                                : Colors.red,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " Your Order Id is",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        orderStatus != "Order Successful" ? orderId : "",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: MaterialButton(
                          child: Text(
                            "Thanks ! I am Waiting",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          minWidth: double.infinity,
                          textColor: Colors.white,
                          color: HexColor('#FC4041'),
                          onPressed: () => Navigator.of(context)
                              .pushNamed(OrderScreen.routeName),
                        ),
                      )
                    ],
                  ),
                ),
              ));
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: HexColor('#ffffff'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              margin: EdgeInsets.all(15),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Chip(
                      label: Text('\$${cart.totalAmount}',
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) {
                return ci.CartItem(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price.toString(),
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].title);
              },
              itemCount: cart.itemCount,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: HexColor('#FC4041')),
            child: FlatButton(
              onPressed: () async {
                // print(cart.items.values.toList());
                if (cart.items.isNotEmpty) {
                Map orderDetail = await cart.confirmOrder(
                    cart.totalAmount.toString(), cart.items.keys.toList());
                cart.clear();
                CartScreen.foodOrderId = orderDetail['orderId'];
                  showAlertDialog(context, orderDetail['orderStatus'],
                      orderDetail['orderId']);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Text('Confirm My Order',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
