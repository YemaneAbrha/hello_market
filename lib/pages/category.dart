import 'package:flutter/material.dart';

class CategorysPage extends StatelessWidget {
  final products;

  CategorysPage(this.products);
  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(products[index]['name']),
          Image.network(
              "https://helloomarket.com/image/" + products[index]['image']),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCards;
    try {
      if (products.length > 0) {
        productCards = ListView.builder(
          itemBuilder: _buildProductItem,
          itemCount: products.length,
        );
      } else {
        productCards = Container(
          child: Center(
            child: Text("No Product"),
          ),
        );
      }
    } catch (e) {
      productCards = Container(
        child: Center(
          child: Text("Server Error ..... 404 "),
        ),
      );
    }

    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
