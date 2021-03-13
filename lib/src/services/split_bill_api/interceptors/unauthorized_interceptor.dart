import 'package:dio/dio.dart';

InterceptorsWrapper unauthorizedInterceptor() {
  return InterceptorsWrapper(
    onResponse: (Response response) {
    },
  );
}
