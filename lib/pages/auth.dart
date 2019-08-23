import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/apifunctions/requestLoginAPI.dart';
import '../common/functions/showDialogSingleButton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
//import 'package:http/http.dart' as http;

const urll = 'https://flutter.dev/docs';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _agentname;
  String _agentId;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future launchURL(String url) async {
    if (await canLaunch(url)) {
      //  await launch(url, forceSafariVC: true, forceWebView: true);
      // await launch(url);
    } else {
      showDialogSingleButton(
          context,
          "Unable to reach your website.",
          "Currently unable to reach the website $urll. Please try again at a later time.",
          "OK");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    launchURL(urll);
    _saveCurrentRoute('/LoginScreen');
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var drawer = Drawer();
    return WillPopScope(
      onWillPop: () {
        if (Navigator.canPop(context)) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/products', (Route<dynamic> route) => false);
        } else {
          Navigator.of(context).pushReplacementNamed('/products');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "LOGIN",
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.deepOrange,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Text(
                  "Username",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: TextField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                      hintText: "Use your web  User name",
                    ),
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Your password, keep it secret, keep it safe.',
                    ),
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
                  child: Container(
                    height: 65.0,
                    child: RaisedButton(
                      onPressed: () {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        requestLoginAPI(context, _userNameController.text,
                            _passwordController.text);
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      ),
                      color: Colors.purple,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    10.0,
                    0.0,
                    0.0,
                    0.0,
                  ),
                  child: Container(
                    child: InkWell(
                      child: Text("Register now.....",
                          style:
                              TextStyle(fontSize: 17.0, color: Colors.black)),
                      onTap: () =>
                          Navigator.pushNamed(context, '/registration'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  // bool _acceptTerms = false;

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Login'),
  //     ),
  //     body: Container(
  //       margin: EdgeInsets.all(10.0),
  //       child: ListView(
  //         children: <Widget>[
  //           TextField(
  //             decoration: InputDecoration(labelText: 'AgentName:'),
  //             keyboardType: TextInputType.emailAddress,
  //             onChanged: (String value) {
  //               setState(() {
  //                 _agentname = value;
  //               });
  //             },
  //           ),
  //           TextField(
  //             decoration: InputDecoration(labelText: 'AgentID:'),
  //             obscureText: true,
  //             onChanged: (String value) {
  //               setState(() {
  //                 _agentId = value;
  //               });
  //             },
  //           ),
  //           // SwitchListTile(
  //           //   value: _acceptTerms,
  //           //   onChanged: (bool value) {
  //           //     setState(() {
  //           //       _acceptTerms = value;
  //           //     });
  //           //   },
  //           //   title: Text('Accept Terms'),
  //           // ),
  //           SizedBox(
  //             height: 10.0,
  //           ),
  //           RaisedButton(
  //             color: Theme.of(context).primaryColor,
  //             textColor: Colors.white,
  //             child: Text('LOGIN'),
  //             onPressed: () {
  //               if (_agentname == "yemane" && _agentId == '123') {
  //                 Navigator.pushReplacementNamed(context, '/products');
  //               } else {
  //                 Navigator.pushReplacementNamed(context, '/');
  //               }
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
