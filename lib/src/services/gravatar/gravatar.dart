import 'dart:convert';

import 'package:crypto/crypto.dart';

const _GRAVATAR_BASE_URL = "https://www.gravatar.com";

String _generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

class Gravatar {
  static String getAvatar(String email, {int size = 30}) {
    final encodedEmail = _generateMd5(email);
    final url = "$_GRAVATAR_BASE_URL/avatar/$encodedEmail?s=$size&d=wavatar";
    return url;
  }
}
