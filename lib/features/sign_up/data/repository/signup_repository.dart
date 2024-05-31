import 'package:medical_sync/core/network/api_error_handler.dart';
import 'package:medical_sync/core/network/api_result.dart';
import 'package:medical_sync/core/network/api_services.dart';
import 'package:medical_sync/features/sign_up/data/model/signup_request.dart';
import 'package:medical_sync/features/sign_up/data/model/signup_response.dart';

class SignupRepository {
  final ApiService _apiService;

  SignupRepository(this._apiService);

  Future<ApiResult<SignupResponse>> sign(SignupRequest signupRequest) async {
    try {
      final response = await _apiService.signup(signupRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      );
    }
  }
}
