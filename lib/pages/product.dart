import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final _product;
  ProductPage(this._product);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_product['title']),
      ),
      body: (Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network("https://helloomarket.com/image/" + _product['image']),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(_product['title']),
          ),
        ],
      )),
    );
  }
}
