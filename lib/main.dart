import 'dart:convert';
//import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
// import 'package:flutter/foundation.dart';
import './pages/category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './pages/auth.dart';
import './api/api.dart';
import './pages/registration.dart';
import './pages/product.dart';

import './pages/products.dart';
import './pages/productadmin.dart';

import './common/functions/connection.dart';

void main() async {
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();

  bool connection = await connectionStatus.initialize();
  if (connection) {
    print("Has Conection .. Congratulation");
  } else {
    print(" No connection .... hup");
  }
  print("_________************************************________");

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _myAppState();
  }
}

class _myAppState extends State<MyApp> {
  List _allProduct = null;
  //  Future<String> future = this.getData();
  _setHeaders() => {'Accept': 'application/json'};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future future = Apiclass().getData();
    future.then((value) {
      //   print(value);
      _allProduct = jsonDecode(value.body);
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.deepOrange,
        primarySwatch: Colors.deepOrange,
      ),
      // home: AuthPage(),
      home: ProductsPage(_allProduct),
      routes: {
        // '/exit': (BuildContext context) => ExitPage(_allProduct),
        '/auth': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => ProductsPage(_allProduct),
        '/catagories': (BuildContext context) => CategorysPage(_allProduct),
        '/registration': (BuildContext context) => RegistrationPage(),

        //'/admin': (BuildContext context) => ProductsAdminPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) =>
                ProductPage(_allProduct[0][index]),
          );
        }
        return null;
      },
    );
  }
}
