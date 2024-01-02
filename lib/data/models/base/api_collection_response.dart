import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_collection_response.freezed.dart';
part 'api_collection_response.g.dart';

@Freezed(genericArgumentFactories: true)
@JsonSerializable(
  genericArgumentFactories: true,
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
abstract class ApiCollectionResponse<T> with _$ApiCollectionResponse<T> {
  const factory ApiCollectionResponse({
    required int page,
    required List<T> results,
    required int totalPages,
    required int totalResults,
  }) = _ApiCollectionResponse<T>;

  factory ApiCollectionResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiCollectionResponseFromJson(json, fromJsonT);
}
