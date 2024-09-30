// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../authentication_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegistrationData {
  String get username => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String email, String username, String name, String? code)
        withEmailCode,
    required TResult Function(
            String username, String name, String? provider, String? idToken)
        withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String username, String name, String? code)?
        withEmailCode,
    TResult? Function(
            String username, String name, String? provider, String? idToken)?
        withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String username, String name, String? code)?
        withEmailCode,
    TResult Function(
            String username, String name, String? provider, String? idToken)?
        withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegistrationWithEmailCode value) withEmailCode,
    required TResult Function(RegistrationWithOIDC value) withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegistrationWithEmailCode value)? withEmailCode,
    TResult? Function(RegistrationWithOIDC value)? withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationWithEmailCode value)? withEmailCode,
    TResult Function(RegistrationWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RegistrationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegistrationDataCopyWith<RegistrationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationDataCopyWith<$Res> {
  factory $RegistrationDataCopyWith(
          RegistrationData value, $Res Function(RegistrationData) then) =
      _$RegistrationDataCopyWithImpl<$Res, RegistrationData>;
  @useResult
  $Res call({String username, String name});
}

/// @nodoc
class _$RegistrationDataCopyWithImpl<$Res, $Val extends RegistrationData>
    implements $RegistrationDataCopyWith<$Res> {
  _$RegistrationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrationData
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
abstract class _$$RegistrationWithEmailCodeImplCopyWith<$Res>
    implements $RegistrationDataCopyWith<$Res> {
  factory _$$RegistrationWithEmailCodeImplCopyWith(
          _$RegistrationWithEmailCodeImpl value,
          $Res Function(_$RegistrationWithEmailCodeImpl) then) =
      __$$RegistrationWithEmailCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String username, String name, String? code});
}

/// @nodoc
class __$$RegistrationWithEmailCodeImplCopyWithImpl<$Res>
    extends _$RegistrationDataCopyWithImpl<$Res,
        _$RegistrationWithEmailCodeImpl>
    implements _$$RegistrationWithEmailCodeImplCopyWith<$Res> {
  __$$RegistrationWithEmailCodeImplCopyWithImpl(
      _$RegistrationWithEmailCodeImpl _value,
      $Res Function(_$RegistrationWithEmailCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? username = null,
    Object? name = null,
    Object? code = freezed,
  }) {
    return _then(_$RegistrationWithEmailCodeImpl(
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
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RegistrationWithEmailCodeImpl implements RegistrationWithEmailCode {
  const _$RegistrationWithEmailCodeImpl(
      {required this.email,
      required this.username,
      required this.name,
      this.code});

  @override
  final String email;
  @override
  final String username;
  @override
  final String name;
  @override
  final String? code;

  @override
  String toString() {
    return 'RegistrationData.withEmailCode(email: $email, username: $username, name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationWithEmailCodeImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, username, name, code);

  /// Create a copy of RegistrationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationWithEmailCodeImplCopyWith<_$RegistrationWithEmailCodeImpl>
      get copyWith => __$$RegistrationWithEmailCodeImplCopyWithImpl<
          _$RegistrationWithEmailCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String email, String username, String name, String? code)
        withEmailCode,
    required TResult Function(
            String username, String name, String? provider, String? idToken)
        withOIDC,
  }) {
    return withEmailCode(email, username, name, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String username, String name, String? code)?
        withEmailCode,
    TResult? Function(
            String username, String name, String? provider, String? idToken)?
        withOIDC,
  }) {
    return withEmailCode?.call(email, username, name, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String username, String name, String? code)?
        withEmailCode,
    TResult Function(
            String username, String name, String? provider, String? idToken)?
        withOIDC,
    required TResult orElse(),
  }) {
    if (withEmailCode != null) {
      return withEmailCode(email, username, name, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegistrationWithEmailCode value) withEmailCode,
    required TResult Function(RegistrationWithOIDC value) withOIDC,
  }) {
    return withEmailCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegistrationWithEmailCode value)? withEmailCode,
    TResult? Function(RegistrationWithOIDC value)? withOIDC,
  }) {
    return withEmailCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationWithEmailCode value)? withEmailCode,
    TResult Function(RegistrationWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withEmailCode != null) {
      return withEmailCode(this);
    }
    return orElse();
  }
}

abstract class RegistrationWithEmailCode implements RegistrationData {
  const factory RegistrationWithEmailCode(
      {required final String email,
      required final String username,
      required final String name,
      final String? code}) = _$RegistrationWithEmailCodeImpl;

  String get email;
  @override
  String get username;
  @override
  String get name;
  String? get code;

  /// Create a copy of RegistrationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationWithEmailCodeImplCopyWith<_$RegistrationWithEmailCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegistrationWithOIDCImplCopyWith<$Res>
    implements $RegistrationDataCopyWith<$Res> {
  factory _$$RegistrationWithOIDCImplCopyWith(_$RegistrationWithOIDCImpl value,
          $Res Function(_$RegistrationWithOIDCImpl) then) =
      __$$RegistrationWithOIDCImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String name, String? provider, String? idToken});
}

/// @nodoc
class __$$RegistrationWithOIDCImplCopyWithImpl<$Res>
    extends _$RegistrationDataCopyWithImpl<$Res, _$RegistrationWithOIDCImpl>
    implements _$$RegistrationWithOIDCImplCopyWith<$Res> {
  __$$RegistrationWithOIDCImplCopyWithImpl(_$RegistrationWithOIDCImpl _value,
      $Res Function(_$RegistrationWithOIDCImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? name = null,
    Object? provider = freezed,
    Object? idToken = freezed,
  }) {
    return _then(_$RegistrationWithOIDCImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RegistrationWithOIDCImpl implements RegistrationWithOIDC {
  const _$RegistrationWithOIDCImpl(
      {required this.username,
      required this.name,
      this.provider,
      this.idToken});

  @override
  final String username;
  @override
  final String name;
  @override
  final String? provider;
  @override
  final String? idToken;

  @override
  String toString() {
    return 'RegistrationData.withOIDC(username: $username, name: $name, provider: $provider, idToken: $idToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationWithOIDCImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, username, name, provider, idToken);

  /// Create a copy of RegistrationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationWithOIDCImplCopyWith<_$RegistrationWithOIDCImpl>
      get copyWith =>
          __$$RegistrationWithOIDCImplCopyWithImpl<_$RegistrationWithOIDCImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String email, String username, String name, String? code)
        withEmailCode,
    required TResult Function(
            String username, String name, String? provider, String? idToken)
        withOIDC,
  }) {
    return withOIDC(username, name, provider, idToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String username, String name, String? code)?
        withEmailCode,
    TResult? Function(
            String username, String name, String? provider, String? idToken)?
        withOIDC,
  }) {
    return withOIDC?.call(username, name, provider, idToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String username, String name, String? code)?
        withEmailCode,
    TResult Function(
            String username, String name, String? provider, String? idToken)?
        withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(username, name, provider, idToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegistrationWithEmailCode value) withEmailCode,
    required TResult Function(RegistrationWithOIDC value) withOIDC,
  }) {
    return withOIDC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegistrationWithEmailCode value)? withEmailCode,
    TResult? Function(RegistrationWithOIDC value)? withOIDC,
  }) {
    return withOIDC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationWithEmailCode value)? withEmailCode,
    TResult Function(RegistrationWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(this);
    }
    return orElse();
  }
}

abstract class RegistrationWithOIDC implements RegistrationData {
  const factory RegistrationWithOIDC(
      {required final String username,
      required final String name,
      final String? provider,
      final String? idToken}) = _$RegistrationWithOIDCImpl;

  @override
  String get username;
  @override
  String get name;
  String? get provider;
  String? get idToken;

  /// Create a copy of RegistrationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationWithOIDCImplCopyWith<_$RegistrationWithOIDCImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginData {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String? code) withEmailCode,
    required TResult Function(String? provider, String? idToken) withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String? code)? withEmailCode,
    TResult? Function(String? provider, String? idToken)? withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String? code)? withEmailCode,
    TResult Function(String? provider, String? idToken)? withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginWithEmailCode value) withEmailCode,
    required TResult Function(LoginWithOIDC value) withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginWithEmailCode value)? withEmailCode,
    TResult? Function(LoginWithOIDC value)? withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginWithEmailCode value)? withEmailCode,
    TResult Function(LoginWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDataCopyWith<$Res> {
  factory $LoginDataCopyWith(LoginData value, $Res Function(LoginData) then) =
      _$LoginDataCopyWithImpl<$Res, LoginData>;
}

/// @nodoc
class _$LoginDataCopyWithImpl<$Res, $Val extends LoginData>
    implements $LoginDataCopyWith<$Res> {
  _$LoginDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoginWithEmailCodeImplCopyWith<$Res> {
  factory _$$LoginWithEmailCodeImplCopyWith(_$LoginWithEmailCodeImpl value,
          $Res Function(_$LoginWithEmailCodeImpl) then) =
      __$$LoginWithEmailCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String? code});
}

/// @nodoc
class __$$LoginWithEmailCodeImplCopyWithImpl<$Res>
    extends _$LoginDataCopyWithImpl<$Res, _$LoginWithEmailCodeImpl>
    implements _$$LoginWithEmailCodeImplCopyWith<$Res> {
  __$$LoginWithEmailCodeImplCopyWithImpl(_$LoginWithEmailCodeImpl _value,
      $Res Function(_$LoginWithEmailCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = freezed,
  }) {
    return _then(_$LoginWithEmailCodeImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoginWithEmailCodeImpl implements LoginWithEmailCode {
  const _$LoginWithEmailCodeImpl({required this.email, this.code});

  @override
  final String email;
  @override
  final String? code;

  @override
  String toString() {
    return 'LoginData.withEmailCode(email: $email, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithEmailCodeImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, code);

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithEmailCodeImplCopyWith<_$LoginWithEmailCodeImpl> get copyWith =>
      __$$LoginWithEmailCodeImplCopyWithImpl<_$LoginWithEmailCodeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String? code) withEmailCode,
    required TResult Function(String? provider, String? idToken) withOIDC,
  }) {
    return withEmailCode(email, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String? code)? withEmailCode,
    TResult? Function(String? provider, String? idToken)? withOIDC,
  }) {
    return withEmailCode?.call(email, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String? code)? withEmailCode,
    TResult Function(String? provider, String? idToken)? withOIDC,
    required TResult orElse(),
  }) {
    if (withEmailCode != null) {
      return withEmailCode(email, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginWithEmailCode value) withEmailCode,
    required TResult Function(LoginWithOIDC value) withOIDC,
  }) {
    return withEmailCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginWithEmailCode value)? withEmailCode,
    TResult? Function(LoginWithOIDC value)? withOIDC,
  }) {
    return withEmailCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginWithEmailCode value)? withEmailCode,
    TResult Function(LoginWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withEmailCode != null) {
      return withEmailCode(this);
    }
    return orElse();
  }
}

abstract class LoginWithEmailCode implements LoginData {
  const factory LoginWithEmailCode(
      {required final String email,
      final String? code}) = _$LoginWithEmailCodeImpl;

  String get email;
  String? get code;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginWithEmailCodeImplCopyWith<_$LoginWithEmailCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginWithOIDCImplCopyWith<$Res> {
  factory _$$LoginWithOIDCImplCopyWith(
          _$LoginWithOIDCImpl value, $Res Function(_$LoginWithOIDCImpl) then) =
      __$$LoginWithOIDCImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? provider, String? idToken});
}

/// @nodoc
class __$$LoginWithOIDCImplCopyWithImpl<$Res>
    extends _$LoginDataCopyWithImpl<$Res, _$LoginWithOIDCImpl>
    implements _$$LoginWithOIDCImplCopyWith<$Res> {
  __$$LoginWithOIDCImplCopyWithImpl(
      _$LoginWithOIDCImpl _value, $Res Function(_$LoginWithOIDCImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = freezed,
    Object? idToken = freezed,
  }) {
    return _then(_$LoginWithOIDCImpl(
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoginWithOIDCImpl implements LoginWithOIDC {
  const _$LoginWithOIDCImpl({this.provider, this.idToken});

  @override
  final String? provider;
  @override
  final String? idToken;

  @override
  String toString() {
    return 'LoginData.withOIDC(provider: $provider, idToken: $idToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithOIDCImpl &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, provider, idToken);

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithOIDCImplCopyWith<_$LoginWithOIDCImpl> get copyWith =>
      __$$LoginWithOIDCImplCopyWithImpl<_$LoginWithOIDCImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String? code) withEmailCode,
    required TResult Function(String? provider, String? idToken) withOIDC,
  }) {
    return withOIDC(provider, idToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String? code)? withEmailCode,
    TResult? Function(String? provider, String? idToken)? withOIDC,
  }) {
    return withOIDC?.call(provider, idToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String? code)? withEmailCode,
    TResult Function(String? provider, String? idToken)? withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(provider, idToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginWithEmailCode value) withEmailCode,
    required TResult Function(LoginWithOIDC value) withOIDC,
  }) {
    return withOIDC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginWithEmailCode value)? withEmailCode,
    TResult? Function(LoginWithOIDC value)? withOIDC,
  }) {
    return withOIDC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginWithEmailCode value)? withEmailCode,
    TResult Function(LoginWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(this);
    }
    return orElse();
  }
}

abstract class LoginWithOIDC implements LoginData {
  const factory LoginWithOIDC({final String? provider, final String? idToken}) =
      _$LoginWithOIDCImpl;

  String? get provider;
  String? get idToken;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginWithOIDCImplCopyWith<_$LoginWithOIDCImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthenticationFlowData {
  String get flowId => throw _privateConstructorUsedError;
  Object get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, RegistrationData data) signUp,
    required TResult Function(String flowId, LoginData data) signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, RegistrationData data)? signUp,
    TResult? Function(String flowId, LoginData data)? signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, RegistrationData data)? signUp,
    TResult Function(String flowId, LoginData data)? signIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegistrationFlowData value) signUp,
    required TResult Function(LoginFlowData value) signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegistrationFlowData value)? signUp,
    TResult? Function(LoginFlowData value)? signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationFlowData value)? signUp,
    TResult Function(LoginFlowData value)? signIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AuthenticationFlowData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthenticationFlowDataCopyWith<AuthenticationFlowData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationFlowDataCopyWith<$Res> {
  factory $AuthenticationFlowDataCopyWith(AuthenticationFlowData value,
          $Res Function(AuthenticationFlowData) then) =
      _$AuthenticationFlowDataCopyWithImpl<$Res, AuthenticationFlowData>;
  @useResult
  $Res call({String flowId});
}

/// @nodoc
class _$AuthenticationFlowDataCopyWithImpl<$Res,
        $Val extends AuthenticationFlowData>
    implements $AuthenticationFlowDataCopyWith<$Res> {
  _$AuthenticationFlowDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationFlowData
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
abstract class _$$RegistrationFlowDataImplCopyWith<$Res>
    implements $AuthenticationFlowDataCopyWith<$Res> {
  factory _$$RegistrationFlowDataImplCopyWith(_$RegistrationFlowDataImpl value,
          $Res Function(_$RegistrationFlowDataImpl) then) =
      __$$RegistrationFlowDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String flowId, RegistrationData data});

  $RegistrationDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$RegistrationFlowDataImplCopyWithImpl<$Res>
    extends _$AuthenticationFlowDataCopyWithImpl<$Res,
        _$RegistrationFlowDataImpl>
    implements _$$RegistrationFlowDataImplCopyWith<$Res> {
  __$$RegistrationFlowDataImplCopyWithImpl(_$RegistrationFlowDataImpl _value,
      $Res Function(_$RegistrationFlowDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationFlowData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowId = null,
    Object? data = null,
  }) {
    return _then(_$RegistrationFlowDataImpl(
      flowId: null == flowId
          ? _value.flowId
          : flowId // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RegistrationData,
    ));
  }

  /// Create a copy of AuthenticationFlowData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RegistrationDataCopyWith<$Res> get data {
    return $RegistrationDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$RegistrationFlowDataImpl implements RegistrationFlowData {
  const _$RegistrationFlowDataImpl({required this.flowId, required this.data});

  @override
  final String flowId;
  @override
  final RegistrationData data;

  @override
  String toString() {
    return 'AuthenticationFlowData.signUp(flowId: $flowId, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationFlowDataImpl &&
            (identical(other.flowId, flowId) || other.flowId == flowId) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flowId, data);

  /// Create a copy of AuthenticationFlowData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationFlowDataImplCopyWith<_$RegistrationFlowDataImpl>
      get copyWith =>
          __$$RegistrationFlowDataImplCopyWithImpl<_$RegistrationFlowDataImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, RegistrationData data) signUp,
    required TResult Function(String flowId, LoginData data) signIn,
  }) {
    return signUp(flowId, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, RegistrationData data)? signUp,
    TResult? Function(String flowId, LoginData data)? signIn,
  }) {
    return signUp?.call(flowId, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, RegistrationData data)? signUp,
    TResult Function(String flowId, LoginData data)? signIn,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(flowId, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegistrationFlowData value) signUp,
    required TResult Function(LoginFlowData value) signIn,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegistrationFlowData value)? signUp,
    TResult? Function(LoginFlowData value)? signIn,
  }) {
    return signUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationFlowData value)? signUp,
    TResult Function(LoginFlowData value)? signIn,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class RegistrationFlowData implements AuthenticationFlowData {
  const factory RegistrationFlowData(
      {required final String flowId,
      required final RegistrationData data}) = _$RegistrationFlowDataImpl;

  @override
  String get flowId;
  @override
  RegistrationData get data;

  /// Create a copy of AuthenticationFlowData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationFlowDataImplCopyWith<_$RegistrationFlowDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginFlowDataImplCopyWith<$Res>
    implements $AuthenticationFlowDataCopyWith<$Res> {
  factory _$$LoginFlowDataImplCopyWith(
          _$LoginFlowDataImpl value, $Res Function(_$LoginFlowDataImpl) then) =
      __$$LoginFlowDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String flowId, LoginData data});

  $LoginDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$LoginFlowDataImplCopyWithImpl<$Res>
    extends _$AuthenticationFlowDataCopyWithImpl<$Res, _$LoginFlowDataImpl>
    implements _$$LoginFlowDataImplCopyWith<$Res> {
  __$$LoginFlowDataImplCopyWithImpl(
      _$LoginFlowDataImpl _value, $Res Function(_$LoginFlowDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationFlowData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowId = null,
    Object? data = null,
  }) {
    return _then(_$LoginFlowDataImpl(
      flowId: null == flowId
          ? _value.flowId
          : flowId // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoginData,
    ));
  }

  /// Create a copy of AuthenticationFlowData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginDataCopyWith<$Res> get data {
    return $LoginDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$LoginFlowDataImpl implements LoginFlowData {
  const _$LoginFlowDataImpl({required this.flowId, required this.data});

  @override
  final String flowId;
  @override
  final LoginData data;

  @override
  String toString() {
    return 'AuthenticationFlowData.signIn(flowId: $flowId, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginFlowDataImpl &&
            (identical(other.flowId, flowId) || other.flowId == flowId) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flowId, data);

  /// Create a copy of AuthenticationFlowData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginFlowDataImplCopyWith<_$LoginFlowDataImpl> get copyWith =>
      __$$LoginFlowDataImplCopyWithImpl<_$LoginFlowDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, RegistrationData data) signUp,
    required TResult Function(String flowId, LoginData data) signIn,
  }) {
    return signIn(flowId, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, RegistrationData data)? signUp,
    TResult? Function(String flowId, LoginData data)? signIn,
  }) {
    return signIn?.call(flowId, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, RegistrationData data)? signUp,
    TResult Function(String flowId, LoginData data)? signIn,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(flowId, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegistrationFlowData value) signUp,
    required TResult Function(LoginFlowData value) signIn,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegistrationFlowData value)? signUp,
    TResult? Function(LoginFlowData value)? signIn,
  }) {
    return signIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationFlowData value)? signUp,
    TResult Function(LoginFlowData value)? signIn,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class LoginFlowData implements AuthenticationFlowData {
  const factory LoginFlowData(
      {required final String flowId,
      required final LoginData data}) = _$LoginFlowDataImpl;

  @override
  String get flowId;
  @override
  LoginData get data;

  /// Create a copy of AuthenticationFlowData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginFlowDataImplCopyWith<_$LoginFlowDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
