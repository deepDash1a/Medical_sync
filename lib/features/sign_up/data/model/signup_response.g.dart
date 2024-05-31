// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      json['message'] as String?,
      json['userData'] as List<dynamic>?,
      json['status'] as bool?,
      (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userData': instance.userData,
      'status': instance.status,
      'code': instance.code,
    };
