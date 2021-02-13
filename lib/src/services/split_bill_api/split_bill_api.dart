import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:splitbill_client/config.dart';
import 'package:splitbill_client/src/models/login_information.dart';
import 'package:splitbill_client/src/services/split_bill_api/interceptors/auth_interceptor.dart';
import 'package:splitbill_client/src/services/split_bill_api/interceptors/response_interceptor.dart';

part 'split_bill_api.g.dart';

@RestApi(baseUrl: BASE_API_URL)
abstract class SplitBillClient {
  factory SplitBillClient(Dio dio, {String baseUrl}) = _SplitBillClient;

  @POST('/user/login')
  Future<String> login(@Body() LoginInformation loginInformation);
}

Dio _initDio() {
  final _client = new Dio();

  _client.interceptors.add(authInterceptor(_client));
  _client.interceptors.add(responseConverterInterceptor());

  return _client;
}

final client = SplitBillClient(_initDio());
