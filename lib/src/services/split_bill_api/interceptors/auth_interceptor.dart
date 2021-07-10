import 'package:dio/dio.dart';

import 'package:splitbill_client/src/services/split_bill_api/token_manager.dart';

const _header = "X-AUTH-TOKEN";

Future<String?> _getAuthToken() async {
  return TokenManager.readToken();
}

InterceptorsWrapper authInterceptor(Dio client) {
  return InterceptorsWrapper(
    onRequest: (
      RequestOptions options,
      RequestInterceptorHandler handler,
    ) async {
      client.lock();
      var token = await _getAuthToken();
      options.headers.addAll({_header: token});
      client.unlock();

      return handler.next(options);
    },
  );
}
