import 'package:flutter/material.dart';
import 'package:splitbill_client/src/routes/base_route.dart';
import 'package:splitbill_client/src/screens/home_screen.dart';

class HomeRoute extends BaseRoute {
  @override
  Widget handler(BuildContext? context, Map<String, List<String>> parameters) {
    return HomeScreen();
  }

  @override
  String get templatePath => '/';

  static String constructPath() => '/';
}
