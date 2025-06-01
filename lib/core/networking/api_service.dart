import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/networking/api_constants.dart';
import 'package:flutter_application_1/features/login/data/models/login_responnse.dart';
import 'package:flutter_application_1/features/login/data/models/login_screen_body.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponnse> login(@Body() LoginRequestBody loginRequestBody);
}
