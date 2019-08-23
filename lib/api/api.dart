import 'dart:convert';
import 'dart:async';
import 'dart:core';
import 'package:http/http.dart' as http;

class Apiclass {
  final String _url = 'https://helloomarket.com/api/getAllProducts.php';

  Future<http.Response> getData() async {
    // final String _url = 'https://helloomarket.com/api/getAllProducts.php';
    final response = await http.get(_url, headers: _setHeaders());
    if (response.statusCode == 200) {
      //If server returns an oka response , return the json
      return response;
    } else {
      //If the response was not okay , throw an error
      throw Exception('Failed To load Data');
    }
  }

  _setHeaders() => {'Accept': 'application/json'};
}
