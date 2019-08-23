import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello_market/pages/productadmin.dart';
import 'package:http/http.dart' as http;
import 'package:hello_market/common/functions/saveCurrentLogin.dart';
import 'package:hello_market/common/functions/showDialogSingleButton.dart';
import 'dart:convert';
import 'package:hello_market/model/json/loginModel.dart';
import 'package:url_launcher/url_launcher.dart';

Future<LoginModel> requestLoginAPI(
    BuildContext context, String username, String password) async {
  final url = "http://10.0.2.2:8000/api/login";
  Map<String, String> body = {
    'name': username,
    'password': password,
  };

  http.Response response = await http.post(
    url,
    body: body,
  );

  if (response.statusCode == 200) {
    print("I am here YYYYYYYYYYY.....");
    final responseJson = json.decode(response.body);
    final id = responseJson['user']['id'];

    var user = new LoginModel.fromJson(responseJson);

    saveCurrentLogin(responseJson);

    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => new ProductsAdminPage(id)));
    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);

    saveCurrentLogin(responseJson);
    showDialogSingleButton(
        context,
        "Unable to Login",
        "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.",
        "OK");
    return null;
  }
}
