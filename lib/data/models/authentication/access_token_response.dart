// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_token_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AccessTokenResponse {
  AccessTokenResponse({
    required this.accountId,
    required this.accessToken,
    required this.success,
    required this.statusMessage,
    required this.statusCode,
  });

  factory AccessTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenResponseFromJson(json);
  final String accountId;
  final String accessToken;
  final bool success;
  final String statusMessage;
  final int statusCode;

  Map<String, dynamic> toJson() => _$AccessTokenResponseToJson(this);
}
