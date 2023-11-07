// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_collection_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiCollectionResponse<T> _$ApiCollectionResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ApiCollectionResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ApiCollectionResponse<T> {
  int? get entries => throw _privateConstructorUsedError;
  List<T> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiCollectionResponseCopyWith<T, ApiCollectionResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiCollectionResponseCopyWith<T, $Res> {
  factory $ApiCollectionResponseCopyWith(ApiCollectionResponse<T> value,
          $Res Function(ApiCollectionResponse<T>) then) =
      _$ApiCollectionResponseCopyWithImpl<T, $Res, ApiCollectionResponse<T>>;
  @useResult
  $Res call({int? entries, List<T> results});
}

/// @nodoc
class _$ApiCollectionResponseCopyWithImpl<T, $Res,
        $Val extends ApiCollectionResponse<T>>
    implements $ApiCollectionResponseCopyWith<T, $Res> {
  _$ApiCollectionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      entries: freezed == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as int?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiCollectionResponseImplCopyWith<T, $Res>
    implements $ApiCollectionResponseCopyWith<T, $Res> {
  factory _$$ApiCollectionResponseImplCopyWith(
          _$ApiCollectionResponseImpl<T> value,
          $Res Function(_$ApiCollectionResponseImpl<T>) then) =
      __$$ApiCollectionResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int? entries, List<T> results});
}

/// @nodoc
class __$$ApiCollectionResponseImplCopyWithImpl<T, $Res>
    extends _$ApiCollectionResponseCopyWithImpl<T, $Res,
        _$ApiCollectionResponseImpl<T>>
    implements _$$ApiCollectionResponseImplCopyWith<T, $Res> {
  __$$ApiCollectionResponseImplCopyWithImpl(
      _$ApiCollectionResponseImpl<T> _value,
      $Res Function(_$ApiCollectionResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = freezed,
    Object? results = null,
  }) {
    return _then(_$ApiCollectionResponseImpl<T>(
      entries: freezed == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as int?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiCollectionResponseImpl<T> implements _ApiCollectionResponse<T> {
  const _$ApiCollectionResponseImpl(
      {this.entries, required final List<T> results})
      : _results = results;

  factory _$ApiCollectionResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ApiCollectionResponseImplFromJson(json, fromJsonT);

  @override
  final int? entries;
  final List<T> _results;
  @override
  List<T> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'ApiCollectionResponse<$T>(entries: $entries, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiCollectionResponseImpl<T> &&
            (identical(other.entries, entries) || other.entries == entries) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, entries, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiCollectionResponseImplCopyWith<T, _$ApiCollectionResponseImpl<T>>
      get copyWith => __$$ApiCollectionResponseImplCopyWithImpl<T,
          _$ApiCollectionResponseImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiCollectionResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _ApiCollectionResponse<T> implements ApiCollectionResponse<T> {
  const factory _ApiCollectionResponse(
      {final int? entries,
      required final List<T> results}) = _$ApiCollectionResponseImpl<T>;

  factory _ApiCollectionResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ApiCollectionResponseImpl<T>.fromJson;

  @override
  int? get entries;
  @override
  List<T> get results;
  @override
  @JsonKey(ignore: true)
  _$$ApiCollectionResponseImplCopyWith<T, _$ApiCollectionResponseImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
