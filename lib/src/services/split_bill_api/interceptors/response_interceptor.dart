import 'package:dio/dio.dart';

InterceptorsWrapper responseConverterInterceptor() {
  return InterceptorsWrapper(
    onResponse: (Response response) {
      // This is workaround for Retrofit to work
      final originalResponseData = response.data;
      response.data = originalResponseData['data'];
      response.extra['originalResponse'] = originalResponseData;
    }
  );
}
