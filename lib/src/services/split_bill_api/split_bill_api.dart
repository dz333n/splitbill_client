import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:splitbill_client/config.dart';
import 'package:splitbill_client/src/models/event.dart';
import 'package:splitbill_client/src/models/login_information.dart';
import 'package:splitbill_client/src/services/split_bill_api/interceptors/auth_interceptor.dart';
import 'package:splitbill_client/src/services/split_bill_api/interceptors/unauthorized_interceptor.dart';
import 'package:splitbill_client/src/services/split_bill_api/interceptors/response_interceptor.dart';
import 'package:splitbill_client/src/services/split_bill_api/token_manager.dart';
import 'package:splitbill_client/src/models/user.dart';
import 'package:splitbill_client/src/viewmodels/current_user_view_model.dart';
import 'package:splitbill_client/src/application.dart';

part 'split_bill_api.g.dart';

class _ExtendedSplitbillClient extends _SplitBillClient {
  _ExtendedSplitbillClient(Dio dio, {String baseUrl})
      : super(dio, baseUrl: baseUrl);

  Future<String> _processToken(LoginInformation loginInformation) async {
    final token = await super.login(loginInformation);
    await TokenManager.saveToken(token);
    return token;
  }

  Future<void> _processCurrentUser() async {
    final userProvider = Application.container.read(currentUserViewModel);
    await userProvider.refresh();
  }

  Future<String> login(LoginInformation loginInformation) async {
    final token = await _processToken(loginInformation);
    await _processCurrentUser();

    return token;
  }
}

@RestApi(baseUrl: BASE_API_URL)
abstract class SplitBillClient {
  factory SplitBillClient(Dio dio, {String baseUrl}) = _ExtendedSplitbillClient;

  @POST('/user/login')
  Future<String> login(@Body() LoginInformation loginInformation);

  @GET("/events")
  Future<List<Event>> getEvents();

  @GET('/user')
  Future<User> getCurrentUser();
}

Dio _initDio() {
  final _client = new Dio();

  _client.interceptors.add(authInterceptor(_client));
  _client.interceptors.add(responseConverterInterceptor());
  _client.interceptors.add(unauthorizedInterceptor());

  return _client;
}

final client = SplitBillClient(_initDio());
