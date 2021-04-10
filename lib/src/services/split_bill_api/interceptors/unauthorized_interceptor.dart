import 'dart:io';

import 'package:dio/dio.dart';
import 'package:splitbill_client/src/routes/login_route.dart';
import 'package:splitbill_client/src/services/split_bill_api/token_manager.dart';
import 'package:splitbill_client/src/viewmodels/current_user_view_model.dart';
import 'package:splitbill_client/src/application.dart';

InterceptorsWrapper unauthorizedInterceptor() {
  final _userProvider = Application.container.read(currentUserViewModel);

  return InterceptorsWrapper(
    onError: (DioError error) async {
      if (error.response.statusCode == HttpStatus.unauthorized) {
        _userProvider.user = null;
        await TokenManager.saveToken(null);
        Application.navigator.currentState
            .pushReplacementNamed(LoginRoute.constructPath());
      }
    },
  );
}
