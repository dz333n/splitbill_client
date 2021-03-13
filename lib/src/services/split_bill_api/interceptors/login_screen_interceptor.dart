import 'package:dio/dio.dart';

InterceptorsWrapper loginScreenInterceptor() {
  return InterceptorsWrapper(
    onResponse: (Response response) {
    },
  );
}
