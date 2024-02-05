// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/genres/genres.dart';
import 'package:api_base/data/models/media/media.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_response.freezed.dart';
part 'movie_response.g.dart';

@freezed
class MovieResponse with _$MovieResponse {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MovieResponse({
    required bool adult,
    required int id,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String releaseDate,
    required double voteAverage,
    required int voteCount,
    required String title,
    @Default([]) List<int> genreIds,
    @Default([]) List<Genre> genres,
    @Default([]) List<ProductionCompany> productionCompanies,
    @Default([]) List<ProductionCountry> productionCountries,
    @Default([]) List<SpokenLanguage> spokenLanguages,
    @Default([]) List<String> originCountry,
    String? backdropPath,
    BelongsToCollection? belongsToCollection,
    int? budget,
    String? homepage,
    String? imdbId,
    String? posterPath,
    int? revenue,
    int? runtime,
    String? status,
    String? tagline,
    bool? video,
    SimilarResponse? similar,
    Videos? videos,
    CreditsResponse? credits,
    String? mediaType,
    String? firstAirDate,
  }) = _MovieResponse;
  const MovieResponse._();

  String get genresName => genres.map((e) => e.name).join(', ');

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}
