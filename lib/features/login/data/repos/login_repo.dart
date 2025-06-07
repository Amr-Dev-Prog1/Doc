import 'package:flutter_application_1/core/networking/api_error_handler.dart';
import 'package:flutter_application_1/core/networking/api_result.dart';
import 'package:flutter_application_1/core/networking/api_service.dart';
import 'package:flutter_application_1/features/login/data/models/login_response.dart';
import 'package:flutter_application_1/features/login/data/models/login_screen_body.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequsertBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequsertBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
