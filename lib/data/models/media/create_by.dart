import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_by.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
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
