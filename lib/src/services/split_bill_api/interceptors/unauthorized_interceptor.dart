import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splitbill_client/src/viewmodels/current_user_view_model.dart';

InterceptorsWrapper unauthorizedInterceptor() {
  final _userProvider = ProviderContainer().read(currentUserViewModel);

  return InterceptorsWrapper(
    onResponse: (Response response) {
      if (response.statusCode == HttpStatus.unauthorized) {
        _userProvider.user(null);
      }
    },
  );
}
