import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_collection_response.freezed.dart';
part 'api_collection_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class ApiCollectionResponse<T> with _$ApiCollectionResponse<T> {
  const factory ApiCollectionResponse({
    required List<T> results,
    int? entries,
  }) = _ApiCollectionResponse<T>;

  factory ApiCollectionResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiCollectionResponseFromJson(json, fromJsonT);
}
