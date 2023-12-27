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
      statusCode: json['status_code'] as String,
      statusMessage: json['status_message'] as String,
    );

Map<String, dynamic> _$RequestTokenResponseToJson(
        RequestTokenResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'request_token': instance.requestToken,
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };
