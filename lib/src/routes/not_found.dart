import 'package:flutter/material.dart';
import 'package:splitbill_client/src/application.dart';
import 'package:splitbill_client/src/routes/base_route.dart';

class NotFoundRoute extends BaseRoute {
  @override
  Widget handler(BuildContext context, Map<String, List<String>> parameters) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Not found"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Oops! Page does not exist!"),
            RaisedButton(
              onPressed: () {
                Application.router.navigateTo(context, "/");
              },
              child: Text("Go back"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  String get templatePath => null;
}
