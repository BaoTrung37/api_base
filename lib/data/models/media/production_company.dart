import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_company.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ProductionCompany {
  ProductionCompany({
    required this.id,
    required this.name,
    required this.originCountry,
    this.logoPath,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}
