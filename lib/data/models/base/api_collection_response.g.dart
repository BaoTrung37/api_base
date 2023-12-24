// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiCollectionResponseImpl<T> _$$ApiCollectionResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiCollectionResponseImpl<T>(
      results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
      entries: json['entries'] as int?,
    );

Map<String, dynamic> _$$ApiCollectionResponseImplToJson<T>(
  _$ApiCollectionResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'results': instance.results.map(toJsonT).toList(),
      'entries': instance.entries,
    };
