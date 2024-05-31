import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  String? message;
  List<dynamic>? userData;
  bool? status;
  int? code;

  SignupResponse(
    this.message,
    this.userData,
    this.status,
    this.code,
  );

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}
