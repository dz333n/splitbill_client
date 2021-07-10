import 'package:flutter/material.dart';
import 'package:splitbill_client/src/screens/login/login_screen.dart';
import 'package:splitbill_client/src/routes/base_route.dart';

class LoginRoute extends BaseRoute {
  @override
  Widget handler(BuildContext? context, Map<String, List<String>> parameters) {
    return LoginScreen();
  }

  @override
  String get templatePath => '/user/login';

  static String constructPath() => '/user/login';
}
