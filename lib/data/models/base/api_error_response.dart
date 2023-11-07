// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_error_response.g.dart';

@JsonSerializable()
class ApiErrorResponse {
  final String message;
  ApiErrorResponse({
    required this.message,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorResponseFromJson(json);
}
