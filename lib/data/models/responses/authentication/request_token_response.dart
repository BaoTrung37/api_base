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
  final bool success;
  final String requestToken;
  final String expiresAt;

  RequestTokenResponse({
    required this.success,
    required this.requestToken,
    required this.expiresAt,
  });

  factory RequestTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RequestTokenResponseToJson(this);
}
