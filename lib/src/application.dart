import 'package:flutter/material.dart';
import 'package:splitbill_client/src/application_routes.dart';

class Application {
  static final navigator = GlobalKey<NavigatorState>();
  static ApplicationRouter router;

  static Future init() async {
    _initRouter();
  }

  static _initRouter() {
    router = ApplicationRouter();
    ApplicationRoutes.configureRouter(router);
  }
}
