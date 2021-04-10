import 'package:flutter/material.dart';
import 'package:splitbill_client/src/routes/base_route.dart';
import 'package:splitbill_client/src/screens/events/events_screen.dart';

class HomeRoute extends BaseRoute {
  @override
  Widget handler(BuildContext context, Map<String, List<String>> parameters) {
    return EventsScreen();
  }

  @override
  String get templatePath => '/';

  static String constructPath() => '/';
}
