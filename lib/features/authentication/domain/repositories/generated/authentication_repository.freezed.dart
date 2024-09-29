// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../authentication_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InitiateSignUpOptions {
  String get username => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String username, String name)
        withEmailCode,
    required TResult Function(String username, String name) withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String username, String name)?
        withEmailCode,
    TResult? Function(String username, String name)? withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String username, String name)? withEmailCode,
    TResult Function(String username, String name)? withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitiateSignUpOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(InitiateSignUpOptionsWithOIDC value) withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitiateSignUpOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(InitiateSignUpOptionsWithOIDC value)? withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitiateSignUpOptionsWithEmailCode value)? withEmailCode,
    TResult Function(InitiateSignUpOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of InitiateSignUpOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InitiateSignUpOptionsCopyWith<InitiateSignUpOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitiateSignUpOptionsCopyWith<$Res> {
  factory $InitiateSignUpOptionsCopyWith(InitiateSignUpOptions value,
          $Res Function(InitiateSignUpOptions) then) =
      _$InitiateSignUpOptionsCopyWithImpl<$Res, InitiateSignUpOptions>;
  @useResult
  $Res call({String username, String name});
}

/// @nodoc
class _$InitiateSignUpOptionsCopyWithImpl<$Res,
        $Val extends InitiateSignUpOptions>
    implements $InitiateSignUpOptionsCopyWith<$Res> {
  _$InitiateSignUpOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InitiateSignUpOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitiateSignUpOptionsWithEmailCodeImplCopyWith<$Res>
    implements $InitiateSignUpOptionsCopyWith<$Res> {
  factory _$$InitiateSignUpOptionsWithEmailCodeImplCopyWith(
          _$InitiateSignUpOptionsWithEmailCodeImpl value,
          $Res Function(_$InitiateSignUpOptionsWithEmailCodeImpl) then) =
      __$$InitiateSignUpOptionsWithEmailCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String username, String name});
}

/// @nodoc
class __$$InitiateSignUpOptionsWithEmailCodeImplCopyWithImpl<$Res>
    extends _$InitiateSignUpOptionsCopyWithImpl<$Res,
        _$InitiateSignUpOptionsWithEmailCodeImpl>
    implements _$$InitiateSignUpOptionsWithEmailCodeImplCopyWith<$Res> {
  __$$InitiateSignUpOptionsWithEmailCodeImplCopyWithImpl(
      _$InitiateSignUpOptionsWithEmailCodeImpl _value,
      $Res Function(_$InitiateSignUpOptionsWithEmailCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of InitiateSignUpOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? username = null,
    Object? name = null,
  }) {
    return _then(_$InitiateSignUpOptionsWithEmailCodeImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitiateSignUpOptionsWithEmailCodeImpl
    implements InitiateSignUpOptionsWithEmailCode {
  const _$InitiateSignUpOptionsWithEmailCodeImpl(
      {required this.email, required this.username, required this.name});

  @override
  final String email;
  @override
  final String username;
  @override
  final String name;

  @override
  String toString() {
    return 'InitiateSignUpOptions.withEmailCode(email: $email, username: $username, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitiateSignUpOptionsWithEmailCodeImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, username, name);

  /// Create a copy of InitiateSignUpOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitiateSignUpOptionsWithEmailCodeImplCopyWith<
          _$InitiateSignUpOptionsWithEmailCodeImpl>
      get copyWith => __$$InitiateSignUpOptionsWithEmailCodeImplCopyWithImpl<
          _$InitiateSignUpOptionsWithEmailCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String username, String name)
        withEmailCode,
    required TResult Function(String username, String name) withOIDC,
  }) {
    return withEmailCode(email, username, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String username, String name)?
        withEmailCode,
    TResult? Function(String username, String name)? withOIDC,
  }) {
    return withEmailCode?.call(email, username, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String username, String name)? withEmailCode,
    TResult Function(String username, String name)? withOIDC,
    required TResult orElse(),
  }) {
    if (withEmailCode != null) {
      return withEmailCode(email, username, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitiateSignUpOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(InitiateSignUpOptionsWithOIDC value) withOIDC,
  }) {
    return withEmailCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitiateSignUpOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(InitiateSignUpOptionsWithOIDC value)? withOIDC,
  }) {
    return withEmailCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitiateSignUpOptionsWithEmailCode value)? withEmailCode,
    TResult Function(InitiateSignUpOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withEmailCode != null) {
      return withEmailCode(this);
    }
    return orElse();
  }
}

abstract class InitiateSignUpOptionsWithEmailCode
    implements InitiateSignUpOptions {
  const factory InitiateSignUpOptionsWithEmailCode(
      {required final String email,
      required final String username,
      required final String name}) = _$InitiateSignUpOptionsWithEmailCodeImpl;

  String get email;
  @override
  String get username;
  @override
  String get name;

  /// Create a copy of InitiateSignUpOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitiateSignUpOptionsWithEmailCodeImplCopyWith<
          _$InitiateSignUpOptionsWithEmailCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitiateSignUpOptionsWithOIDCImplCopyWith<$Res>
    implements $InitiateSignUpOptionsCopyWith<$Res> {
  factory _$$InitiateSignUpOptionsWithOIDCImplCopyWith(
          _$InitiateSignUpOptionsWithOIDCImpl value,
          $Res Function(_$InitiateSignUpOptionsWithOIDCImpl) then) =
      __$$InitiateSignUpOptionsWithOIDCImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String name});
}

/// @nodoc
class __$$InitiateSignUpOptionsWithOIDCImplCopyWithImpl<$Res>
    extends _$InitiateSignUpOptionsCopyWithImpl<$Res,
        _$InitiateSignUpOptionsWithOIDCImpl>
    implements _$$InitiateSignUpOptionsWithOIDCImplCopyWith<$Res> {
  __$$InitiateSignUpOptionsWithOIDCImplCopyWithImpl(
      _$InitiateSignUpOptionsWithOIDCImpl _value,
      $Res Function(_$InitiateSignUpOptionsWithOIDCImpl) _then)
      : super(_value, _then);

  /// Create a copy of InitiateSignUpOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? name = null,
  }) {
    return _then(_$InitiateSignUpOptionsWithOIDCImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitiateSignUpOptionsWithOIDCImpl
    implements InitiateSignUpOptionsWithOIDC {
  const _$InitiateSignUpOptionsWithOIDCImpl(
      {required this.username, required this.name});

  @override
  final String username;
  @override
  final String name;

  @override
  String toString() {
    return 'InitiateSignUpOptions.withOIDC(username: $username, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitiateSignUpOptionsWithOIDCImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, name);

  /// Create a copy of InitiateSignUpOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitiateSignUpOptionsWithOIDCImplCopyWith<
          _$InitiateSignUpOptionsWithOIDCImpl>
      get copyWith => __$$InitiateSignUpOptionsWithOIDCImplCopyWithImpl<
          _$InitiateSignUpOptionsWithOIDCImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String username, String name)
        withEmailCode,
    required TResult Function(String username, String name) withOIDC,
  }) {
    return withOIDC(username, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String username, String name)?
        withEmailCode,
    TResult? Function(String username, String name)? withOIDC,
  }) {
    return withOIDC?.call(username, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String username, String name)? withEmailCode,
    TResult Function(String username, String name)? withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(username, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitiateSignUpOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(InitiateSignUpOptionsWithOIDC value) withOIDC,
  }) {
    return withOIDC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitiateSignUpOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(InitiateSignUpOptionsWithOIDC value)? withOIDC,
  }) {
    return withOIDC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitiateSignUpOptionsWithEmailCode value)? withEmailCode,
    TResult Function(InitiateSignUpOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(this);
    }
    return orElse();
  }
}

abstract class InitiateSignUpOptionsWithOIDC implements InitiateSignUpOptions {
  const factory InitiateSignUpOptionsWithOIDC(
      {required final String username,
      required final String name}) = _$InitiateSignUpOptionsWithOIDCImpl;

  @override
  String get username;
  @override
  String get name;

  /// Create a copy of InitiateSignUpOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitiateSignUpOptionsWithOIDCImplCopyWith<
          _$InitiateSignUpOptionsWithOIDCImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CompleteSignUpOptions {
  String get flowId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, String username, String name,
            String email, String code)
        withEmailCode,
    required TResult Function(String flowId, String username, String name,
            String email, String provider, String idToken)
        withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, String username, String name, String email,
            String code)?
        withEmailCode,
    TResult? Function(String flowId, String username, String name, String email,
            String provider, String idToken)?
        withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, String username, String name, String email,
            String code)?
        withEmailCode,
    TResult Function(String flowId, String username, String name, String email,
            String provider, String idToken)?
        withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompleteSignUpOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(CompleteSignUpOptionsWithOIDC value) withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompleteSignUpOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(CompleteSignUpOptionsWithOIDC value)? withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompleteSignUpOptionsWithEmailCode value)? withEmailCode,
    TResult Function(CompleteSignUpOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CompleteSignUpOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompleteSignUpOptionsCopyWith<CompleteSignUpOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteSignUpOptionsCopyWith<$Res> {
  factory $CompleteSignUpOptionsCopyWith(CompleteSignUpOptions value,
          $Res Function(CompleteSignUpOptions) then) =
      _$CompleteSignUpOptionsCopyWithImpl<$Res, CompleteSignUpOptions>;
  @useResult
  $Res call({String flowId, String username, String name, String email});
}

/// @nodoc
class _$CompleteSignUpOptionsCopyWithImpl<$Res,
        $Val extends CompleteSignUpOptions>
    implements $CompleteSignUpOptionsCopyWith<$Res> {
  _$CompleteSignUpOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompleteSignUpOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowId = null,
    Object? username = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      flowId: null == flowId
          ? _value.flowId
          : flowId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompleteSignUpOptionsWithEmailCodeImplCopyWith<$Res>
    implements $CompleteSignUpOptionsCopyWith<$Res> {
  factory _$$CompleteSignUpOptionsWithEmailCodeImplCopyWith(
          _$CompleteSignUpOptionsWithEmailCodeImpl value,
          $Res Function(_$CompleteSignUpOptionsWithEmailCodeImpl) then) =
      __$$CompleteSignUpOptionsWithEmailCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String flowId, String username, String name, String email, String code});
}

/// @nodoc
class __$$CompleteSignUpOptionsWithEmailCodeImplCopyWithImpl<$Res>
    extends _$CompleteSignUpOptionsCopyWithImpl<$Res,
        _$CompleteSignUpOptionsWithEmailCodeImpl>
    implements _$$CompleteSignUpOptionsWithEmailCodeImplCopyWith<$Res> {
  __$$CompleteSignUpOptionsWithEmailCodeImplCopyWithImpl(
      _$CompleteSignUpOptionsWithEmailCodeImpl _value,
      $Res Function(_$CompleteSignUpOptionsWithEmailCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompleteSignUpOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowId = null,
    Object? username = null,
    Object? name = null,
    Object? email = null,
    Object? code = null,
  }) {
    return _then(_$CompleteSignUpOptionsWithEmailCodeImpl(
      flowId: null == flowId
          ? _value.flowId
          : flowId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CompleteSignUpOptionsWithEmailCodeImpl
    implements CompleteSignUpOptionsWithEmailCode {
  const _$CompleteSignUpOptionsWithEmailCodeImpl(
      {required this.flowId,
      required this.username,
      required this.name,
      required this.email,
      required this.code});

  @override
  final String flowId;
  @override
  final String username;
  @override
  final String name;
  @override
  final String email;
  @override
  final String code;

  @override
  String toString() {
    return 'CompleteSignUpOptions.withEmailCode(flowId: $flowId, username: $username, name: $name, email: $email, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteSignUpOptionsWithEmailCodeImpl &&
            (identical(other.flowId, flowId) || other.flowId == flowId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, flowId, username, name, email, code);

  /// Create a copy of CompleteSignUpOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteSignUpOptionsWithEmailCodeImplCopyWith<
          _$CompleteSignUpOptionsWithEmailCodeImpl>
      get copyWith => __$$CompleteSignUpOptionsWithEmailCodeImplCopyWithImpl<
          _$CompleteSignUpOptionsWithEmailCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, String username, String name,
            String email, String code)
        withEmailCode,
    required TResult Function(String flowId, String username, String name,
            String email, String provider, String idToken)
        withOIDC,
  }) {
    return withEmailCode(flowId, username, name, email, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, String username, String name, String email,
            String code)?
        withEmailCode,
    TResult? Function(String flowId, String username, String name, String email,
            String provider, String idToken)?
        withOIDC,
  }) {
    return withEmailCode?.call(flowId, username, name, email, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, String username, String name, String email,
            String code)?
        withEmailCode,
    TResult Function(String flowId, String username, String name, String email,
            String provider, String idToken)?
        withOIDC,
    required TResult orElse(),
  }) {
    if (withEmailCode != null) {
      return withEmailCode(flowId, username, name, email, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompleteSignUpOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(CompleteSignUpOptionsWithOIDC value) withOIDC,
  }) {
    return withEmailCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompleteSignUpOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(CompleteSignUpOptionsWithOIDC value)? withOIDC,
  }) {
    return withEmailCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompleteSignUpOptionsWithEmailCode value)? withEmailCode,
    TResult Function(CompleteSignUpOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withEmailCode != null) {
      return withEmailCode(this);
    }
    return orElse();
  }
}

abstract class CompleteSignUpOptionsWithEmailCode
    implements CompleteSignUpOptions {
  const factory CompleteSignUpOptionsWithEmailCode(
      {required final String flowId,
      required final String username,
      required final String name,
      required final String email,
      required final String code}) = _$CompleteSignUpOptionsWithEmailCodeImpl;

  @override
  String get flowId;
  @override
  String get username;
  @override
  String get name;
  @override
  String get email;
  String get code;

  /// Create a copy of CompleteSignUpOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteSignUpOptionsWithEmailCodeImplCopyWith<
          _$CompleteSignUpOptionsWithEmailCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompleteSignUpOptionsWithOIDCImplCopyWith<$Res>
    implements $CompleteSignUpOptionsCopyWith<$Res> {
  factory _$$CompleteSignUpOptionsWithOIDCImplCopyWith(
          _$CompleteSignUpOptionsWithOIDCImpl value,
          $Res Function(_$CompleteSignUpOptionsWithOIDCImpl) then) =
      __$$CompleteSignUpOptionsWithOIDCImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String flowId,
      String username,
      String name,
      String email,
      String provider,
      String idToken});
}

/// @nodoc
class __$$CompleteSignUpOptionsWithOIDCImplCopyWithImpl<$Res>
    extends _$CompleteSignUpOptionsCopyWithImpl<$Res,
        _$CompleteSignUpOptionsWithOIDCImpl>
    implements _$$CompleteSignUpOptionsWithOIDCImplCopyWith<$Res> {
  __$$CompleteSignUpOptionsWithOIDCImplCopyWithImpl(
      _$CompleteSignUpOptionsWithOIDCImpl _value,
      $Res Function(_$CompleteSignUpOptionsWithOIDCImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompleteSignUpOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowId = null,
    Object? username = null,
    Object? name = null,
    Object? email = null,
    Object? provider = null,
    Object? idToken = null,
  }) {
    return _then(_$CompleteSignUpOptionsWithOIDCImpl(
      flowId: null == flowId
          ? _value.flowId
          : flowId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CompleteSignUpOptionsWithOIDCImpl
    implements CompleteSignUpOptionsWithOIDC {
  const _$CompleteSignUpOptionsWithOIDCImpl(
      {required this.flowId,
      required this.username,
      required this.name,
      required this.email,
      required this.provider,
      required this.idToken});

  @override
  final String flowId;
  @override
  final String username;
  @override
  final String name;
  @override
  final String email;
  @override
  final String provider;
  @override
  final String idToken;

  @override
  String toString() {
    return 'CompleteSignUpOptions.withOIDC(flowId: $flowId, username: $username, name: $name, email: $email, provider: $provider, idToken: $idToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteSignUpOptionsWithOIDCImpl &&
            (identical(other.flowId, flowId) || other.flowId == flowId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, flowId, username, name, email, provider, idToken);

  /// Create a copy of CompleteSignUpOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteSignUpOptionsWithOIDCImplCopyWith<
          _$CompleteSignUpOptionsWithOIDCImpl>
      get copyWith => __$$CompleteSignUpOptionsWithOIDCImplCopyWithImpl<
          _$CompleteSignUpOptionsWithOIDCImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, String username, String name,
            String email, String code)
        withEmailCode,
    required TResult Function(String flowId, String username, String name,
            String email, String provider, String idToken)
        withOIDC,
  }) {
    return withOIDC(flowId, username, name, email, provider, idToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, String username, String name, String email,
            String code)?
        withEmailCode,
    TResult? Function(String flowId, String username, String name, String email,
            String provider, String idToken)?
        withOIDC,
  }) {
    return withOIDC?.call(flowId, username, name, email, provider, idToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, String username, String name, String email,
            String code)?
        withEmailCode,
    TResult Function(String flowId, String username, String name, String email,
            String provider, String idToken)?
        withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(flowId, username, name, email, provider, idToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompleteSignUpOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(CompleteSignUpOptionsWithOIDC value) withOIDC,
  }) {
    return withOIDC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompleteSignUpOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(CompleteSignUpOptionsWithOIDC value)? withOIDC,
  }) {
    return withOIDC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompleteSignUpOptionsWithEmailCode value)? withEmailCode,
    TResult Function(CompleteSignUpOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(this);
    }
    return orElse();
  }
}

abstract class CompleteSignUpOptionsWithOIDC implements CompleteSignUpOptions {
  const factory CompleteSignUpOptionsWithOIDC(
      {required final String flowId,
      required final String username,
      required final String name,
      required final String email,
      required final String provider,
      required final String idToken}) = _$CompleteSignUpOptionsWithOIDCImpl;

  @override
  String get flowId;
  @override
  String get username;
  @override
  String get name;
  @override
  String get email;
  String get provider;
  String get idToken;

  /// Create a copy of CompleteSignUpOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteSignUpOptionsWithOIDCImplCopyWith<
          _$CompleteSignUpOptionsWithOIDCImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InitiateSignInOptions {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) withEmailCode,
    required TResult Function() withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? withEmailCode,
    TResult? Function()? withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? withEmailCode,
    TResult Function()? withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitiateSignInOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(InitiateSignInOptionsWithOIDC value) withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitiateSignInOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(InitiateSignInOptionsWithOIDC value)? withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitiateSignInOptionsWithEmailCode value)? withEmailCode,
    TResult Function(InitiateSignInOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitiateSignInOptionsCopyWith<$Res> {
  factory $InitiateSignInOptionsCopyWith(InitiateSignInOptions value,
          $Res Function(InitiateSignInOptions) then) =
      _$InitiateSignInOptionsCopyWithImpl<$Res, InitiateSignInOptions>;
}

/// @nodoc
class _$InitiateSignInOptionsCopyWithImpl<$Res,
        $Val extends InitiateSignInOptions>
    implements $InitiateSignInOptionsCopyWith<$Res> {
  _$InitiateSignInOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InitiateSignInOptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitiateSignInOptionsWithEmailCodeImplCopyWith<$Res> {
  factory _$$InitiateSignInOptionsWithEmailCodeImplCopyWith(
          _$InitiateSignInOptionsWithEmailCodeImpl value,
          $Res Function(_$InitiateSignInOptionsWithEmailCodeImpl) then) =
      __$$InitiateSignInOptionsWithEmailCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$InitiateSignInOptionsWithEmailCodeImplCopyWithImpl<$Res>
    extends _$InitiateSignInOptionsCopyWithImpl<$Res,
        _$InitiateSignInOptionsWithEmailCodeImpl>
    implements _$$InitiateSignInOptionsWithEmailCodeImplCopyWith<$Res> {
  __$$InitiateSignInOptionsWithEmailCodeImplCopyWithImpl(
      _$InitiateSignInOptionsWithEmailCodeImpl _value,
      $Res Function(_$InitiateSignInOptionsWithEmailCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of InitiateSignInOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$InitiateSignInOptionsWithEmailCodeImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitiateSignInOptionsWithEmailCodeImpl
    implements InitiateSignInOptionsWithEmailCode {
  const _$InitiateSignInOptionsWithEmailCodeImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'InitiateSignInOptions.withEmailCode(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitiateSignInOptionsWithEmailCodeImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of InitiateSignInOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitiateSignInOptionsWithEmailCodeImplCopyWith<
          _$InitiateSignInOptionsWithEmailCodeImpl>
      get copyWith => __$$InitiateSignInOptionsWithEmailCodeImplCopyWithImpl<
          _$InitiateSignInOptionsWithEmailCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) withEmailCode,
    required TResult Function() withOIDC,
  }) {
    return withEmailCode(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? withEmailCode,
    TResult? Function()? withOIDC,
  }) {
    return withEmailCode?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? withEmailCode,
    TResult Function()? withOIDC,
    required TResult orElse(),
  }) {
    if (withEmailCode != null) {
      return withEmailCode(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitiateSignInOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(InitiateSignInOptionsWithOIDC value) withOIDC,
  }) {
    return withEmailCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitiateSignInOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(InitiateSignInOptionsWithOIDC value)? withOIDC,
  }) {
    return withEmailCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitiateSignInOptionsWithEmailCode value)? withEmailCode,
    TResult Function(InitiateSignInOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withEmailCode != null) {
      return withEmailCode(this);
    }
    return orElse();
  }
}

abstract class InitiateSignInOptionsWithEmailCode
    implements InitiateSignInOptions {
  const factory InitiateSignInOptionsWithEmailCode(
      {required final String email}) = _$InitiateSignInOptionsWithEmailCodeImpl;

  String get email;

  /// Create a copy of InitiateSignInOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitiateSignInOptionsWithEmailCodeImplCopyWith<
          _$InitiateSignInOptionsWithEmailCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitiateSignInOptionsWithOIDCImplCopyWith<$Res> {
  factory _$$InitiateSignInOptionsWithOIDCImplCopyWith(
          _$InitiateSignInOptionsWithOIDCImpl value,
          $Res Function(_$InitiateSignInOptionsWithOIDCImpl) then) =
      __$$InitiateSignInOptionsWithOIDCImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitiateSignInOptionsWithOIDCImplCopyWithImpl<$Res>
    extends _$InitiateSignInOptionsCopyWithImpl<$Res,
        _$InitiateSignInOptionsWithOIDCImpl>
    implements _$$InitiateSignInOptionsWithOIDCImplCopyWith<$Res> {
  __$$InitiateSignInOptionsWithOIDCImplCopyWithImpl(
      _$InitiateSignInOptionsWithOIDCImpl _value,
      $Res Function(_$InitiateSignInOptionsWithOIDCImpl) _then)
      : super(_value, _then);

  /// Create a copy of InitiateSignInOptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitiateSignInOptionsWithOIDCImpl
    implements InitiateSignInOptionsWithOIDC {
  const _$InitiateSignInOptionsWithOIDCImpl();

  @override
  String toString() {
    return 'InitiateSignInOptions.withOIDC()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitiateSignInOptionsWithOIDCImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) withEmailCode,
    required TResult Function() withOIDC,
  }) {
    return withOIDC();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? withEmailCode,
    TResult? Function()? withOIDC,
  }) {
    return withOIDC?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? withEmailCode,
    TResult Function()? withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitiateSignInOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(InitiateSignInOptionsWithOIDC value) withOIDC,
  }) {
    return withOIDC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitiateSignInOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(InitiateSignInOptionsWithOIDC value)? withOIDC,
  }) {
    return withOIDC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitiateSignInOptionsWithEmailCode value)? withEmailCode,
    TResult Function(InitiateSignInOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(this);
    }
    return orElse();
  }
}

abstract class InitiateSignInOptionsWithOIDC implements InitiateSignInOptions {
  const factory InitiateSignInOptionsWithOIDC() =
      _$InitiateSignInOptionsWithOIDCImpl;
}

/// @nodoc
mixin _$CompleteSignInOptions {
  String get flowId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, String identifier, String code)
        withEmailCode,
    required TResult Function(String flowId, String provider, String idToken)
        withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, String identifier, String code)?
        withEmailCode,
    TResult? Function(String flowId, String provider, String idToken)? withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, String identifier, String code)?
        withEmailCode,
    TResult Function(String flowId, String provider, String idToken)? withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompleteSignInOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(CompleteSignInOptionsWithOIDC value) withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompleteSignInOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(CompleteSignInOptionsWithOIDC value)? withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompleteSignInOptionsWithEmailCode value)? withEmailCode,
    TResult Function(CompleteSignInOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CompleteSignInOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompleteSignInOptionsCopyWith<CompleteSignInOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteSignInOptionsCopyWith<$Res> {
  factory $CompleteSignInOptionsCopyWith(CompleteSignInOptions value,
          $Res Function(CompleteSignInOptions) then) =
      _$CompleteSignInOptionsCopyWithImpl<$Res, CompleteSignInOptions>;
  @useResult
  $Res call({String flowId});
}

/// @nodoc
class _$CompleteSignInOptionsCopyWithImpl<$Res,
        $Val extends CompleteSignInOptions>
    implements $CompleteSignInOptionsCopyWith<$Res> {
  _$CompleteSignInOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompleteSignInOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowId = null,
  }) {
    return _then(_value.copyWith(
      flowId: null == flowId
          ? _value.flowId
          : flowId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompleteSignInOptionsWithEmailCodeImplCopyWith<$Res>
    implements $CompleteSignInOptionsCopyWith<$Res> {
  factory _$$CompleteSignInOptionsWithEmailCodeImplCopyWith(
          _$CompleteSignInOptionsWithEmailCodeImpl value,
          $Res Function(_$CompleteSignInOptionsWithEmailCodeImpl) then) =
      __$$CompleteSignInOptionsWithEmailCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String flowId, String identifier, String code});
}

/// @nodoc
class __$$CompleteSignInOptionsWithEmailCodeImplCopyWithImpl<$Res>
    extends _$CompleteSignInOptionsCopyWithImpl<$Res,
        _$CompleteSignInOptionsWithEmailCodeImpl>
    implements _$$CompleteSignInOptionsWithEmailCodeImplCopyWith<$Res> {
  __$$CompleteSignInOptionsWithEmailCodeImplCopyWithImpl(
      _$CompleteSignInOptionsWithEmailCodeImpl _value,
      $Res Function(_$CompleteSignInOptionsWithEmailCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompleteSignInOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowId = null,
    Object? identifier = null,
    Object? code = null,
  }) {
    return _then(_$CompleteSignInOptionsWithEmailCodeImpl(
      flowId: null == flowId
          ? _value.flowId
          : flowId // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CompleteSignInOptionsWithEmailCodeImpl
    implements CompleteSignInOptionsWithEmailCode {
  const _$CompleteSignInOptionsWithEmailCodeImpl(
      {required this.flowId, required this.identifier, required this.code});

  @override
  final String flowId;
  @override
  final String identifier;
  @override
  final String code;

  @override
  String toString() {
    return 'CompleteSignInOptions.withEmailCode(flowId: $flowId, identifier: $identifier, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteSignInOptionsWithEmailCodeImpl &&
            (identical(other.flowId, flowId) || other.flowId == flowId) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flowId, identifier, code);

  /// Create a copy of CompleteSignInOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteSignInOptionsWithEmailCodeImplCopyWith<
          _$CompleteSignInOptionsWithEmailCodeImpl>
      get copyWith => __$$CompleteSignInOptionsWithEmailCodeImplCopyWithImpl<
          _$CompleteSignInOptionsWithEmailCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, String identifier, String code)
        withEmailCode,
    required TResult Function(String flowId, String provider, String idToken)
        withOIDC,
  }) {
    return withEmailCode(flowId, identifier, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, String identifier, String code)?
        withEmailCode,
    TResult? Function(String flowId, String provider, String idToken)? withOIDC,
  }) {
    return withEmailCode?.call(flowId, identifier, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, String identifier, String code)?
        withEmailCode,
    TResult Function(String flowId, String provider, String idToken)? withOIDC,
    required TResult orElse(),
  }) {
    if (withEmailCode != null) {
      return withEmailCode(flowId, identifier, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompleteSignInOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(CompleteSignInOptionsWithOIDC value) withOIDC,
  }) {
    return withEmailCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompleteSignInOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(CompleteSignInOptionsWithOIDC value)? withOIDC,
  }) {
    return withEmailCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompleteSignInOptionsWithEmailCode value)? withEmailCode,
    TResult Function(CompleteSignInOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withEmailCode != null) {
      return withEmailCode(this);
    }
    return orElse();
  }
}

abstract class CompleteSignInOptionsWithEmailCode
    implements CompleteSignInOptions {
  const factory CompleteSignInOptionsWithEmailCode(
      {required final String flowId,
      required final String identifier,
      required final String code}) = _$CompleteSignInOptionsWithEmailCodeImpl;

  @override
  String get flowId;
  String get identifier;
  String get code;

  /// Create a copy of CompleteSignInOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteSignInOptionsWithEmailCodeImplCopyWith<
          _$CompleteSignInOptionsWithEmailCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompleteSignInOptionsWithOIDCImplCopyWith<$Res>
    implements $CompleteSignInOptionsCopyWith<$Res> {
  factory _$$CompleteSignInOptionsWithOIDCImplCopyWith(
          _$CompleteSignInOptionsWithOIDCImpl value,
          $Res Function(_$CompleteSignInOptionsWithOIDCImpl) then) =
      __$$CompleteSignInOptionsWithOIDCImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String flowId, String provider, String idToken});
}

/// @nodoc
class __$$CompleteSignInOptionsWithOIDCImplCopyWithImpl<$Res>
    extends _$CompleteSignInOptionsCopyWithImpl<$Res,
        _$CompleteSignInOptionsWithOIDCImpl>
    implements _$$CompleteSignInOptionsWithOIDCImplCopyWith<$Res> {
  __$$CompleteSignInOptionsWithOIDCImplCopyWithImpl(
      _$CompleteSignInOptionsWithOIDCImpl _value,
      $Res Function(_$CompleteSignInOptionsWithOIDCImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompleteSignInOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowId = null,
    Object? provider = null,
    Object? idToken = null,
  }) {
    return _then(_$CompleteSignInOptionsWithOIDCImpl(
      flowId: null == flowId
          ? _value.flowId
          : flowId // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CompleteSignInOptionsWithOIDCImpl
    implements CompleteSignInOptionsWithOIDC {
  const _$CompleteSignInOptionsWithOIDCImpl(
      {required this.flowId, required this.provider, required this.idToken});

  @override
  final String flowId;
  @override
  final String provider;
  @override
  final String idToken;

  @override
  String toString() {
    return 'CompleteSignInOptions.withOIDC(flowId: $flowId, provider: $provider, idToken: $idToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteSignInOptionsWithOIDCImpl &&
            (identical(other.flowId, flowId) || other.flowId == flowId) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flowId, provider, idToken);

  /// Create a copy of CompleteSignInOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteSignInOptionsWithOIDCImplCopyWith<
          _$CompleteSignInOptionsWithOIDCImpl>
      get copyWith => __$$CompleteSignInOptionsWithOIDCImplCopyWithImpl<
          _$CompleteSignInOptionsWithOIDCImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, String identifier, String code)
        withEmailCode,
    required TResult Function(String flowId, String provider, String idToken)
        withOIDC,
  }) {
    return withOIDC(flowId, provider, idToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, String identifier, String code)?
        withEmailCode,
    TResult? Function(String flowId, String provider, String idToken)? withOIDC,
  }) {
    return withOIDC?.call(flowId, provider, idToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, String identifier, String code)?
        withEmailCode,
    TResult Function(String flowId, String provider, String idToken)? withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(flowId, provider, idToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompleteSignInOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(CompleteSignInOptionsWithOIDC value) withOIDC,
  }) {
    return withOIDC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompleteSignInOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(CompleteSignInOptionsWithOIDC value)? withOIDC,
  }) {
    return withOIDC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompleteSignInOptionsWithEmailCode value)? withEmailCode,
    TResult Function(CompleteSignInOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(this);
    }
    return orElse();
  }
}

abstract class CompleteSignInOptionsWithOIDC implements CompleteSignInOptions {
  const factory CompleteSignInOptionsWithOIDC(
      {required final String flowId,
      required final String provider,
      required final String idToken}) = _$CompleteSignInOptionsWithOIDCImpl;

  @override
  String get flowId;
  String get provider;
  String get idToken;

  /// Create a copy of CompleteSignInOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteSignInOptionsWithOIDCImplCopyWith<
          _$CompleteSignInOptionsWithOIDCImpl>
      get copyWith => throw _privateConstructorUsedError;
}
