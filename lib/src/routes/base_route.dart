import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splitbill_client/src/screens/loading/loading_screen.dart';
import 'package:splitbill_client/src/viewmodels/current_user_view_model.dart';
import 'package:splitbill_client/src/application.dart';
import 'package:splitbill_client/src/routes/login_route.dart';

import '../application.dart';
import '../screens/login/login_screen.dart';

abstract class BaseRoute {
  Widget handler(BuildContext context, Map<String, List<String>> parameters);

  bool checkAuthorization(BuildContext context) {
    final container = ProviderContainer();
    final userProvider = container.read(currentUserViewModel);

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
