import 'package:splitbill_client/src/application.dart';

class TokenManager {
  static const _storageKey = "auth_token";

  static Future<String> readToken() async {
    return Application.storage.getString(_storageKey);
  }

  static Future saveToken(String token) async {
    if (token == null) {
      token = '';
    }
    await Application.storage.setString(_storageKey, token);
  }
}
