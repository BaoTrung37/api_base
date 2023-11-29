// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
part 'session_with_login_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SessionWithLoginRequest {
  final String username;
  final String password;
  final String requestToken;

  SessionWithLoginRequest({
    required this.username,
    required this.password,
    required this.requestToken,
  });

  factory SessionWithLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$SessionWithLoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SessionWithLoginRequestToJson(this);
}
