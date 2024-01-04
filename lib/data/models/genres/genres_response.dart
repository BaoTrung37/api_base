import 'package:freezed_annotation/freezed_annotation.dart';

part 'genres_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GenresResponse {
  GenresResponse({
    required this.genres,
  });

  factory GenresResponse.fromJson(Map<String, dynamic> json) =>
      _$GenresResponseFromJson(json);

  final List<Genre> genres;

  Map<String, dynamic> toJson() => _$GenresResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  final int id;
  final String name;

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
