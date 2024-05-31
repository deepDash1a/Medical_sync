import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

@JsonSerializable()
class SignupRequest {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String password;
  final String confirmPassword;

  SignupRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}
