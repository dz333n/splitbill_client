import 'package:flutter/material.dart';
import 'package:splitbill_client/src/viewmodels/current_user_view_model.dart';
import 'package:splitbill_client/src/application.dart';
import 'package:splitbill_client/src/screens/login/login_screen.dart';

abstract class BaseRoute {
  Widget handler(BuildContext context, Map<String, List<String>> parameters);

  bool checkAuthorization(BuildContext context) {
    final userProvider = Application.container.read(currentUserViewModel);

    return userProvider.user != null;
  }

  Widget handle(BuildContext context, Map<String, List<String>> parameters) {
    if (checkAuthorization(context)) {
      return handler(context, parameters);
    }

    print('User is not authorized');
    return LoginScreen();
  }

  String get templatePath;
}
