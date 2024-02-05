import 'package:freezed_annotation/freezed_annotation.dart';

part 'spoken_language.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class SpokenLanguage {
  SpokenLanguage({
    required this.englishName,
    required this.name,
    this.iso6391,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
  final String englishName;
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  final String name;

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
