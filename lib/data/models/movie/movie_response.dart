// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/genres/genres.dart';
import 'package:api_base/data/models/models.dart';
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
    String? backdropPath,
    BelongsToCollection? belongsToCollection,
    int? budget,
    @Default([]) List<int> genreIds,
    @Default([]) List<Genre> genres,
    String? homepage,
    String? imdbId,
    String? posterPath,
    @Default([]) List<ProductionCompany> productionCompanies,
    @Default([]) List<ProductionCountry> productionCountries,
    int? revenue,
    int? runtime,
    @Default([]) List<SpokenLanguage> spokenLanguages,
    String? status,
    String? tagline,
    bool? video,
    SimilarResponse? similar,
    Videos? videos,
    CreditsResponse? credits,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BelongsToCollection {
  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;

  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCompany {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompany({
    required this.id,
    required this.name,
    required this.originCountry,
    this.logoPath,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCountry {
  @JsonKey(name: 'iso_639_1')
  final String? iso31661;
  final String name;

  ProductionCountry({
    required this.name,
    this.iso31661,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SpokenLanguage {
  final String englishName;
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  final String name;

  SpokenLanguage({
    required this.englishName,
    required this.name,
    this.iso6391,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
