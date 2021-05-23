import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CategorySearch extends StatelessWidget {
  final String id;
  final String foodName;
  final String imageUrl;
  final String price;

  CategorySearch(this.id, this.foodName, this.imageUrl, this.price);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          '\$$price',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          overflow: TextOverflow.fade,
        ),
        subtitle: Text(
          foodName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Provider.of<Cart>(context, listen: false)
                .addItem(id,double.parse(price),foodName);
          },
        ),
      ),
    );
  }
}
