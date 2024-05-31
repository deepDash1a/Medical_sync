import 'package:dio/dio.dart';
import 'package:medical_sync/core/network/api_constance.dart';
import 'package:medical_sync/features/login/data/model/login_request.dart';
import 'package:medical_sync/features/login/data/model/login_response.dart';
import 'package:medical_sync/features/sign_up/data/model/signup_request.dart';
import 'package:medical_sync/features/sign_up/data/model/signup_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstance.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstance.login)
  Future<LoginResponse> login(
    @Body() LoginRequest loginRequest,
  );

  @POST(ApiConstance.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequest signupRequest,
  );
}
