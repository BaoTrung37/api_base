// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/genres/genres_response.dart';
import 'package:api_base/data/models/media/media.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_series_response.freezed.dart';
part 'tv_series_response.g.dart';

@freezed
class TvSeriesResponse with _$TvSeriesResponse {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TvSeriesResponse({
    required int id,
    required String name,
    bool? adult,
    double? popularity,
    String? releaseDate,
    double? voteAverage,
    int? voteCount,
    String? title,
    String? firstAirDate,
    String? homepage,
    bool? inProduction,
    String? lastAirDate,
    LastEpisodeToAir? lastEpisodeToAir,
    int? numberOfEpisodes,
    int? numberOfSeasons,
    String? originalName,
    String? posterPath,
    String? status,
    String? tagline,
    String? type,
    @Default([]) List<int> episodeRunTime,
    @Default([]) List<String> languages,
    @Default([]) List<CreatedBy> createdBy,
    @Default([]) List<Network> networks,
    @Default([]) List<Network> productionCompanies,
    @Default([]) List<Season> seasons,
    @Default([]) List<int> genreIds,
    @Default([]) List<Genre> genres,
    @Default([]) List<ProductionCountry> productionCountries,
    @Default([]) List<SpokenLanguage> spokenLanguages,
    @Default([]) List<String> originCountry,
    String? backdropPath,
    String? nextEpisodeToAir,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
  }) = _TvSeriesResponse;

  factory TvSeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$TvSeriesResponseFromJson(json);

  const TvSeriesResponse._();
  String get genresName => genres.map((e) => e.name).join(', ');
}
