import 'package:flutter/material.dart';
import '../screens/scanner_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderWidget extends StatelessWidget {
  final String id;
  final String productId;
  final String price;
  final int quantity;
  final String title;

  OrderWidget(this.id, this.productId, this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: HexColor('#FC4041'),
            child: FittedBox(
                child: Text(
              '\$$price',
              style: TextStyle(color: Colors.white),
            )),
          ),
          title: Text(title),
          subtitle: Text('Total : \$${(price * quantity)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
