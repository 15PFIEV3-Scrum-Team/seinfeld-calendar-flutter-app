import 'package:flutter/material.dart';

class Routes {
  static void goToLoginPage(BuildContext context) {
    Navigator.pushNamed(context, '/');
  }
  static void goToHomePage(BuildContext context) {
    Navigator.pushNamed(context, '/home');
  }
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
