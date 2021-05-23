import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/categoryprovider.dart';
import '../screens/category_screen.dart';

class CategoryItem extends StatelessWidget {
  final String categoryid;
  final String categoryname;
  final String catergoryimage;

  CategoryItem(this.categoryid, this.categoryname, this.catergoryimage);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final categoryData = Provider.of<CategoryItemProvider>(context , listen: false)
            .categoryResults(categoryid);
        Navigator.of(context).pushNamed(CategoryScreen.routeName);
      },
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            elevation: 3,
            child: Container(
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Image.network(
                  catergoryimage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(categoryname),
        ],
      ),
    );
  }
}
