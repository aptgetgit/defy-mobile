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
mixin _$InitiateRegistrationOptions {
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
    required TResult Function(InitiateRegistrationOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(InitiateRegistrationOptionsWithOIDC value)
        withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitiateRegistrationOptionsWithEmailCode value)?
        withEmailCode,
    TResult? Function(InitiateRegistrationOptionsWithOIDC value)? withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitiateRegistrationOptionsWithEmailCode value)?
        withEmailCode,
    TResult Function(InitiateRegistrationOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of InitiateRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InitiateRegistrationOptionsCopyWith<InitiateRegistrationOptions>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitiateRegistrationOptionsCopyWith<$Res> {
  factory $InitiateRegistrationOptionsCopyWith(
          InitiateRegistrationOptions value,
          $Res Function(InitiateRegistrationOptions) then) =
      _$InitiateRegistrationOptionsCopyWithImpl<$Res,
          InitiateRegistrationOptions>;
  @useResult
  $Res call({String username, String name});
}

/// @nodoc
class _$InitiateRegistrationOptionsCopyWithImpl<$Res,
        $Val extends InitiateRegistrationOptions>
    implements $InitiateRegistrationOptionsCopyWith<$Res> {
  _$InitiateRegistrationOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InitiateRegistrationOptions
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
abstract class _$$InitiateRegistrationOptionsWithEmailCodeImplCopyWith<$Res>
    implements $InitiateRegistrationOptionsCopyWith<$Res> {
  factory _$$InitiateRegistrationOptionsWithEmailCodeImplCopyWith(
          _$InitiateRegistrationOptionsWithEmailCodeImpl value,
          $Res Function(_$InitiateRegistrationOptionsWithEmailCodeImpl) then) =
      __$$InitiateRegistrationOptionsWithEmailCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String username, String name});
}

/// @nodoc
class __$$InitiateRegistrationOptionsWithEmailCodeImplCopyWithImpl<$Res>
    extends _$InitiateRegistrationOptionsCopyWithImpl<$Res,
        _$InitiateRegistrationOptionsWithEmailCodeImpl>
    implements _$$InitiateRegistrationOptionsWithEmailCodeImplCopyWith<$Res> {
  __$$InitiateRegistrationOptionsWithEmailCodeImplCopyWithImpl(
      _$InitiateRegistrationOptionsWithEmailCodeImpl _value,
      $Res Function(_$InitiateRegistrationOptionsWithEmailCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of InitiateRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? username = null,
    Object? name = null,
  }) {
    return _then(_$InitiateRegistrationOptionsWithEmailCodeImpl(
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

class _$InitiateRegistrationOptionsWithEmailCodeImpl
    implements InitiateRegistrationOptionsWithEmailCode {
  const _$InitiateRegistrationOptionsWithEmailCodeImpl(
      {required this.email, required this.username, required this.name});

  @override
  final String email;
  @override
  final String username;
  @override
  final String name;

  @override
  String toString() {
    return 'InitiateRegistrationOptions.withEmailCode(email: $email, username: $username, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitiateRegistrationOptionsWithEmailCodeImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, username, name);

  /// Create a copy of InitiateRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitiateRegistrationOptionsWithEmailCodeImplCopyWith<
          _$InitiateRegistrationOptionsWithEmailCodeImpl>
      get copyWith =>
          __$$InitiateRegistrationOptionsWithEmailCodeImplCopyWithImpl<
              _$InitiateRegistrationOptionsWithEmailCodeImpl>(this, _$identity);

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
    required TResult Function(InitiateRegistrationOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(InitiateRegistrationOptionsWithOIDC value)
        withOIDC,
  }) {
    return withEmailCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitiateRegistrationOptionsWithEmailCode value)?
        withEmailCode,
    TResult? Function(InitiateRegistrationOptionsWithOIDC value)? withOIDC,
  }) {
    return withEmailCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitiateRegistrationOptionsWithEmailCode value)?
        withEmailCode,
    TResult Function(InitiateRegistrationOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withEmailCode != null) {
      return withEmailCode(this);
    }
    return orElse();
  }
}

abstract class InitiateRegistrationOptionsWithEmailCode
    implements InitiateRegistrationOptions {
  const factory InitiateRegistrationOptionsWithEmailCode(
          {required final String email,
          required final String username,
          required final String name}) =
      _$InitiateRegistrationOptionsWithEmailCodeImpl;

  String get email;
  @override
  String get username;
  @override
  String get name;

  /// Create a copy of InitiateRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitiateRegistrationOptionsWithEmailCodeImplCopyWith<
          _$InitiateRegistrationOptionsWithEmailCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitiateRegistrationOptionsWithOIDCImplCopyWith<$Res>
    implements $InitiateRegistrationOptionsCopyWith<$Res> {
  factory _$$InitiateRegistrationOptionsWithOIDCImplCopyWith(
          _$InitiateRegistrationOptionsWithOIDCImpl value,
          $Res Function(_$InitiateRegistrationOptionsWithOIDCImpl) then) =
      __$$InitiateRegistrationOptionsWithOIDCImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String name});
}

/// @nodoc
class __$$InitiateRegistrationOptionsWithOIDCImplCopyWithImpl<$Res>
    extends _$InitiateRegistrationOptionsCopyWithImpl<$Res,
        _$InitiateRegistrationOptionsWithOIDCImpl>
    implements _$$InitiateRegistrationOptionsWithOIDCImplCopyWith<$Res> {
  __$$InitiateRegistrationOptionsWithOIDCImplCopyWithImpl(
      _$InitiateRegistrationOptionsWithOIDCImpl _value,
      $Res Function(_$InitiateRegistrationOptionsWithOIDCImpl) _then)
      : super(_value, _then);

  /// Create a copy of InitiateRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? name = null,
  }) {
    return _then(_$InitiateRegistrationOptionsWithOIDCImpl(
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

class _$InitiateRegistrationOptionsWithOIDCImpl
    implements InitiateRegistrationOptionsWithOIDC {
  const _$InitiateRegistrationOptionsWithOIDCImpl(
      {required this.username, required this.name});

  @override
  final String username;
  @override
  final String name;

  @override
  String toString() {
    return 'InitiateRegistrationOptions.withOIDC(username: $username, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitiateRegistrationOptionsWithOIDCImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, name);

  /// Create a copy of InitiateRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitiateRegistrationOptionsWithOIDCImplCopyWith<
          _$InitiateRegistrationOptionsWithOIDCImpl>
      get copyWith => __$$InitiateRegistrationOptionsWithOIDCImplCopyWithImpl<
          _$InitiateRegistrationOptionsWithOIDCImpl>(this, _$identity);

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
    required TResult Function(InitiateRegistrationOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(InitiateRegistrationOptionsWithOIDC value)
        withOIDC,
  }) {
    return withOIDC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitiateRegistrationOptionsWithEmailCode value)?
        withEmailCode,
    TResult? Function(InitiateRegistrationOptionsWithOIDC value)? withOIDC,
  }) {
    return withOIDC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitiateRegistrationOptionsWithEmailCode value)?
        withEmailCode,
    TResult Function(InitiateRegistrationOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(this);
    }
    return orElse();
  }
}

abstract class InitiateRegistrationOptionsWithOIDC
    implements InitiateRegistrationOptions {
  const factory InitiateRegistrationOptionsWithOIDC(
      {required final String username,
      required final String name}) = _$InitiateRegistrationOptionsWithOIDCImpl;

  @override
  String get username;
  @override
  String get name;

  /// Create a copy of InitiateRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitiateRegistrationOptionsWithOIDCImplCopyWith<
          _$InitiateRegistrationOptionsWithOIDCImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CompleteRegistrationOptions {
  String get flowId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, String username, String name,
            String email, String code)
        withEmailCode,
    required TResult Function(String flowId, String username, String name,
            String provider, String idToken)
        withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, String username, String name, String email,
            String code)?
        withEmailCode,
    TResult? Function(String flowId, String username, String name,
            String provider, String idToken)?
        withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, String username, String name, String email,
            String code)?
        withEmailCode,
    TResult Function(String flowId, String username, String name,
            String provider, String idToken)?
        withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompleteRegistrationOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(CompleteRegistrationOptionsWithOIDC value)
        withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompleteRegistrationOptionsWithEmailCode value)?
        withEmailCode,
    TResult? Function(CompleteRegistrationOptionsWithOIDC value)? withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompleteRegistrationOptionsWithEmailCode value)?
        withEmailCode,
    TResult Function(CompleteRegistrationOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CompleteRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompleteRegistrationOptionsCopyWith<CompleteRegistrationOptions>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteRegistrationOptionsCopyWith<$Res> {
  factory $CompleteRegistrationOptionsCopyWith(
          CompleteRegistrationOptions value,
          $Res Function(CompleteRegistrationOptions) then) =
      _$CompleteRegistrationOptionsCopyWithImpl<$Res,
          CompleteRegistrationOptions>;
  @useResult
  $Res call({String flowId, String username, String name});
}

/// @nodoc
class _$CompleteRegistrationOptionsCopyWithImpl<$Res,
        $Val extends CompleteRegistrationOptions>
    implements $CompleteRegistrationOptionsCopyWith<$Res> {
  _$CompleteRegistrationOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompleteRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowId = null,
    Object? username = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompleteRegistrationOptionsWithEmailCodeImplCopyWith<$Res>
    implements $CompleteRegistrationOptionsCopyWith<$Res> {
  factory _$$CompleteRegistrationOptionsWithEmailCodeImplCopyWith(
          _$CompleteRegistrationOptionsWithEmailCodeImpl value,
          $Res Function(_$CompleteRegistrationOptionsWithEmailCodeImpl) then) =
      __$$CompleteRegistrationOptionsWithEmailCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String flowId, String username, String name, String email, String code});
}

/// @nodoc
class __$$CompleteRegistrationOptionsWithEmailCodeImplCopyWithImpl<$Res>
    extends _$CompleteRegistrationOptionsCopyWithImpl<$Res,
        _$CompleteRegistrationOptionsWithEmailCodeImpl>
    implements _$$CompleteRegistrationOptionsWithEmailCodeImplCopyWith<$Res> {
  __$$CompleteRegistrationOptionsWithEmailCodeImplCopyWithImpl(
      _$CompleteRegistrationOptionsWithEmailCodeImpl _value,
      $Res Function(_$CompleteRegistrationOptionsWithEmailCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompleteRegistrationOptions
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
    return _then(_$CompleteRegistrationOptionsWithEmailCodeImpl(
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

class _$CompleteRegistrationOptionsWithEmailCodeImpl
    implements CompleteRegistrationOptionsWithEmailCode {
  const _$CompleteRegistrationOptionsWithEmailCodeImpl(
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
    return 'CompleteRegistrationOptions.withEmailCode(flowId: $flowId, username: $username, name: $name, email: $email, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteRegistrationOptionsWithEmailCodeImpl &&
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

  /// Create a copy of CompleteRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteRegistrationOptionsWithEmailCodeImplCopyWith<
          _$CompleteRegistrationOptionsWithEmailCodeImpl>
      get copyWith =>
          __$$CompleteRegistrationOptionsWithEmailCodeImplCopyWithImpl<
              _$CompleteRegistrationOptionsWithEmailCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, String username, String name,
            String email, String code)
        withEmailCode,
    required TResult Function(String flowId, String username, String name,
            String provider, String idToken)
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
    TResult? Function(String flowId, String username, String name,
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
    TResult Function(String flowId, String username, String name,
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
    required TResult Function(CompleteRegistrationOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(CompleteRegistrationOptionsWithOIDC value)
        withOIDC,
  }) {
    return withEmailCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompleteRegistrationOptionsWithEmailCode value)?
        withEmailCode,
    TResult? Function(CompleteRegistrationOptionsWithOIDC value)? withOIDC,
  }) {
    return withEmailCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompleteRegistrationOptionsWithEmailCode value)?
        withEmailCode,
    TResult Function(CompleteRegistrationOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withEmailCode != null) {
      return withEmailCode(this);
    }
    return orElse();
  }
}

abstract class CompleteRegistrationOptionsWithEmailCode
    implements CompleteRegistrationOptions {
  const factory CompleteRegistrationOptionsWithEmailCode(
          {required final String flowId,
          required final String username,
          required final String name,
          required final String email,
          required final String code}) =
      _$CompleteRegistrationOptionsWithEmailCodeImpl;

  @override
  String get flowId;
  @override
  String get username;
  @override
  String get name;
  String get email;
  String get code;

  /// Create a copy of CompleteRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteRegistrationOptionsWithEmailCodeImplCopyWith<
          _$CompleteRegistrationOptionsWithEmailCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompleteRegistrationOptionsWithOIDCImplCopyWith<$Res>
    implements $CompleteRegistrationOptionsCopyWith<$Res> {
  factory _$$CompleteRegistrationOptionsWithOIDCImplCopyWith(
          _$CompleteRegistrationOptionsWithOIDCImpl value,
          $Res Function(_$CompleteRegistrationOptionsWithOIDCImpl) then) =
      __$$CompleteRegistrationOptionsWithOIDCImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String flowId,
      String username,
      String name,
      String provider,
      String idToken});
}

/// @nodoc
class __$$CompleteRegistrationOptionsWithOIDCImplCopyWithImpl<$Res>
    extends _$CompleteRegistrationOptionsCopyWithImpl<$Res,
        _$CompleteRegistrationOptionsWithOIDCImpl>
    implements _$$CompleteRegistrationOptionsWithOIDCImplCopyWith<$Res> {
  __$$CompleteRegistrationOptionsWithOIDCImplCopyWithImpl(
      _$CompleteRegistrationOptionsWithOIDCImpl _value,
      $Res Function(_$CompleteRegistrationOptionsWithOIDCImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompleteRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowId = null,
    Object? username = null,
    Object? name = null,
    Object? provider = null,
    Object? idToken = null,
  }) {
    return _then(_$CompleteRegistrationOptionsWithOIDCImpl(
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

class _$CompleteRegistrationOptionsWithOIDCImpl
    implements CompleteRegistrationOptionsWithOIDC {
  const _$CompleteRegistrationOptionsWithOIDCImpl(
      {required this.flowId,
      required this.username,
      required this.name,
      required this.provider,
      required this.idToken});

  @override
  final String flowId;
  @override
  final String username;
  @override
  final String name;
  @override
  final String provider;
  @override
  final String idToken;

  @override
  String toString() {
    return 'CompleteRegistrationOptions.withOIDC(flowId: $flowId, username: $username, name: $name, provider: $provider, idToken: $idToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteRegistrationOptionsWithOIDCImpl &&
            (identical(other.flowId, flowId) || other.flowId == flowId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, flowId, username, name, provider, idToken);

  /// Create a copy of CompleteRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteRegistrationOptionsWithOIDCImplCopyWith<
          _$CompleteRegistrationOptionsWithOIDCImpl>
      get copyWith => __$$CompleteRegistrationOptionsWithOIDCImplCopyWithImpl<
          _$CompleteRegistrationOptionsWithOIDCImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, String username, String name,
            String email, String code)
        withEmailCode,
    required TResult Function(String flowId, String username, String name,
            String provider, String idToken)
        withOIDC,
  }) {
    return withOIDC(flowId, username, name, provider, idToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, String username, String name, String email,
            String code)?
        withEmailCode,
    TResult? Function(String flowId, String username, String name,
            String provider, String idToken)?
        withOIDC,
  }) {
    return withOIDC?.call(flowId, username, name, provider, idToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, String username, String name, String email,
            String code)?
        withEmailCode,
    TResult Function(String flowId, String username, String name,
            String provider, String idToken)?
        withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(flowId, username, name, provider, idToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompleteRegistrationOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(CompleteRegistrationOptionsWithOIDC value)
        withOIDC,
  }) {
    return withOIDC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompleteRegistrationOptionsWithEmailCode value)?
        withEmailCode,
    TResult? Function(CompleteRegistrationOptionsWithOIDC value)? withOIDC,
  }) {
    return withOIDC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompleteRegistrationOptionsWithEmailCode value)?
        withEmailCode,
    TResult Function(CompleteRegistrationOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(this);
    }
    return orElse();
  }
}

abstract class CompleteRegistrationOptionsWithOIDC
    implements CompleteRegistrationOptions {
  const factory CompleteRegistrationOptionsWithOIDC(
          {required final String flowId,
          required final String username,
          required final String name,
          required final String provider,
          required final String idToken}) =
      _$CompleteRegistrationOptionsWithOIDCImpl;

  @override
  String get flowId;
  @override
  String get username;
  @override
  String get name;
  String get provider;
  String get idToken;

  /// Create a copy of CompleteRegistrationOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteRegistrationOptionsWithOIDCImplCopyWith<
          _$CompleteRegistrationOptionsWithOIDCImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InitiateLoginOptions {
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
    required TResult Function(InitiateLoginOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(InitiateLoginOptionsWithOIDC value) withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitiateLoginOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(InitiateLoginOptionsWithOIDC value)? withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitiateLoginOptionsWithEmailCode value)? withEmailCode,
    TResult Function(InitiateLoginOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitiateLoginOptionsCopyWith<$Res> {
  factory $InitiateLoginOptionsCopyWith(InitiateLoginOptions value,
          $Res Function(InitiateLoginOptions) then) =
      _$InitiateLoginOptionsCopyWithImpl<$Res, InitiateLoginOptions>;
}

/// @nodoc
class _$InitiateLoginOptionsCopyWithImpl<$Res,
        $Val extends InitiateLoginOptions>
    implements $InitiateLoginOptionsCopyWith<$Res> {
  _$InitiateLoginOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InitiateLoginOptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitiateLoginOptionsWithEmailCodeImplCopyWith<$Res> {
  factory _$$InitiateLoginOptionsWithEmailCodeImplCopyWith(
          _$InitiateLoginOptionsWithEmailCodeImpl value,
          $Res Function(_$InitiateLoginOptionsWithEmailCodeImpl) then) =
      __$$InitiateLoginOptionsWithEmailCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$InitiateLoginOptionsWithEmailCodeImplCopyWithImpl<$Res>
    extends _$InitiateLoginOptionsCopyWithImpl<$Res,
        _$InitiateLoginOptionsWithEmailCodeImpl>
    implements _$$InitiateLoginOptionsWithEmailCodeImplCopyWith<$Res> {
  __$$InitiateLoginOptionsWithEmailCodeImplCopyWithImpl(
      _$InitiateLoginOptionsWithEmailCodeImpl _value,
      $Res Function(_$InitiateLoginOptionsWithEmailCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of InitiateLoginOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$InitiateLoginOptionsWithEmailCodeImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitiateLoginOptionsWithEmailCodeImpl
    implements InitiateLoginOptionsWithEmailCode {
  const _$InitiateLoginOptionsWithEmailCodeImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'InitiateLoginOptions.withEmailCode(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitiateLoginOptionsWithEmailCodeImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of InitiateLoginOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitiateLoginOptionsWithEmailCodeImplCopyWith<
          _$InitiateLoginOptionsWithEmailCodeImpl>
      get copyWith => __$$InitiateLoginOptionsWithEmailCodeImplCopyWithImpl<
          _$InitiateLoginOptionsWithEmailCodeImpl>(this, _$identity);

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
    required TResult Function(InitiateLoginOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(InitiateLoginOptionsWithOIDC value) withOIDC,
  }) {
    return withEmailCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitiateLoginOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(InitiateLoginOptionsWithOIDC value)? withOIDC,
  }) {
    return withEmailCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitiateLoginOptionsWithEmailCode value)? withEmailCode,
    TResult Function(InitiateLoginOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withEmailCode != null) {
      return withEmailCode(this);
    }
    return orElse();
  }
}

abstract class InitiateLoginOptionsWithEmailCode
    implements InitiateLoginOptions {
  const factory InitiateLoginOptionsWithEmailCode(
      {required final String email}) = _$InitiateLoginOptionsWithEmailCodeImpl;

  String get email;

  /// Create a copy of InitiateLoginOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitiateLoginOptionsWithEmailCodeImplCopyWith<
          _$InitiateLoginOptionsWithEmailCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitiateLoginOptionsWithOIDCImplCopyWith<$Res> {
  factory _$$InitiateLoginOptionsWithOIDCImplCopyWith(
          _$InitiateLoginOptionsWithOIDCImpl value,
          $Res Function(_$InitiateLoginOptionsWithOIDCImpl) then) =
      __$$InitiateLoginOptionsWithOIDCImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitiateLoginOptionsWithOIDCImplCopyWithImpl<$Res>
    extends _$InitiateLoginOptionsCopyWithImpl<$Res,
        _$InitiateLoginOptionsWithOIDCImpl>
    implements _$$InitiateLoginOptionsWithOIDCImplCopyWith<$Res> {
  __$$InitiateLoginOptionsWithOIDCImplCopyWithImpl(
      _$InitiateLoginOptionsWithOIDCImpl _value,
      $Res Function(_$InitiateLoginOptionsWithOIDCImpl) _then)
      : super(_value, _then);

  /// Create a copy of InitiateLoginOptions
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitiateLoginOptionsWithOIDCImpl
    implements InitiateLoginOptionsWithOIDC {
  const _$InitiateLoginOptionsWithOIDCImpl();

  @override
  String toString() {
    return 'InitiateLoginOptions.withOIDC()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitiateLoginOptionsWithOIDCImpl);
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
    required TResult Function(InitiateLoginOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(InitiateLoginOptionsWithOIDC value) withOIDC,
  }) {
    return withOIDC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitiateLoginOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(InitiateLoginOptionsWithOIDC value)? withOIDC,
  }) {
    return withOIDC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitiateLoginOptionsWithEmailCode value)? withEmailCode,
    TResult Function(InitiateLoginOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(this);
    }
    return orElse();
  }
}

abstract class InitiateLoginOptionsWithOIDC implements InitiateLoginOptions {
  const factory InitiateLoginOptionsWithOIDC() =
      _$InitiateLoginOptionsWithOIDCImpl;
}

/// @nodoc
mixin _$CompleteLoginOptions {
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
    required TResult Function(CompleteLoginOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(CompleteLoginOptionsWithOIDC value) withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompleteLoginOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(CompleteLoginOptionsWithOIDC value)? withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompleteLoginOptionsWithEmailCode value)? withEmailCode,
    TResult Function(CompleteLoginOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CompleteLoginOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompleteLoginOptionsCopyWith<CompleteLoginOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteLoginOptionsCopyWith<$Res> {
  factory $CompleteLoginOptionsCopyWith(CompleteLoginOptions value,
          $Res Function(CompleteLoginOptions) then) =
      _$CompleteLoginOptionsCopyWithImpl<$Res, CompleteLoginOptions>;
  @useResult
  $Res call({String flowId});
}

/// @nodoc
class _$CompleteLoginOptionsCopyWithImpl<$Res,
        $Val extends CompleteLoginOptions>
    implements $CompleteLoginOptionsCopyWith<$Res> {
  _$CompleteLoginOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompleteLoginOptions
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
abstract class _$$CompleteLoginOptionsWithEmailCodeImplCopyWith<$Res>
    implements $CompleteLoginOptionsCopyWith<$Res> {
  factory _$$CompleteLoginOptionsWithEmailCodeImplCopyWith(
          _$CompleteLoginOptionsWithEmailCodeImpl value,
          $Res Function(_$CompleteLoginOptionsWithEmailCodeImpl) then) =
      __$$CompleteLoginOptionsWithEmailCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String flowId, String identifier, String code});
}

/// @nodoc
class __$$CompleteLoginOptionsWithEmailCodeImplCopyWithImpl<$Res>
    extends _$CompleteLoginOptionsCopyWithImpl<$Res,
        _$CompleteLoginOptionsWithEmailCodeImpl>
    implements _$$CompleteLoginOptionsWithEmailCodeImplCopyWith<$Res> {
  __$$CompleteLoginOptionsWithEmailCodeImplCopyWithImpl(
      _$CompleteLoginOptionsWithEmailCodeImpl _value,
      $Res Function(_$CompleteLoginOptionsWithEmailCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompleteLoginOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowId = null,
    Object? identifier = null,
    Object? code = null,
  }) {
    return _then(_$CompleteLoginOptionsWithEmailCodeImpl(
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

class _$CompleteLoginOptionsWithEmailCodeImpl
    implements CompleteLoginOptionsWithEmailCode {
  const _$CompleteLoginOptionsWithEmailCodeImpl(
      {required this.flowId, required this.identifier, required this.code});

  @override
  final String flowId;
  @override
  final String identifier;
  @override
  final String code;

  @override
  String toString() {
    return 'CompleteLoginOptions.withEmailCode(flowId: $flowId, identifier: $identifier, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteLoginOptionsWithEmailCodeImpl &&
            (identical(other.flowId, flowId) || other.flowId == flowId) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flowId, identifier, code);

  /// Create a copy of CompleteLoginOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteLoginOptionsWithEmailCodeImplCopyWith<
          _$CompleteLoginOptionsWithEmailCodeImpl>
      get copyWith => __$$CompleteLoginOptionsWithEmailCodeImplCopyWithImpl<
          _$CompleteLoginOptionsWithEmailCodeImpl>(this, _$identity);

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
    required TResult Function(CompleteLoginOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(CompleteLoginOptionsWithOIDC value) withOIDC,
  }) {
    return withEmailCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompleteLoginOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(CompleteLoginOptionsWithOIDC value)? withOIDC,
  }) {
    return withEmailCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompleteLoginOptionsWithEmailCode value)? withEmailCode,
    TResult Function(CompleteLoginOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withEmailCode != null) {
      return withEmailCode(this);
    }
    return orElse();
  }
}

abstract class CompleteLoginOptionsWithEmailCode
    implements CompleteLoginOptions {
  const factory CompleteLoginOptionsWithEmailCode(
      {required final String flowId,
      required final String identifier,
      required final String code}) = _$CompleteLoginOptionsWithEmailCodeImpl;

  @override
  String get flowId;
  String get identifier;
  String get code;

  /// Create a copy of CompleteLoginOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteLoginOptionsWithEmailCodeImplCopyWith<
          _$CompleteLoginOptionsWithEmailCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompleteLoginOptionsWithOIDCImplCopyWith<$Res>
    implements $CompleteLoginOptionsCopyWith<$Res> {
  factory _$$CompleteLoginOptionsWithOIDCImplCopyWith(
          _$CompleteLoginOptionsWithOIDCImpl value,
          $Res Function(_$CompleteLoginOptionsWithOIDCImpl) then) =
      __$$CompleteLoginOptionsWithOIDCImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String flowId, String provider, String idToken});
}

/// @nodoc
class __$$CompleteLoginOptionsWithOIDCImplCopyWithImpl<$Res>
    extends _$CompleteLoginOptionsCopyWithImpl<$Res,
        _$CompleteLoginOptionsWithOIDCImpl>
    implements _$$CompleteLoginOptionsWithOIDCImplCopyWith<$Res> {
  __$$CompleteLoginOptionsWithOIDCImplCopyWithImpl(
      _$CompleteLoginOptionsWithOIDCImpl _value,
      $Res Function(_$CompleteLoginOptionsWithOIDCImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompleteLoginOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowId = null,
    Object? provider = null,
    Object? idToken = null,
  }) {
    return _then(_$CompleteLoginOptionsWithOIDCImpl(
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

class _$CompleteLoginOptionsWithOIDCImpl
    implements CompleteLoginOptionsWithOIDC {
  const _$CompleteLoginOptionsWithOIDCImpl(
      {required this.flowId, required this.provider, required this.idToken});

  @override
  final String flowId;
  @override
  final String provider;
  @override
  final String idToken;

  @override
  String toString() {
    return 'CompleteLoginOptions.withOIDC(flowId: $flowId, provider: $provider, idToken: $idToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteLoginOptionsWithOIDCImpl &&
            (identical(other.flowId, flowId) || other.flowId == flowId) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flowId, provider, idToken);

  /// Create a copy of CompleteLoginOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteLoginOptionsWithOIDCImplCopyWith<
          _$CompleteLoginOptionsWithOIDCImpl>
      get copyWith => __$$CompleteLoginOptionsWithOIDCImplCopyWithImpl<
          _$CompleteLoginOptionsWithOIDCImpl>(this, _$identity);

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
    required TResult Function(CompleteLoginOptionsWithEmailCode value)
        withEmailCode,
    required TResult Function(CompleteLoginOptionsWithOIDC value) withOIDC,
  }) {
    return withOIDC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompleteLoginOptionsWithEmailCode value)? withEmailCode,
    TResult? Function(CompleteLoginOptionsWithOIDC value)? withOIDC,
  }) {
    return withOIDC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompleteLoginOptionsWithEmailCode value)? withEmailCode,
    TResult Function(CompleteLoginOptionsWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(this);
    }
    return orElse();
  }
}

abstract class CompleteLoginOptionsWithOIDC implements CompleteLoginOptions {
  const factory CompleteLoginOptionsWithOIDC(
      {required final String flowId,
      required final String provider,
      required final String idToken}) = _$CompleteLoginOptionsWithOIDCImpl;

  @override
  String get flowId;
  String get provider;
  String get idToken;

  /// Create a copy of CompleteLoginOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteLoginOptionsWithOIDCImplCopyWith<
          _$CompleteLoginOptionsWithOIDCImpl>
      get copyWith => throw _privateConstructorUsedError;
}
