// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'util_genres_response.g.dart';

@JsonSerializable()
class UtilGenresResponse {
  final List<String> results;
  UtilGenresResponse({
    required this.results,
  });

  factory UtilGenresResponse.fromJson(Map<String, dynamic> json) =>
      _$UtilGenresResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UtilGenresResponseToJson(this);
}
