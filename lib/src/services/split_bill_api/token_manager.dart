import 'package:splitbill_client/src/application.dart';

class TokenManager {
  static const _storageKey = "auth_token";

  static Future<String> readToken() {
    return Application.storage.read(key: _storageKey);
  }

  static Future saveToken(String token) async {
    await Application.storage.write(key: _storageKey, value: token);
  }
}
