import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hello_market/common/functions/showDialogSingleButton.dart';
import 'dart:convert';
import 'package:hello_market/pages/productadmin.dart';

Future createProduct(BuildContext context, Map<String, dynamic> body) async {
  print("I am gona b product");
  final url = "http://10.0.2.2:8000/api/createProduct";
  final id = body['owner_id'];
  body['price'] = body['price'].toString();
  body['owner_id'] = body['owner_id'].toString();
  http.Response response = await http.post(
    url,
    body: body,
  );

  if (response.statusCode == 200) {
    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => new ProductsAdminPage(id)));
  } else {
    showDialogSingleButton(context, "Unable to CreateProduct",
        "You may have supplied invalid inputs' combination.", "OK");
    return null;
  }
}

Future viewProduct(int id) async {
  print("I'm gona show your list of product");
  final url = 'http://10.0.2.2:8000/api/showproduct';
  print(id);
  Map<String, dynamic> body = {
    'owner_id': id.toString(),
  };
  http.Response response = await http.post(url, body: body);
  // print(response.statusCode);
  final responseJson = jsonDecode(response.body);

  // print(responseJson['products']);
  if (response.statusCode == 200) {
    return responseJson['products'];
  } else {
    // showDialogSingleButton(BuildContext context, "You don`t have  product",
    //     'Please Create At list one product to view List ', "OK");
  }
}

Future deleteProduct(int id) async {
  print("am gona delete product");
  final url = 'http://10.0.2.2:8000/api/deleteProduct';
  print(id);
  Map<String, dynamic> body = {
    'id': id.toString(),
  };
  http.Response response = await http.post(url, body: body);

  if (response.statusCode == 200) {
    return;
  } else {
    // showDialogSingleButton(BuildContext context, "You don`t have  product",
    //     'Please Create At list one product to view List ', "OK");
  }
}
