import 'package:dio/dio.dart';

import 'package:splitbill_client/src/application.dart';

const _header = "X-AUTH-TOKEN";
const _storageKey = "auth_token";

Future<String> _getAuthToken() async {
  return Application.storage.read(key: _storageKey);
}

InterceptorsWrapper authInterceptor(Dio client) {
  return InterceptorsWrapper(
    onRequest: (RequestOptions options) async {
      client.lock();
      var token = await _getAuthToken();
      options.headers.addAll({_header: token});
      client.unlock();
      return options;
    },
  );
}
