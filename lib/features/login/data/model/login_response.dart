import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  List<dynamic>? userData;
  bool? status;
  int? code;

  LoginResponse(
    this.message,
    this.userData,
    this.status,
    this.code,
  );

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
