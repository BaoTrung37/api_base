import 'package:api_base/data/models/genres/genres_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_series_response.freezed.dart';
part 'tv_series_response.g.dart';

@freezed
class TvSeriesResponse with _$TvSeriesResponse {
  const factory TvSeriesResponse({
    required bool adult,
    required int id,
    required double popularity,
    required String releaseDate,
    required double voteAverage,
    required int voteCount,
    required String title,
    required String firstAirDate,
    required String homepage,
    required bool inProduction,
    required String lastAirDate,
    required LastEpisodeToAir lastEpisodeToAir,
    required String name,
    required int numberOfEpisodes,
    required int numberOfSeasons,
    required String originalName,
    required String posterPath,
    required String status,
    required String tagline,
    required String type,
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
    required this.profilePath,
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
  final String profilePath;

  Map<String, dynamic> toJson() => _$CreatedByToJson(this);
}

@JsonSerializable()
class LastEpisodeToAir {
  LastEpisodeToAir({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
  });

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      _$LastEpisodeToAirFromJson(json);
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'overview')
  final String overview;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  @JsonKey(name: 'air_date')
  final DateTime airDate;
  @JsonKey(name: 'episode_number')
  final int episodeNumber;
  @JsonKey(name: 'production_code')
  final String productionCode;
  @JsonKey(name: 'runtime')
  final int runtime;
  @JsonKey(name: 'season_number')
  final int seasonNumber;
  @JsonKey(name: 'show_id')
  final int showId;
  @JsonKey(name: 'still_path')
  final String stillPath;

  Map<String, dynamic> toJson() => _$LastEpisodeToAirToJson(this);
}

@JsonSerializable()
class Network {
  Network({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'logo_path')
  final String logoPath;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'origin_country')
  final String originCountry;

  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}

@JsonSerializable()
class ProductionCountry {
  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  @JsonKey(name: 'name')
  final String name;

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable()
class Season {
  Season({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
  @JsonKey(name: 'air_date')
  final DateTime airDate;
  @JsonKey(name: 'episode_count')
  final int episodeCount;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'overview')
  final String overview;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'season_number')
  final int seasonNumber;
  @JsonKey(name: 'vote_average')
  final double voteAverage;

  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}

@JsonSerializable()
class SpokenLanguage {
  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
  @JsonKey(name: 'english_name')
  final String englishName;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'name')
  final String name;

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
