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
mixin _$RegistrationFlowData {
  String get flowId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, String username, String name,
            String email, String? code)
        withCode,
    required TResult Function(String flowId, String username, String name,
            String? provider, String? idToken)
        withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, String username, String name, String email,
            String? code)?
        withCode,
    TResult? Function(String flowId, String username, String name,
            String? provider, String? idToken)?
        withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, String username, String name, String email,
            String? code)?
        withCode,
    TResult Function(String flowId, String username, String name,
            String? provider, String? idToken)?
        withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegistrationFlowDataWithCode value) withCode,
    required TResult Function(RegistrationFlowDataWithOIDC value) withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegistrationFlowDataWithCode value)? withCode,
    TResult? Function(RegistrationFlowDataWithOIDC value)? withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationFlowDataWithCode value)? withCode,
    TResult Function(RegistrationFlowDataWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RegistrationFlowData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegistrationFlowDataCopyWith<RegistrationFlowData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationFlowDataCopyWith<$Res> {
  factory $RegistrationFlowDataCopyWith(RegistrationFlowData value,
          $Res Function(RegistrationFlowData) then) =
      _$RegistrationFlowDataCopyWithImpl<$Res, RegistrationFlowData>;
  @useResult
  $Res call({String flowId, String username, String name});
}

/// @nodoc
class _$RegistrationFlowDataCopyWithImpl<$Res,
        $Val extends RegistrationFlowData>
    implements $RegistrationFlowDataCopyWith<$Res> {
  _$RegistrationFlowDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrationFlowData
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
abstract class _$$RegistrationFlowDataWithCodeImplCopyWith<$Res>
    implements $RegistrationFlowDataCopyWith<$Res> {
  factory _$$RegistrationFlowDataWithCodeImplCopyWith(
          _$RegistrationFlowDataWithCodeImpl value,
          $Res Function(_$RegistrationFlowDataWithCodeImpl) then) =
      __$$RegistrationFlowDataWithCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String flowId,
      String username,
      String name,
      String email,
      String? code});
}

/// @nodoc
class __$$RegistrationFlowDataWithCodeImplCopyWithImpl<$Res>
    extends _$RegistrationFlowDataCopyWithImpl<$Res,
        _$RegistrationFlowDataWithCodeImpl>
    implements _$$RegistrationFlowDataWithCodeImplCopyWith<$Res> {
  __$$RegistrationFlowDataWithCodeImplCopyWithImpl(
      _$RegistrationFlowDataWithCodeImpl _value,
      $Res Function(_$RegistrationFlowDataWithCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationFlowData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowId = null,
    Object? username = null,
    Object? name = null,
    Object? email = null,
    Object? code = freezed,
  }) {
    return _then(_$RegistrationFlowDataWithCodeImpl(
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
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RegistrationFlowDataWithCodeImpl
    implements RegistrationFlowDataWithCode {
  const _$RegistrationFlowDataWithCodeImpl(
      {required this.flowId,
      required this.username,
      required this.name,
      required this.email,
      this.code});

  @override
  final String flowId;
  @override
  final String username;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? code;

  @override
  String toString() {
    return 'RegistrationFlowData.withCode(flowId: $flowId, username: $username, name: $name, email: $email, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationFlowDataWithCodeImpl &&
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

  /// Create a copy of RegistrationFlowData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationFlowDataWithCodeImplCopyWith<
          _$RegistrationFlowDataWithCodeImpl>
      get copyWith => __$$RegistrationFlowDataWithCodeImplCopyWithImpl<
          _$RegistrationFlowDataWithCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, String username, String name,
            String email, String? code)
        withCode,
    required TResult Function(String flowId, String username, String name,
            String? provider, String? idToken)
        withOIDC,
  }) {
    return withCode(flowId, username, name, email, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, String username, String name, String email,
            String? code)?
        withCode,
    TResult? Function(String flowId, String username, String name,
            String? provider, String? idToken)?
        withOIDC,
  }) {
    return withCode?.call(flowId, username, name, email, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, String username, String name, String email,
            String? code)?
        withCode,
    TResult Function(String flowId, String username, String name,
            String? provider, String? idToken)?
        withOIDC,
    required TResult orElse(),
  }) {
    if (withCode != null) {
      return withCode(flowId, username, name, email, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegistrationFlowDataWithCode value) withCode,
    required TResult Function(RegistrationFlowDataWithOIDC value) withOIDC,
  }) {
    return withCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegistrationFlowDataWithCode value)? withCode,
    TResult? Function(RegistrationFlowDataWithOIDC value)? withOIDC,
  }) {
    return withCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationFlowDataWithCode value)? withCode,
    TResult Function(RegistrationFlowDataWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withCode != null) {
      return withCode(this);
    }
    return orElse();
  }
}

abstract class RegistrationFlowDataWithCode implements RegistrationFlowData {
  const factory RegistrationFlowDataWithCode(
      {required final String flowId,
      required final String username,
      required final String name,
      required final String email,
      final String? code}) = _$RegistrationFlowDataWithCodeImpl;

  @override
  String get flowId;
  @override
  String get username;
  @override
  String get name;
  String get email;
  String? get code;

  /// Create a copy of RegistrationFlowData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationFlowDataWithCodeImplCopyWith<
          _$RegistrationFlowDataWithCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegistrationFlowDataWithOIDCImplCopyWith<$Res>
    implements $RegistrationFlowDataCopyWith<$Res> {
  factory _$$RegistrationFlowDataWithOIDCImplCopyWith(
          _$RegistrationFlowDataWithOIDCImpl value,
          $Res Function(_$RegistrationFlowDataWithOIDCImpl) then) =
      __$$RegistrationFlowDataWithOIDCImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String flowId,
      String username,
      String name,
      String? provider,
      String? idToken});
}

/// @nodoc
class __$$RegistrationFlowDataWithOIDCImplCopyWithImpl<$Res>
    extends _$RegistrationFlowDataCopyWithImpl<$Res,
        _$RegistrationFlowDataWithOIDCImpl>
    implements _$$RegistrationFlowDataWithOIDCImplCopyWith<$Res> {
  __$$RegistrationFlowDataWithOIDCImplCopyWithImpl(
      _$RegistrationFlowDataWithOIDCImpl _value,
      $Res Function(_$RegistrationFlowDataWithOIDCImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationFlowData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowId = null,
    Object? username = null,
    Object? name = null,
    Object? provider = freezed,
    Object? idToken = freezed,
  }) {
    return _then(_$RegistrationFlowDataWithOIDCImpl(
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

class _$RegistrationFlowDataWithOIDCImpl
    implements RegistrationFlowDataWithOIDC {
  const _$RegistrationFlowDataWithOIDCImpl(
      {required this.flowId,
      required this.username,
      required this.name,
      this.provider,
      this.idToken});

  @override
  final String flowId;
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
    return 'RegistrationFlowData.withOIDC(flowId: $flowId, username: $username, name: $name, provider: $provider, idToken: $idToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationFlowDataWithOIDCImpl &&
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

  /// Create a copy of RegistrationFlowData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationFlowDataWithOIDCImplCopyWith<
          _$RegistrationFlowDataWithOIDCImpl>
      get copyWith => __$$RegistrationFlowDataWithOIDCImplCopyWithImpl<
          _$RegistrationFlowDataWithOIDCImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, String username, String name,
            String email, String? code)
        withCode,
    required TResult Function(String flowId, String username, String name,
            String? provider, String? idToken)
        withOIDC,
  }) {
    return withOIDC(flowId, username, name, provider, idToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, String username, String name, String email,
            String? code)?
        withCode,
    TResult? Function(String flowId, String username, String name,
            String? provider, String? idToken)?
        withOIDC,
  }) {
    return withOIDC?.call(flowId, username, name, provider, idToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, String username, String name, String email,
            String? code)?
        withCode,
    TResult Function(String flowId, String username, String name,
            String? provider, String? idToken)?
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
    required TResult Function(RegistrationFlowDataWithCode value) withCode,
    required TResult Function(RegistrationFlowDataWithOIDC value) withOIDC,
  }) {
    return withOIDC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegistrationFlowDataWithCode value)? withCode,
    TResult? Function(RegistrationFlowDataWithOIDC value)? withOIDC,
  }) {
    return withOIDC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationFlowDataWithCode value)? withCode,
    TResult Function(RegistrationFlowDataWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(this);
    }
    return orElse();
  }
}

abstract class RegistrationFlowDataWithOIDC implements RegistrationFlowData {
  const factory RegistrationFlowDataWithOIDC(
      {required final String flowId,
      required final String username,
      required final String name,
      final String? provider,
      final String? idToken}) = _$RegistrationFlowDataWithOIDCImpl;

  @override
  String get flowId;
  @override
  String get username;
  @override
  String get name;
  String? get provider;
  String? get idToken;

  /// Create a copy of RegistrationFlowData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationFlowDataWithOIDCImplCopyWith<
          _$RegistrationFlowDataWithOIDCImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginFlowData {
  String get flowId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, String email, String? code)
        withCode,
    required TResult Function(String flowId, String? provider, String? idToken)
        withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, String email, String? code)? withCode,
    TResult? Function(String flowId, String? provider, String? idToken)?
        withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, String email, String? code)? withCode,
    TResult Function(String flowId, String? provider, String? idToken)?
        withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginFlowDataWithCode value) withCode,
    required TResult Function(LoginFlowDataWithOIDC value) withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginFlowDataWithCode value)? withCode,
    TResult? Function(LoginFlowDataWithOIDC value)? withOIDC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginFlowDataWithCode value)? withCode,
    TResult Function(LoginFlowDataWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of LoginFlowData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginFlowDataCopyWith<LoginFlowData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFlowDataCopyWith<$Res> {
  factory $LoginFlowDataCopyWith(
          LoginFlowData value, $Res Function(LoginFlowData) then) =
      _$LoginFlowDataCopyWithImpl<$Res, LoginFlowData>;
  @useResult
  $Res call({String flowId});
}

/// @nodoc
class _$LoginFlowDataCopyWithImpl<$Res, $Val extends LoginFlowData>
    implements $LoginFlowDataCopyWith<$Res> {
  _$LoginFlowDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginFlowData
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
abstract class _$$LoginFlowDataWithCodeImplCopyWith<$Res>
    implements $LoginFlowDataCopyWith<$Res> {
  factory _$$LoginFlowDataWithCodeImplCopyWith(
          _$LoginFlowDataWithCodeImpl value,
          $Res Function(_$LoginFlowDataWithCodeImpl) then) =
      __$$LoginFlowDataWithCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String flowId, String email, String? code});
}

/// @nodoc
class __$$LoginFlowDataWithCodeImplCopyWithImpl<$Res>
    extends _$LoginFlowDataCopyWithImpl<$Res, _$LoginFlowDataWithCodeImpl>
    implements _$$LoginFlowDataWithCodeImplCopyWith<$Res> {
  __$$LoginFlowDataWithCodeImplCopyWithImpl(_$LoginFlowDataWithCodeImpl _value,
      $Res Function(_$LoginFlowDataWithCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginFlowData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowId = null,
    Object? email = null,
    Object? code = freezed,
  }) {
    return _then(_$LoginFlowDataWithCodeImpl(
      flowId: null == flowId
          ? _value.flowId
          : flowId // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$LoginFlowDataWithCodeImpl implements LoginFlowDataWithCode {
  const _$LoginFlowDataWithCodeImpl(
      {required this.flowId, required this.email, this.code});

  @override
  final String flowId;
  @override
  final String email;
  @override
  final String? code;

  @override
  String toString() {
    return 'LoginFlowData.withCode(flowId: $flowId, email: $email, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginFlowDataWithCodeImpl &&
            (identical(other.flowId, flowId) || other.flowId == flowId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flowId, email, code);

  /// Create a copy of LoginFlowData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginFlowDataWithCodeImplCopyWith<_$LoginFlowDataWithCodeImpl>
      get copyWith => __$$LoginFlowDataWithCodeImplCopyWithImpl<
          _$LoginFlowDataWithCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, String email, String? code)
        withCode,
    required TResult Function(String flowId, String? provider, String? idToken)
        withOIDC,
  }) {
    return withCode(flowId, email, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, String email, String? code)? withCode,
    TResult? Function(String flowId, String? provider, String? idToken)?
        withOIDC,
  }) {
    return withCode?.call(flowId, email, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, String email, String? code)? withCode,
    TResult Function(String flowId, String? provider, String? idToken)?
        withOIDC,
    required TResult orElse(),
  }) {
    if (withCode != null) {
      return withCode(flowId, email, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginFlowDataWithCode value) withCode,
    required TResult Function(LoginFlowDataWithOIDC value) withOIDC,
  }) {
    return withCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginFlowDataWithCode value)? withCode,
    TResult? Function(LoginFlowDataWithOIDC value)? withOIDC,
  }) {
    return withCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginFlowDataWithCode value)? withCode,
    TResult Function(LoginFlowDataWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withCode != null) {
      return withCode(this);
    }
    return orElse();
  }
}

abstract class LoginFlowDataWithCode implements LoginFlowData {
  const factory LoginFlowDataWithCode(
      {required final String flowId,
      required final String email,
      final String? code}) = _$LoginFlowDataWithCodeImpl;

  @override
  String get flowId;
  String get email;
  String? get code;

  /// Create a copy of LoginFlowData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginFlowDataWithCodeImplCopyWith<_$LoginFlowDataWithCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginFlowDataWithOIDCImplCopyWith<$Res>
    implements $LoginFlowDataCopyWith<$Res> {
  factory _$$LoginFlowDataWithOIDCImplCopyWith(
          _$LoginFlowDataWithOIDCImpl value,
          $Res Function(_$LoginFlowDataWithOIDCImpl) then) =
      __$$LoginFlowDataWithOIDCImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String flowId, String? provider, String? idToken});
}

/// @nodoc
class __$$LoginFlowDataWithOIDCImplCopyWithImpl<$Res>
    extends _$LoginFlowDataCopyWithImpl<$Res, _$LoginFlowDataWithOIDCImpl>
    implements _$$LoginFlowDataWithOIDCImplCopyWith<$Res> {
  __$$LoginFlowDataWithOIDCImplCopyWithImpl(_$LoginFlowDataWithOIDCImpl _value,
      $Res Function(_$LoginFlowDataWithOIDCImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginFlowData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowId = null,
    Object? provider = freezed,
    Object? idToken = freezed,
  }) {
    return _then(_$LoginFlowDataWithOIDCImpl(
      flowId: null == flowId
          ? _value.flowId
          : flowId // ignore: cast_nullable_to_non_nullable
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

class _$LoginFlowDataWithOIDCImpl implements LoginFlowDataWithOIDC {
  const _$LoginFlowDataWithOIDCImpl(
      {required this.flowId, this.provider, this.idToken});

  @override
  final String flowId;
  @override
  final String? provider;
  @override
  final String? idToken;

  @override
  String toString() {
    return 'LoginFlowData.withOIDC(flowId: $flowId, provider: $provider, idToken: $idToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginFlowDataWithOIDCImpl &&
            (identical(other.flowId, flowId) || other.flowId == flowId) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flowId, provider, idToken);

  /// Create a copy of LoginFlowData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginFlowDataWithOIDCImplCopyWith<_$LoginFlowDataWithOIDCImpl>
      get copyWith => __$$LoginFlowDataWithOIDCImplCopyWithImpl<
          _$LoginFlowDataWithOIDCImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String flowId, String email, String? code)
        withCode,
    required TResult Function(String flowId, String? provider, String? idToken)
        withOIDC,
  }) {
    return withOIDC(flowId, provider, idToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String flowId, String email, String? code)? withCode,
    TResult? Function(String flowId, String? provider, String? idToken)?
        withOIDC,
  }) {
    return withOIDC?.call(flowId, provider, idToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String flowId, String email, String? code)? withCode,
    TResult Function(String flowId, String? provider, String? idToken)?
        withOIDC,
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
    required TResult Function(LoginFlowDataWithCode value) withCode,
    required TResult Function(LoginFlowDataWithOIDC value) withOIDC,
  }) {
    return withOIDC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginFlowDataWithCode value)? withCode,
    TResult? Function(LoginFlowDataWithOIDC value)? withOIDC,
  }) {
    return withOIDC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginFlowDataWithCode value)? withCode,
    TResult Function(LoginFlowDataWithOIDC value)? withOIDC,
    required TResult orElse(),
  }) {
    if (withOIDC != null) {
      return withOIDC(this);
    }
    return orElse();
  }
}

abstract class LoginFlowDataWithOIDC implements LoginFlowData {
  const factory LoginFlowDataWithOIDC(
      {required final String flowId,
      final String? provider,
      final String? idToken}) = _$LoginFlowDataWithOIDCImpl;

  @override
  String get flowId;
  String? get provider;
  String? get idToken;

  /// Create a copy of LoginFlowData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginFlowDataWithOIDCImplCopyWith<_$LoginFlowDataWithOIDCImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthenticationFlowState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(RegistrationFlowData data) registrationInProgress,
    required TResult Function(LoginFlowData data) loginInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(RegistrationFlowData data)? registrationInProgress,
    TResult? Function(LoginFlowData data)? loginInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(RegistrationFlowData data)? registrationInProgress,
    TResult Function(LoginFlowData data)? loginInProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_RegistrationInProgress value)
        registrationInProgress,
    required TResult Function(_LoginInProgress value) loginInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_RegistrationInProgress value)? registrationInProgress,
    TResult? Function(_LoginInProgress value)? loginInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_RegistrationInProgress value)? registrationInProgress,
    TResult Function(_LoginInProgress value)? loginInProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationFlowStateCopyWith<$Res> {
  factory $AuthenticationFlowStateCopyWith(AuthenticationFlowState value,
          $Res Function(AuthenticationFlowState) then) =
      _$AuthenticationFlowStateCopyWithImpl<$Res, AuthenticationFlowState>;
}

/// @nodoc
class _$AuthenticationFlowStateCopyWithImpl<$Res,
        $Val extends AuthenticationFlowState>
    implements $AuthenticationFlowStateCopyWith<$Res> {
  _$AuthenticationFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl value, $Res Function(_$IdleImpl) then) =
      __$$IdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$AuthenticationFlowStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IdleImpl implements _Idle {
  const _$IdleImpl();

  @override
  String toString() {
    return 'AuthenticationFlowState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(RegistrationFlowData data) registrationInProgress,
    required TResult Function(LoginFlowData data) loginInProgress,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(RegistrationFlowData data)? registrationInProgress,
    TResult? Function(LoginFlowData data)? loginInProgress,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(RegistrationFlowData data)? registrationInProgress,
    TResult Function(LoginFlowData data)? loginInProgress,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_RegistrationInProgress value)
        registrationInProgress,
    required TResult Function(_LoginInProgress value) loginInProgress,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_RegistrationInProgress value)? registrationInProgress,
    TResult? Function(_LoginInProgress value)? loginInProgress,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_RegistrationInProgress value)? registrationInProgress,
    TResult Function(_LoginInProgress value)? loginInProgress,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements AuthenticationFlowState {
  const factory _Idle() = _$IdleImpl;
}

/// @nodoc
abstract class _$$RegistrationInProgressImplCopyWith<$Res> {
  factory _$$RegistrationInProgressImplCopyWith(
          _$RegistrationInProgressImpl value,
          $Res Function(_$RegistrationInProgressImpl) then) =
      __$$RegistrationInProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RegistrationFlowData data});

  $RegistrationFlowDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$RegistrationInProgressImplCopyWithImpl<$Res>
    extends _$AuthenticationFlowStateCopyWithImpl<$Res,
        _$RegistrationInProgressImpl>
    implements _$$RegistrationInProgressImplCopyWith<$Res> {
  __$$RegistrationInProgressImplCopyWithImpl(
      _$RegistrationInProgressImpl _value,
      $Res Function(_$RegistrationInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$RegistrationInProgressImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RegistrationFlowData,
    ));
  }

  /// Create a copy of AuthenticationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RegistrationFlowDataCopyWith<$Res> get data {
    return $RegistrationFlowDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$RegistrationInProgressImpl implements _RegistrationInProgress {
  const _$RegistrationInProgressImpl(this.data);

  @override
  final RegistrationFlowData data;

  @override
  String toString() {
    return 'AuthenticationFlowState.registrationInProgress(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationInProgressImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of AuthenticationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationInProgressImplCopyWith<_$RegistrationInProgressImpl>
      get copyWith => __$$RegistrationInProgressImplCopyWithImpl<
          _$RegistrationInProgressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(RegistrationFlowData data) registrationInProgress,
    required TResult Function(LoginFlowData data) loginInProgress,
  }) {
    return registrationInProgress(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(RegistrationFlowData data)? registrationInProgress,
    TResult? Function(LoginFlowData data)? loginInProgress,
  }) {
    return registrationInProgress?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(RegistrationFlowData data)? registrationInProgress,
    TResult Function(LoginFlowData data)? loginInProgress,
    required TResult orElse(),
  }) {
    if (registrationInProgress != null) {
      return registrationInProgress(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_RegistrationInProgress value)
        registrationInProgress,
    required TResult Function(_LoginInProgress value) loginInProgress,
  }) {
    return registrationInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_RegistrationInProgress value)? registrationInProgress,
    TResult? Function(_LoginInProgress value)? loginInProgress,
  }) {
    return registrationInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_RegistrationInProgress value)? registrationInProgress,
    TResult Function(_LoginInProgress value)? loginInProgress,
    required TResult orElse(),
  }) {
    if (registrationInProgress != null) {
      return registrationInProgress(this);
    }
    return orElse();
  }
}

abstract class _RegistrationInProgress implements AuthenticationFlowState {
  const factory _RegistrationInProgress(final RegistrationFlowData data) =
      _$RegistrationInProgressImpl;

  RegistrationFlowData get data;

  /// Create a copy of AuthenticationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationInProgressImplCopyWith<_$RegistrationInProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginInProgressImplCopyWith<$Res> {
  factory _$$LoginInProgressImplCopyWith(_$LoginInProgressImpl value,
          $Res Function(_$LoginInProgressImpl) then) =
      __$$LoginInProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginFlowData data});

  $LoginFlowDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$LoginInProgressImplCopyWithImpl<$Res>
    extends _$AuthenticationFlowStateCopyWithImpl<$Res, _$LoginInProgressImpl>
    implements _$$LoginInProgressImplCopyWith<$Res> {
  __$$LoginInProgressImplCopyWithImpl(
      _$LoginInProgressImpl _value, $Res Function(_$LoginInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoginInProgressImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoginFlowData,
    ));
  }

  /// Create a copy of AuthenticationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginFlowDataCopyWith<$Res> get data {
    return $LoginFlowDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$LoginInProgressImpl implements _LoginInProgress {
  const _$LoginInProgressImpl(this.data);

  @override
  final LoginFlowData data;

  @override
  String toString() {
    return 'AuthenticationFlowState.loginInProgress(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginInProgressImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of AuthenticationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginInProgressImplCopyWith<_$LoginInProgressImpl> get copyWith =>
      __$$LoginInProgressImplCopyWithImpl<_$LoginInProgressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(RegistrationFlowData data) registrationInProgress,
    required TResult Function(LoginFlowData data) loginInProgress,
  }) {
    return loginInProgress(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(RegistrationFlowData data)? registrationInProgress,
    TResult? Function(LoginFlowData data)? loginInProgress,
  }) {
    return loginInProgress?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(RegistrationFlowData data)? registrationInProgress,
    TResult Function(LoginFlowData data)? loginInProgress,
    required TResult orElse(),
  }) {
    if (loginInProgress != null) {
      return loginInProgress(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_RegistrationInProgress value)
        registrationInProgress,
    required TResult Function(_LoginInProgress value) loginInProgress,
  }) {
    return loginInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_RegistrationInProgress value)? registrationInProgress,
    TResult? Function(_LoginInProgress value)? loginInProgress,
  }) {
    return loginInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_RegistrationInProgress value)? registrationInProgress,
    TResult Function(_LoginInProgress value)? loginInProgress,
    required TResult orElse(),
  }) {
    if (loginInProgress != null) {
      return loginInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoginInProgress implements AuthenticationFlowState {
  const factory _LoginInProgress(final LoginFlowData data) =
      _$LoginInProgressImpl;

  LoginFlowData get data;

  /// Create a copy of AuthenticationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginInProgressImplCopyWith<_$LoginInProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
