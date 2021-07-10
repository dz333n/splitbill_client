import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const _storageKey = "auth_token";

  static Future<String> readToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_storageKey);
  }

  static Future saveToken(String token) async {
    if (token == null) {
      token = '';
    }
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_storageKey, token);
  }
}
