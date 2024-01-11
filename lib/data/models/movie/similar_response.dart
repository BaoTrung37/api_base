import 'package:api_base/data/models/movie/movie_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'similar_response.g.dart';

@JsonSerializable()
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
  final List<MovieResponse> results;

  Map<String, dynamic> toJson() => _$SimilarResponseToJson(this);
}
