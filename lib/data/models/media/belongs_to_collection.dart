import 'package:freezed_annotation/freezed_annotation.dart';

part 'belongs_to_collection.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class BelongsToCollection {
  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);
  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;

  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
}
