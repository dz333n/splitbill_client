import 'dart:io';

import 'package:dio/dio.dart';
import 'package:splitbill_client/src/viewmodels/current_user_view_model.dart';
import 'package:splitbill_client/src/application.dart';

InterceptorsWrapper unauthorizedInterceptor() {
  final _userProvider = Application.container.read(currentUserViewModel);

  return InterceptorsWrapper(
    onResponse: (Response response) {
      if (response.statusCode == HttpStatus.unauthorized) {
        _userProvider.user(null);
      }
    },
  );
}
