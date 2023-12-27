// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestTokenRequest _$RequestTokenRequestFromJson(Map<String, dynamic> json) =>
    RequestTokenRequest(
      redirectTo: json['redirect_to'] as String?,
    );

Map<String, dynamic> _$RequestTokenRequestToJson(
        RequestTokenRequest instance) =>
    <String, dynamic>{
      'redirect_to': instance.redirectTo,
    };
