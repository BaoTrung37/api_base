// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_with_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionWithLoginRequest _$SessionWithLoginRequestFromJson(
        Map<String, dynamic> json) =>
    SessionWithLoginRequest(
      username: json['username'] as String,
      password: json['password'] as String,
      requestToken: json['request_token'] as String,
    );

Map<String, dynamic> _$SessionWithLoginRequestToJson(
        SessionWithLoginRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'request_token': instance.requestToken,
    };
