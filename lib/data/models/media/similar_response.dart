import 'package:api_base/data/models/media/media_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'similar_response.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class SimilarResponse {
  SimilarResponse({
    required this.page,
    required this.results,
  });

  factory SimilarResponse.fromJson(Map<String, dynamic> json) =>
      _$SimilarResponseFromJson(json);
  @JsonKey(name: 'page')
  final int page;
  @JsonKey(name: 'results')
  final List<MediaResponse> results;

  Map<String, dynamic> toJson() => _$SimilarResponseToJson(this);
}
