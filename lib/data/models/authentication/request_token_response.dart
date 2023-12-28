// ignore_for_file: public_member_api_docs, sort_constructors_first
// part 'request_token_response.g.dart';
// part 'request_token_response.freezed.dart';

// @freezed
// class RequestTokenResponse with _$RequestTokenResponse {
//   // ignore: invalid_annotation_target
//   @JsonSerializable(fieldRename: FieldRename.snake)
//   const factory RequestTokenResponse({
//     required bool success,
//     required String requestToken,
//     required String expiresAt,
//   }) = _RequestTokenResponse;
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_token_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RequestTokenResponse {
  RequestTokenResponse({
    required this.success,
    required this.requestToken,
    required this.statusCode,
    required this.statusMessage,
    required this.expiresAt,
  });

  factory RequestTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestTokenResponseFromJson(json);
  final bool success;
  final String requestToken;
  final int? statusCode;
  final String? statusMessage;
  final String? expiresAt;

  Map<String, dynamic> toJson() => _$RequestTokenResponseToJson(this);
}
