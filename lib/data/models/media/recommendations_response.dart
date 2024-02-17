import 'package:api_base/data/models/media/media_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommendations_response.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class RecommendationsResponse {
  RecommendationsResponse({
    required this.page,
    required this.results,
  });

  factory RecommendationsResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendationsResponseFromJson(json);
  @JsonKey(name: 'page')
  final int page;
  @JsonKey(name: 'results')
  final List<MediaResponse> results;

  Map<String, dynamic> toJson() => _$RecommendationsResponseToJson(this);
}
