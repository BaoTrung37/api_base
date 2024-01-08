import 'package:freezed_annotation/freezed_annotation.dart';

part 'videos.g.dart';

@JsonSerializable()
class Videos {
  Videos({
    required this.id,
    required this.results,
  });

  factory Videos.fromJson(Map<String, dynamic> json) => _$VideosFromJson(json);
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'results')
  final List<Result> results;

  Map<String, dynamic> toJson() => _$VideosToJson(this);
}

@JsonSerializable()
class Result {
  Result({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'key')
  final String key;
  @JsonKey(name: 'site')
  final String site;
  @JsonKey(name: 'size')
  final int size;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'official')
  final bool official;
  @JsonKey(name: 'published_at')
  final DateTime publishedAt;
  @JsonKey(name: 'id')
  final String id;

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
