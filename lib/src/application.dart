import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:splitbill_client/src/application_routes.dart';

class Application {
  static final navigator = GlobalKey<NavigatorState>();
  static ApplicationRouter router;
  static FlutterSecureStorage storage;

  static init() {
    _initStorage();
    _initRouter();
  }

  static _initStorage() {
    storage = FlutterSecureStorage();
  }

  static _initRouter() {
    router = ApplicationRouter();
    ApplicationRoutes.configureRouter(router);
  }
}
