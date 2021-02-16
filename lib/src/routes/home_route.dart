import 'package:flutter/material.dart';
import 'package:splitbill_client/src/routes/base_route.dart';

class HomeRoute extends BaseRoute {
  @override
  Widget handler(BuildContext context, Map<String, List<String>> parameters) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text("Home route"),
      ),
    );
  }

  @override
  String get templatePath => '/';

  static String constructPath() => '/';
}
