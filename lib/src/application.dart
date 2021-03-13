import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splitbill_client/src/application_routes.dart';

class Application {
  static ProviderContainer container;
  static ApplicationRouter router;
  static FlutterSecureStorage storage;

  static init() {
    _initStorage();
    _initRouter();
    // Adding container here works but seems to be incorect:
    // ProviderScope already defines own container
    // But I don't know how to use it, so:
    container = ProviderContainer();
  }

  static _initStorage() {
    storage = FlutterSecureStorage();
  }

  static _initRouter() {
    router = ApplicationRouter();
    ApplicationRoutes.configureRouter(router);
  }
}
