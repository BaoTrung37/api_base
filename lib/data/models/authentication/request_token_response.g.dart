// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestTokenResponse _$RequestTokenResponseFromJson(
        Map<String, dynamic> json) =>
    RequestTokenResponse(
      success: json['success'] as bool,
      requestToken: json['request_token'] as String,
      expiresAt: json['expires_at'] as String,
    );

Map<String, dynamic> _$RequestTokenResponseToJson(
        RequestTokenResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'request_token': instance.requestToken,
      'expires_at': instance.expiresAt,
    };
