import 'package:medical_sync/core/network/api_error_handler.dart';
import 'package:medical_sync/core/network/api_result.dart';
import 'package:medical_sync/core/network/api_services.dart';
import 'package:medical_sync/features/login/data/model/login_request.dart';
import 'package:medical_sync/features/login/data/model/login_response.dart';

class LoginRepository {
  final ApiService _apiService;

  LoginRepository(this._apiService);

  Future<ApiResult<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await _apiService.login(loginRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      );
    }
  }
}
