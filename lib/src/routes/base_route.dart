import 'package:flutter/material.dart';

abstract class BaseRoute {
  Widget handler(BuildContext context, Map<String, List<String>> parameters);

  String get templatePath;
}
