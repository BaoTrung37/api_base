import 'package:freezed_annotation/freezed_annotation.dart';

part 'credits_response.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class CreditsResponse {
  CreditsResponse({
    required this.cast,
    required this.crew,
    this.id,
  });

  factory CreditsResponse.fromJson(Map<String, dynamic> json) =>
      _$CreditsResponseFromJson(json);
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'cast')
  final List<Cast> cast;
  @JsonKey(name: 'crew')
  final List<Cast> crew;

  Map<String, dynamic> toJson() => _$CreditsResponseToJson(this);
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
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.profilePath,
    this.job,
    this.department,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
  @JsonKey(name: 'adult')
  final bool adult;
  @JsonKey(name: 'gender')
  final int gender;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'original_name')
  final String originalName;
  @JsonKey(name: 'popularity')
  final double popularity;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @JsonKey(name: 'cast_id')
  final int? castId;
  @JsonKey(name: 'character')
  final String? character;
  @JsonKey(name: 'credit_id')
  final String? creditId;
  @JsonKey(name: 'order')
  final int? order;
  @JsonKey(name: 'department')
  final String? department;
  @JsonKey(name: 'job')
  final String? job;

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
