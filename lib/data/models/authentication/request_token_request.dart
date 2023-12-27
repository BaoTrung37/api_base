// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_token_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RequestTokenRequest {
  RequestTokenRequest({
    this.redirectTo,
  });
  factory RequestTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$RequestTokenRequestFromJson(json);
  final String? redirectTo;

  Map<String, dynamic> toJson() => _$RequestTokenRequestToJson(this);
}
