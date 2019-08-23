import 'package:flutter/material.dart';
import 'dart:async';

class ProductsPage extends StatefulWidget {
  final products;
  ProductsPage(this.products) {
    // print();
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductsPageState(products);
  }
}

class _ProductsPageState extends State<ProductsPage> {
  final products;
  _ProductsPageState(this.products);
  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(products[0]['products'][index]['name']),
          Text("Item code:  " + products[0]['products'][index]['product_id']),
          Image.network("https://helloomarket.com/image/" +
              products[0]['products'][index]['image']),
          RaisedButton(
            child: Text(
                "ETB : " + products[0]['products'][index]['price'].toString()),
          ),
          InkWell(
            child: Text("details .....",
                style: TextStyle(fontSize: 20.0, color: Colors.blue[600])),
            onTap: () => Navigator.pushNamed<bool>(
                context, '/product' + index.toString()),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    print("??????????????????????????????????????????????????????????????????");
    Widget productCards;
    try {
      if (products[0]['products'].length > 1) {
        productCards = ListView.builder(
          itemBuilder: _buildProductItem,
          itemCount: products[0]['products'].length,
        );
      } else {
        productCards = Container();
      }
    } catch (e) {
      print(e);
      productCards = Container(
        child: Center(
          child: Text("Server Error 404 ...."),
        ),
      );
    }

    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    // var index = 1;
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text("HelloMarkate"),
              ),
              ListTile(
                //Tab(icon: Icon(Icons.create), text: 'Create Product'),
                title: Text('Catagory'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/catagories');
                },
              ),
              ListTile(
                title: Text('All Product'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/products');
                },
              ),
              ListTile(
                title: Text('Search'),
                onTap: () {
                  // Navigator.pushReplacementNamed(context, '/');
                },
              ),
              ListTile(
                title: Text('Info'),
                onTap: () {
                  // Navigator.pushReplacementNamed(context, '/');
                },
              ),
              ListTile(
                title: Text('Exit'),
                onTap: () {
                  // Navigator.pushReplacementNamed(context, '/');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("HelloMarket"),
        ),
        body: _buildProductList(),
        // body: ListView(
        //   children: <Widget>[
        // for (index = 1; index < products[1]['products'][1].length; index++)
        //   {
        //     Text(products[1]['products'][index]['name']),
        //     Text("Item code:  " +
        //         products[1]['products'][index]['product_id']),
        //     Image.network("https://helloomarket.com/image/" +
        //         products[1]['products'][index]['image']),
        //     RaisedButton(
        //       child: Text("ETB : " +
        //           products[1]['products'][index]['price'].toString()),
        //     ),
        //   }
        //products[products[1]['products'][1]]
        //],
        //),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.category),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
          ),
        ));
  }
}
