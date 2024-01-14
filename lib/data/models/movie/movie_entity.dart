import 'package:api_base/data/models/movie/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../genres/genres.dart';

part 'movie_entity.freezed.dart';

@freezed
class MovieEntity with _$MovieEntity {
  const factory MovieEntity({
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
    List<Genre>? genres,
    String? homepage,
    String? imdbId,
    String? posterPath,
    List<ProductionCompany>? productionCompanies,
    List<ProductionCountry>? productionCountries,
    int? revenue,
    int? runtime,
    List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
    bool? video,
    SimilarResponse? similar,
    Videos? videos,
    CreditsResponse? credits,
  }) = _MovieEntity;
}
