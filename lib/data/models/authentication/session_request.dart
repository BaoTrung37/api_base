// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'session_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SessionRequest {
  SessionRequest({
    this.requestToken,
    this.accessToken,
  });
  factory SessionRequest.fromJson(Map<String, dynamic> json) =>
      _$SessionRequestFromJson(json);
  final String? requestToken;
  final String? accessToken;

  Map<String, dynamic> toJson() => _$SessionRequestToJson(this);
}
