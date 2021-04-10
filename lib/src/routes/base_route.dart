import 'package:flutter/material.dart';

abstract class BaseRoute {
  Widget handle(BuildContext context, Map<String, List<String>> parameters);

  String get templatePath;
}
