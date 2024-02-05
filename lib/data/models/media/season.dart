import 'package:freezed_annotation/freezed_annotation.dart';

part 'season.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
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
