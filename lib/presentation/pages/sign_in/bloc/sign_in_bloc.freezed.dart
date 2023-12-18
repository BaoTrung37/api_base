// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() signInSubmitted,
    required TResult Function() signUpSubmitted,
    required TResult Function(bool value) rememberMeChanged,
    required TResult Function(String username) usernameChanged,
    required TResult Function(String password) passwordChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? signInSubmitted,
    TResult? Function()? signUpSubmitted,
    TResult? Function(bool value)? rememberMeChanged,
    TResult? Function(String username)? usernameChanged,
    TResult? Function(String password)? passwordChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? signInSubmitted,
    TResult Function()? signUpSubmitted,
    TResult Function(bool value)? rememberMeChanged,
    TResult Function(String username)? usernameChanged,
    TResult Function(String password)? passwordChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SignInSubmitted value) signInSubmitted,
    required TResult Function(_SignUpSubmitted value) signUpSubmitted,
    required TResult Function(_RememberMe value) rememberMeChanged,
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SignInSubmitted value)? signInSubmitted,
    TResult? Function(_SignUpSubmitted value)? signUpSubmitted,
    TResult? Function(_RememberMe value)? rememberMeChanged,
    TResult? Function(_UsernameChanged value)? usernameChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SignInSubmitted value)? signInSubmitted,
    TResult Function(_SignUpSubmitted value)? signUpSubmitted,
    TResult Function(_RememberMe value)? rememberMeChanged,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEventCopyWith<$Res> {
  factory $SignInEventCopyWith(
          SignInEvent value, $Res Function(SignInEvent) then) =
      _$SignInEventCopyWithImpl<$Res, SignInEvent>;
}

/// @nodoc
class _$SignInEventCopyWithImpl<$Res, $Val extends SignInEvent>
    implements $SignInEventCopyWith<$Res> {
  _$SignInEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'SignInEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() signInSubmitted,
    required TResult Function() signUpSubmitted,
    required TResult Function(bool value) rememberMeChanged,
    required TResult Function(String username) usernameChanged,
    required TResult Function(String password) passwordChanged,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? signInSubmitted,
    TResult? Function()? signUpSubmitted,
    TResult? Function(bool value)? rememberMeChanged,
    TResult? Function(String username)? usernameChanged,
    TResult? Function(String password)? passwordChanged,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? signInSubmitted,
    TResult Function()? signUpSubmitted,
    TResult Function(bool value)? rememberMeChanged,
    TResult Function(String username)? usernameChanged,
    TResult Function(String password)? passwordChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SignInSubmitted value) signInSubmitted,
    required TResult Function(_SignUpSubmitted value) signUpSubmitted,
    required TResult Function(_RememberMe value) rememberMeChanged,
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SignInSubmitted value)? signInSubmitted,
    TResult? Function(_SignUpSubmitted value)? signUpSubmitted,
    TResult? Function(_RememberMe value)? rememberMeChanged,
    TResult? Function(_UsernameChanged value)? usernameChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SignInSubmitted value)? signInSubmitted,
    TResult Function(_SignUpSubmitted value)? signUpSubmitted,
    TResult Function(_RememberMe value)? rememberMeChanged,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SignInEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SignInSubmittedImplCopyWith<$Res> {
  factory _$$SignInSubmittedImplCopyWith(_$SignInSubmittedImpl value,
          $Res Function(_$SignInSubmittedImpl) then) =
      __$$SignInSubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInSubmittedImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$SignInSubmittedImpl>
    implements _$$SignInSubmittedImplCopyWith<$Res> {
  __$$SignInSubmittedImplCopyWithImpl(
      _$SignInSubmittedImpl _value, $Res Function(_$SignInSubmittedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignInSubmittedImpl implements _SignInSubmitted {
  const _$SignInSubmittedImpl();

  @override
  String toString() {
    return 'SignInEvent.signInSubmitted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInSubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() signInSubmitted,
    required TResult Function() signUpSubmitted,
    required TResult Function(bool value) rememberMeChanged,
    required TResult Function(String username) usernameChanged,
    required TResult Function(String password) passwordChanged,
  }) {
    return signInSubmitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? signInSubmitted,
    TResult? Function()? signUpSubmitted,
    TResult? Function(bool value)? rememberMeChanged,
    TResult? Function(String username)? usernameChanged,
    TResult? Function(String password)? passwordChanged,
  }) {
    return signInSubmitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? signInSubmitted,
    TResult Function()? signUpSubmitted,
    TResult Function(bool value)? rememberMeChanged,
    TResult Function(String username)? usernameChanged,
    TResult Function(String password)? passwordChanged,
    required TResult orElse(),
  }) {
    if (signInSubmitted != null) {
      return signInSubmitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SignInSubmitted value) signInSubmitted,
    required TResult Function(_SignUpSubmitted value) signUpSubmitted,
    required TResult Function(_RememberMe value) rememberMeChanged,
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
  }) {
    return signInSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SignInSubmitted value)? signInSubmitted,
    TResult? Function(_SignUpSubmitted value)? signUpSubmitted,
    TResult? Function(_RememberMe value)? rememberMeChanged,
    TResult? Function(_UsernameChanged value)? usernameChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
  }) {
    return signInSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SignInSubmitted value)? signInSubmitted,
    TResult Function(_SignUpSubmitted value)? signUpSubmitted,
    TResult Function(_RememberMe value)? rememberMeChanged,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    required TResult orElse(),
  }) {
    if (signInSubmitted != null) {
      return signInSubmitted(this);
    }
    return orElse();
  }
}

abstract class _SignInSubmitted implements SignInEvent {
  const factory _SignInSubmitted() = _$SignInSubmittedImpl;
}

/// @nodoc
abstract class _$$SignUpSubmittedImplCopyWith<$Res> {
  factory _$$SignUpSubmittedImplCopyWith(_$SignUpSubmittedImpl value,
          $Res Function(_$SignUpSubmittedImpl) then) =
      __$$SignUpSubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpSubmittedImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$SignUpSubmittedImpl>
    implements _$$SignUpSubmittedImplCopyWith<$Res> {
  __$$SignUpSubmittedImplCopyWithImpl(
      _$SignUpSubmittedImpl _value, $Res Function(_$SignUpSubmittedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignUpSubmittedImpl implements _SignUpSubmitted {
  const _$SignUpSubmittedImpl();

  @override
  String toString() {
    return 'SignInEvent.signUpSubmitted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpSubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() signInSubmitted,
    required TResult Function() signUpSubmitted,
    required TResult Function(bool value) rememberMeChanged,
    required TResult Function(String username) usernameChanged,
    required TResult Function(String password) passwordChanged,
  }) {
    return signUpSubmitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? signInSubmitted,
    TResult? Function()? signUpSubmitted,
    TResult? Function(bool value)? rememberMeChanged,
    TResult? Function(String username)? usernameChanged,
    TResult? Function(String password)? passwordChanged,
  }) {
    return signUpSubmitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? signInSubmitted,
    TResult Function()? signUpSubmitted,
    TResult Function(bool value)? rememberMeChanged,
    TResult Function(String username)? usernameChanged,
    TResult Function(String password)? passwordChanged,
    required TResult orElse(),
  }) {
    if (signUpSubmitted != null) {
      return signUpSubmitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SignInSubmitted value) signInSubmitted,
    required TResult Function(_SignUpSubmitted value) signUpSubmitted,
    required TResult Function(_RememberMe value) rememberMeChanged,
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
  }) {
    return signUpSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SignInSubmitted value)? signInSubmitted,
    TResult? Function(_SignUpSubmitted value)? signUpSubmitted,
    TResult? Function(_RememberMe value)? rememberMeChanged,
    TResult? Function(_UsernameChanged value)? usernameChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
  }) {
    return signUpSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SignInSubmitted value)? signInSubmitted,
    TResult Function(_SignUpSubmitted value)? signUpSubmitted,
    TResult Function(_RememberMe value)? rememberMeChanged,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    required TResult orElse(),
  }) {
    if (signUpSubmitted != null) {
      return signUpSubmitted(this);
    }
    return orElse();
  }
}

abstract class _SignUpSubmitted implements SignInEvent {
  const factory _SignUpSubmitted() = _$SignUpSubmittedImpl;
}

/// @nodoc
abstract class _$$RememberMeImplCopyWith<$Res> {
  factory _$$RememberMeImplCopyWith(
          _$RememberMeImpl value, $Res Function(_$RememberMeImpl) then) =
      __$$RememberMeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$RememberMeImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$RememberMeImpl>
    implements _$$RememberMeImplCopyWith<$Res> {
  __$$RememberMeImplCopyWithImpl(
      _$RememberMeImpl _value, $Res Function(_$RememberMeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$RememberMeImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RememberMeImpl implements _RememberMe {
  const _$RememberMeImpl(this.value);

  @override
  final bool value;

  @override
  String toString() {
    return 'SignInEvent.rememberMeChanged(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RememberMeImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RememberMeImplCopyWith<_$RememberMeImpl> get copyWith =>
      __$$RememberMeImplCopyWithImpl<_$RememberMeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() signInSubmitted,
    required TResult Function() signUpSubmitted,
    required TResult Function(bool value) rememberMeChanged,
    required TResult Function(String username) usernameChanged,
    required TResult Function(String password) passwordChanged,
  }) {
    return rememberMeChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? signInSubmitted,
    TResult? Function()? signUpSubmitted,
    TResult? Function(bool value)? rememberMeChanged,
    TResult? Function(String username)? usernameChanged,
    TResult? Function(String password)? passwordChanged,
  }) {
    return rememberMeChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? signInSubmitted,
    TResult Function()? signUpSubmitted,
    TResult Function(bool value)? rememberMeChanged,
    TResult Function(String username)? usernameChanged,
    TResult Function(String password)? passwordChanged,
    required TResult orElse(),
  }) {
    if (rememberMeChanged != null) {
      return rememberMeChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SignInSubmitted value) signInSubmitted,
    required TResult Function(_SignUpSubmitted value) signUpSubmitted,
    required TResult Function(_RememberMe value) rememberMeChanged,
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
  }) {
    return rememberMeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SignInSubmitted value)? signInSubmitted,
    TResult? Function(_SignUpSubmitted value)? signUpSubmitted,
    TResult? Function(_RememberMe value)? rememberMeChanged,
    TResult? Function(_UsernameChanged value)? usernameChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
  }) {
    return rememberMeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SignInSubmitted value)? signInSubmitted,
    TResult Function(_SignUpSubmitted value)? signUpSubmitted,
    TResult Function(_RememberMe value)? rememberMeChanged,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    required TResult orElse(),
  }) {
    if (rememberMeChanged != null) {
      return rememberMeChanged(this);
    }
    return orElse();
  }
}

abstract class _RememberMe implements SignInEvent {
  const factory _RememberMe(final bool value) = _$RememberMeImpl;

  bool get value;
  @JsonKey(ignore: true)
  _$$RememberMeImplCopyWith<_$RememberMeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UsernameChangedImplCopyWith<$Res> {
  factory _$$UsernameChangedImplCopyWith(_$UsernameChangedImpl value,
          $Res Function(_$UsernameChangedImpl) then) =
      __$$UsernameChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$UsernameChangedImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$UsernameChangedImpl>
    implements _$$UsernameChangedImplCopyWith<$Res> {
  __$$UsernameChangedImplCopyWithImpl(
      _$UsernameChangedImpl _value, $Res Function(_$UsernameChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$UsernameChangedImpl(
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UsernameChangedImpl implements _UsernameChanged {
  const _$UsernameChangedImpl(this.username);

  @override
  final String username;

  @override
  String toString() {
    return 'SignInEvent.usernameChanged(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsernameChangedImpl &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsernameChangedImplCopyWith<_$UsernameChangedImpl> get copyWith =>
      __$$UsernameChangedImplCopyWithImpl<_$UsernameChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() signInSubmitted,
    required TResult Function() signUpSubmitted,
    required TResult Function(bool value) rememberMeChanged,
    required TResult Function(String username) usernameChanged,
    required TResult Function(String password) passwordChanged,
  }) {
    return usernameChanged(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? signInSubmitted,
    TResult? Function()? signUpSubmitted,
    TResult? Function(bool value)? rememberMeChanged,
    TResult? Function(String username)? usernameChanged,
    TResult? Function(String password)? passwordChanged,
  }) {
    return usernameChanged?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? signInSubmitted,
    TResult Function()? signUpSubmitted,
    TResult Function(bool value)? rememberMeChanged,
    TResult Function(String username)? usernameChanged,
    TResult Function(String password)? passwordChanged,
    required TResult orElse(),
  }) {
    if (usernameChanged != null) {
      return usernameChanged(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SignInSubmitted value) signInSubmitted,
    required TResult Function(_SignUpSubmitted value) signUpSubmitted,
    required TResult Function(_RememberMe value) rememberMeChanged,
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
  }) {
    return usernameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SignInSubmitted value)? signInSubmitted,
    TResult? Function(_SignUpSubmitted value)? signUpSubmitted,
    TResult? Function(_RememberMe value)? rememberMeChanged,
    TResult? Function(_UsernameChanged value)? usernameChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
  }) {
    return usernameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SignInSubmitted value)? signInSubmitted,
    TResult Function(_SignUpSubmitted value)? signUpSubmitted,
    TResult Function(_RememberMe value)? rememberMeChanged,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    required TResult orElse(),
  }) {
    if (usernameChanged != null) {
      return usernameChanged(this);
    }
    return orElse();
  }
}

abstract class _UsernameChanged implements SignInEvent {
  const factory _UsernameChanged(final String username) = _$UsernameChangedImpl;

  String get username;
  @JsonKey(ignore: true)
  _$$UsernameChangedImplCopyWith<_$UsernameChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordChangedImplCopyWith<$Res> {
  factory _$$PasswordChangedImplCopyWith(_$PasswordChangedImpl value,
          $Res Function(_$PasswordChangedImpl) then) =
      __$$PasswordChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$PasswordChangedImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$PasswordChangedImpl>
    implements _$$PasswordChangedImplCopyWith<$Res> {
  __$$PasswordChangedImplCopyWithImpl(
      _$PasswordChangedImpl _value, $Res Function(_$PasswordChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$PasswordChangedImpl(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordChangedImpl implements _PasswordChanged {
  const _$PasswordChangedImpl(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'SignInEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordChangedImpl &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordChangedImplCopyWith<_$PasswordChangedImpl> get copyWith =>
      __$$PasswordChangedImplCopyWithImpl<_$PasswordChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() signInSubmitted,
    required TResult Function() signUpSubmitted,
    required TResult Function(bool value) rememberMeChanged,
    required TResult Function(String username) usernameChanged,
    required TResult Function(String password) passwordChanged,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? signInSubmitted,
    TResult? Function()? signUpSubmitted,
    TResult? Function(bool value)? rememberMeChanged,
    TResult? Function(String username)? usernameChanged,
    TResult? Function(String password)? passwordChanged,
  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? signInSubmitted,
    TResult Function()? signUpSubmitted,
    TResult Function(bool value)? rememberMeChanged,
    TResult Function(String username)? usernameChanged,
    TResult Function(String password)? passwordChanged,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SignInSubmitted value) signInSubmitted,
    required TResult Function(_SignUpSubmitted value) signUpSubmitted,
    required TResult Function(_RememberMe value) rememberMeChanged,
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SignInSubmitted value)? signInSubmitted,
    TResult? Function(_SignUpSubmitted value)? signUpSubmitted,
    TResult? Function(_RememberMe value)? rememberMeChanged,
    TResult? Function(_UsernameChanged value)? usernameChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SignInSubmitted value)? signInSubmitted,
    TResult Function(_SignUpSubmitted value)? signUpSubmitted,
    TResult Function(_RememberMe value)? rememberMeChanged,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordChanged implements SignInEvent {
  const factory _PasswordChanged(final String password) = _$PasswordChangedImpl;

  String get password;
  @JsonKey(ignore: true)
  _$$PasswordChangedImplCopyWith<_$PasswordChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignInState {
  LoadingStatus get loginStatus => throw _privateConstructorUsedError;
  LoadingStatus get status => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get isRemember => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInStateCopyWith<SignInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res, SignInState>;
  @useResult
  $Res call(
      {LoadingStatus loginStatus,
      LoadingStatus status,
      String username,
      String password,
      bool isRemember});
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginStatus = null,
    Object? status = null,
    Object? username = null,
    Object? password = null,
    Object? isRemember = null,
  }) {
    return _then(_value.copyWith(
      loginStatus: null == loginStatus
          ? _value.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isRemember: null == isRemember
          ? _value.isRemember
          : isRemember // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInStateImplCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory _$$SignInStateImplCopyWith(
          _$SignInStateImpl value, $Res Function(_$SignInStateImpl) then) =
      __$$SignInStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadingStatus loginStatus,
      LoadingStatus status,
      String username,
      String password,
      bool isRemember});
}

/// @nodoc
class __$$SignInStateImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateImpl>
    implements _$$SignInStateImplCopyWith<$Res> {
  __$$SignInStateImplCopyWithImpl(
      _$SignInStateImpl _value, $Res Function(_$SignInStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginStatus = null,
    Object? status = null,
    Object? username = null,
    Object? password = null,
    Object? isRemember = null,
  }) {
    return _then(_$SignInStateImpl(
      loginStatus: null == loginStatus
          ? _value.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isRemember: null == isRemember
          ? _value.isRemember
          : isRemember // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignInStateImpl implements _SignInState {
  const _$SignInStateImpl(
      {this.loginStatus = LoadingStatus.initial,
      this.status = LoadingStatus.initial,
      this.username = 'baotrung',
      this.password = '',
      this.isRemember = false});

  @override
  @JsonKey()
  final LoadingStatus loginStatus;
  @override
  @JsonKey()
  final LoadingStatus status;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final bool isRemember;

  @override
  String toString() {
    return 'SignInState(loginStatus: $loginStatus, status: $status, username: $username, password: $password, isRemember: $isRemember)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateImpl &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isRemember, isRemember) ||
                other.isRemember == isRemember));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loginStatus, status, username, password, isRemember);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      __$$SignInStateImplCopyWithImpl<_$SignInStateImpl>(this, _$identity);
}

abstract class _SignInState implements SignInState {
  const factory _SignInState(
      {final LoadingStatus loginStatus,
      final LoadingStatus status,
      final String username,
      final String password,
      final bool isRemember}) = _$SignInStateImpl;

  @override
  LoadingStatus get loginStatus;
  @override
  LoadingStatus get status;
  @override
  String get username;
  @override
  String get password;
  @override
  bool get isRemember;
  @override
  @JsonKey(ignore: true)
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
