// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/genres/genres.dart';
import 'package:api_base/data/models/media/media.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_response.freezed.dart';
part 'media_response.g.dart';

@freezed
class MediaResponse with _$MediaResponse {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory MediaResponse({
    required int id,
    String? name,
    bool? adult,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? releaseDate,
    double? voteAverage,
    int? voteCount,
    String? title,
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
    bool? inProduction,
    String? lastAirDate,
    LastEpisodeToAir? lastEpisodeToAir,
    int? numberOfEpisodes,
    int? numberOfSeasons,
    String? originalName,
    String? type,
    @Default([]) List<int> genreIds,
    @Default([]) List<Genre> genres,
    @Default([]) List<ProductionCompany> productionCompanies,
    @Default([]) List<ProductionCountry> productionCountries,
    @Default([]) List<SpokenLanguage> spokenLanguages,
    @Default([]) List<String> originCountry,
    @Default([]) List<int> episodeRunTime,
    @Default([]) List<String> languages,
    @Default([]) List<CreatedBy> createdBy,
    @Default([]) List<Network> networks,
    @Default([]) List<Season> seasons,
  }) = _MediaResponse;
  const MediaResponse._();

  String get genresName => genres.map((e) => e.name).join(', ');

  factory MediaResponse.fromJson(Map<String, dynamic> json) =>
      _$MediaResponseFromJson(json);
}
