import 'package:flutter/material.dart';
import 'package:restaurant/widgets/order_item.dart';
import '../widgets/cart_item.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import '../screens/cart_screen.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final orderCount = Provider.of<Orders>(context).itemCount;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Orders',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          backgroundColor: Colors.white,
        ),
        body: Orders.orders.isEmpty ? Center(child: Text('Not Ordered Anything yet'),) : Container(
          height: double.maxFinite,
          width: double.infinity,
          child: Card(
            elevation: 3,
            child: ListView.builder(
                itemBuilder: (ctx, i) => OrderWidget(
                    Orders.orders.values.toList()[i].id,
                    Orders.orders.keys.toList()[i],
                    Orders.orders.values.toList()[i].price.toString(),
                    Orders.orders.values.toList()[i].quantity,
                    Orders.orders.values.toList()[i].title),
                itemCount: orderCount),
          ),
        ),);
  }
}
