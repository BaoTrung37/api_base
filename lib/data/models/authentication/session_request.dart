import 'package:json_annotation/json_annotation.dart';
part 'session_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SessionRequest {
  final String requestToken;
  SessionRequest({
    required this.requestToken,
  });
  factory SessionRequest.fromJson(Map<String, dynamic> json) =>
      _$SessionRequestFromJson(json);
}
