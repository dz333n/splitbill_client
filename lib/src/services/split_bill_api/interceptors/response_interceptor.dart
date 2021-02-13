import 'dart:convert';

import 'package:dio/dio.dart';

InterceptorsWrapper responseConverterInterceptor() {
  return InterceptorsWrapper(
    onResponse: (Response response) {
      // This is workaround for Retrofit to work
      final originalResponseData = response.data;
      // Response comes in a format that we cannot directly parse to our models
      // because it contains other info like 'status', 'message' etc.
      // Only one field that we are interested in right now is data
      response.data = jsonDecode(originalResponseData)['data'].toString();
    }
  );
}
