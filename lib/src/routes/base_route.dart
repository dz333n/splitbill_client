import 'package:flutter/material.dart';

abstract class BaseRoute {
  Widget handler(BuildContext context, Map<String, List<String>> parameters);

  void beforeLoadHandler() {
  }

  Widget handle(BuildContext context, Map<String, List<String>> parameters) {
    beforeLoadHandler();
    return handler(context, parameters);
  }

  String get templatePath;
}
