import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_country.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
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
