import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hello_market/common/functions/saveCurrentLogin.dart';
import 'package:hello_market/common/functions/showDialogSingleButton.dart';
import 'dart:convert';

import 'package:hello_market/model/json/loginModel.dart';
import 'package:url_launcher/url_launcher.dart';

Future<LoginModel> requestRegistrationAPI(
    BuildContext context,
    String fname,
    String lname,
    String email,
    String username,
    String password,
    String passwordConfirmation) async {
  final url = "http://10.0.2.2:8000/api/register";

  Map<String, String> body = {
    //'fname': fname,
    //'lname': lname,
    'email': email,
    'name': username,
    'password': password,
    //'passwordConfirmation': passwordConfirmation,
  };

  http.Response response = await http.post(
    url,
    body: body,
  );
  print(response);
}
