import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Application {
  static FlutterSecureStorage storage;

  static init() {
    _initStorage();
  }

  static _initStorage() {
    storage = FlutterSecureStorage();
  }
}