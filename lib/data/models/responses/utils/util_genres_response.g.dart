// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'util_genres_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UtilGenresResponse _$UtilGenresResponseFromJson(Map<String, dynamic> json) =>
    UtilGenresResponse(
      results:
          (json['results'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UtilGenresResponseToJson(UtilGenresResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
