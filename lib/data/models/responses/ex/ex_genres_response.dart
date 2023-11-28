// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ex_genres_response.g.dart';

@JsonSerializable()
class ExGenresResponse {
  final String? genres;
  ExGenresResponse({
    this.genres,
  });

  factory ExGenresResponse.fromJson(Map<String, dynamic> json) =>
      _$ExGenresResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExGenresResponseToJson(this);
}
