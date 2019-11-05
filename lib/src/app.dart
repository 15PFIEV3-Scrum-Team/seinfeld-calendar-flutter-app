import 'package:flutter/material.dart';
import 'package:seinfeld/src/screens/login_page/login_page.dart';
import 'package:seinfeld/src/screens/home/home_page.dart';

var routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => LoginPage(),
  "/home": (BuildContext context) => HomePage(),
};

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: routes,
    );
  }
}
