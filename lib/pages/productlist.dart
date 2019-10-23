import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_market/common/apifunctions/requestProductAPI.dart';

class ProductListPage extends StatefulWidget {
  final id;
  ProductListPage(this.id);
  @override
  State<StatefulWidget> createState() {
    return _ProductListPageState();
  }
}

class _ProductListPageState extends State<ProductListPage> {
  List _blongProduct = null;
  void productlist() {
    Future future = viewProduct(widget.id);
    future.then((value) {
      setState(() {
        _blongProduct = value;
      });
      print("this is");
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    productlist();
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Text("Title:  " + _blongProduct[index]['title']),
          SizedBox(
            height: 10.0,
          ),
          Text("Description: " + _blongProduct[index]['description']),
          SizedBox(
            height: 10.0,
          ),
          Text("Price= ETB:" + _blongProduct[index]['price']),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
              child: Text("Delete Product"),
              onPressed: (() {
                final id = _blongProduct[index]['id'];
                deleteProduct(id);
                setState(() {
                  productlist();
                });
              }))
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCards;
    try {
      if (_blongProduct.length > 1) {
        productCards = ListView.builder(
          itemBuilder: _buildProductItem,
          itemCount: _blongProduct.length,
        );
      } else {
        productCards = Center(
          child: Text("You don't have product "),
        );
      }
    } catch (e) {
      print("read this message");
      print(e);
      productCards = Container(
        child: Center(
          child: Text("server Error......404"),
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
