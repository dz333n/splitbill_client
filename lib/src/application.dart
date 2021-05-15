import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splitbill_client/src/application_routes.dart';

class Application {
  static final navigator = GlobalKey<NavigatorState>();
  static ApplicationRouter router;
  static SharedPreferences storage;

  static Future init() async {
    await _initStorage();
    _initRouter();
  }

  static _initStorage() async {
    storage = await SharedPreferences.getInstance();
  }

  static _initRouter() {
    router = ApplicationRouter();
    ApplicationRoutes.configureRouter(router);
  }
}
