// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessTokenResponse _$AccessTokenResponseFromJson(Map<String, dynamic> json) =>
    AccessTokenResponse(
      accountId: json['account_id'] as String,
      accessToken: json['access_token'] as String,
      success: json['success'] as bool,
      statusMessage: json['status_message'] as String,
      statusCode: json['status_code'] as int,
    );

Map<String, dynamic> _$AccessTokenResponseToJson(
        AccessTokenResponse instance) =>
    <String, dynamic>{
      'account_id': instance.accountId,
      'access_token': instance.accessToken,
      'success': instance.success,
      'status_message': instance.statusMessage,
      'status_code': instance.statusCode,
    };
