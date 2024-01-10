import 'package:freezed_annotation/freezed_annotation.dart';

part 'credits.g.dart';

@JsonSerializable()
class Credits {
  Credits({
    required this.cast,
    required this.crew,
    this.id,
  });

  factory Credits.fromJson(Map<String, dynamic> json) =>
      _$CreditsFromJson(json);
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'cast')
  final List<Cast> cast;
  @JsonKey(name: 'crew')
  final List<Cast> crew;

  Map<String, dynamic> toJson() => _$CreditsToJson(this);
}

@JsonSerializable()
class Cast {
  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    required this.department,
    required this.job,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
  @JsonKey(name: 'adult')
  final bool adult;
  @JsonKey(name: 'gender')
  final int gender;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'known_for_department')
  final Department knownForDepartment;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'original_name')
  final String originalName;
  @JsonKey(name: 'popularity')
  final double popularity;
  @JsonKey(name: 'profile_path')
  final String profilePath;
  @JsonKey(name: 'cast_id')
  final int castId;
  @JsonKey(name: 'character')
  final String character;
  @JsonKey(name: 'credit_id')
  final String creditId;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(name: 'department')
  final Department department;
  @JsonKey(name: 'job')
  final String job;

  Map<String, dynamic> toJson() => _$CastToJson(this);
}

enum Department {
  @JsonValue('Acting')
  acting,
  @JsonValue('Art')
  art,
  @JsonValue('Camera')
  camera,
  @JsonValue('Crew')
  crew,
  @JsonValue('Directing')
  directing,
  @JsonValue('Editing')
  editing,
  @JsonValue('Lighting')
  lighting,
  @JsonValue('Production')
  production,
  @JsonValue('Sound')
  sound,
  @JsonValue('Visual Effects')
  visualEffects,
  @JsonValue('Writing')
  writing,
}
