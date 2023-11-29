// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestSessionResponse _$GuestSessionResponseFromJson(
        Map<String, dynamic> json) =>
    GuestSessionResponse(
      success: json['success'] as bool,
      guestSessionId: json['guest_session_id'] as String,
      expiresAt: json['expires_at'] as String,
    );

Map<String, dynamic> _$GuestSessionResponseToJson(
        GuestSessionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'guest_session_id': instance.guestSessionId,
      'expires_at': instance.expiresAt,
    };
