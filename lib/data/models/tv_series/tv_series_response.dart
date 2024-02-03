// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/genres/genres_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_series_response.freezed.dart';
part 'tv_series_response.g.dart';

@freezed
class TvSeriesResponse with _$TvSeriesResponse {
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

@JsonSerializable()
class CreatedBy {
  CreatedBy({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
    this.profilePath,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'credit_id')
  final String creditId;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'gender')
  final int gender;
  @JsonKey(name: 'profile_path')
  final String? profilePath;

  Map<String, dynamic> toJson() => _$CreatedByToJson(this);
}

@JsonSerializable()
class LastEpisodeToAir {
  LastEpisodeToAir({
    required this.id,
    required this.name,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.airDate,
    this.episodeNumber,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
  });
  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      _$LastEpisodeToAirFromJson(json);
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'overview')
  final String? overview;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  @JsonKey(name: 'air_date')
  final String? airDate;
  @JsonKey(name: 'episode_number')
  final int? episodeNumber;
  @JsonKey(name: 'production_code')
  final String? productionCode;
  @JsonKey(name: 'runtime')
  final int? runtime;
  @JsonKey(name: 'season_number')
  final int? seasonNumber;
  @JsonKey(name: 'show_id')
  final int? showId;
  @JsonKey(name: 'still_path')
  final String? stillPath;

  Map<String, dynamic> toJson() => _$LastEpisodeToAirToJson(this);
}

@JsonSerializable()
class Network {
  Network({
    required this.id,
    required this.name,
    this.logoPath,
    this.originCountry,
  });

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'origin_country')
  final String? originCountry;

  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}

@JsonSerializable()
class ProductionCountry {
  ProductionCountry({
    required this.name,
    this.iso31661,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;
  @JsonKey(name: 'name')
  final String name;

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable()
class Season {
  Season({
    required this.id,
    required this.name,
    this.airDate,
    this.episodeCount,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage,
  });

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
  @JsonKey(name: 'air_date')
  final String? airDate;
  @JsonKey(name: 'episode_count')
  final int? episodeCount;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'overview')
  final String? overview;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'season_number')
  final int? seasonNumber;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}

@JsonSerializable()
class SpokenLanguage {
  SpokenLanguage({
    required this.name,
    this.englishName,
    this.iso6391,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
  @JsonKey(name: 'english_name')
  final String? englishName;
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  @JsonKey(name: 'name')
  final String name;

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
