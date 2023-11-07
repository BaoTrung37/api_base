// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/base/api_error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// @JsonSerializable(genericArgumentFactories: true)
// class ApiResponse<T> {
//   @JsonKey(name: 'data')
//   final T? data;

//   @JsonKey(name: 'error')
//   final ApiErrorResponse? error;

//   factory ApiResponse.fromJson(
//     Map<String, dynamic> json,
//     T Function(Object?) fromJsonT,
//   ) =>
//       _$ApiResponseFromJson<T>(json, fromJsonT);

//   ApiResponse({
//     this.data,
//     this.error,
//   });
// }
part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    ApiErrorResponse? error,
    T? results,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
}
