import 'package:freezed_annotation/freezed_annotation.dart';

part 'network.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Network {
  Network({
    required this.id,
    required this.name,
    this.logoPath,
    this.originCountry,
  });

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'origin_country')
  final String? originCountry;

  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}
