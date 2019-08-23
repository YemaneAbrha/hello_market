import 'package:flutter/material.dart';
import './productscreate.dart';
import './productlist.dart';

class ProductsAdminPage extends StatelessWidget {
  final id;
  ProductsAdminPage(this.id);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Choose'),
              ),
              ListTile(
                title: Text('All Products'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Manage Products'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.create), text: 'Create Product'),
              Tab(
                icon: Icon(Icons.list),
                text: 'My Product',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductCreatePage(id),
            ProductListPage(id),
          ],
        ),
      ),
    );
  }
}
