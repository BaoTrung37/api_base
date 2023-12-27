// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_token_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AccessTokenRequest {
  AccessTokenRequest({
    required this.requestToken,
  });
  factory AccessTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenRequestFromJson(json);
  final String requestToken;

  Map<String, dynamic> toJson() => _$AccessTokenRequestToJson(this);
}
