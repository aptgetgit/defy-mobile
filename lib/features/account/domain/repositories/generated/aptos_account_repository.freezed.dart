// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../aptos_account_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthenticatorConfig {
  Uint8List get keyId => throw _privateConstructorUsedError;

  /// Create a copy of AuthenticatorConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthenticatorConfigCopyWith<AuthenticatorConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticatorConfigCopyWith<$Res> {
  factory $AuthenticatorConfigCopyWith(
          AuthenticatorConfig value, $Res Function(AuthenticatorConfig) then) =
      _$AuthenticatorConfigCopyWithImpl<$Res, AuthenticatorConfig>;
  @useResult
  $Res call({Uint8List keyId});
}

/// @nodoc
class _$AuthenticatorConfigCopyWithImpl<$Res, $Val extends AuthenticatorConfig>
    implements $AuthenticatorConfigCopyWith<$Res> {
  _$AuthenticatorConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticatorConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyId = null,
  }) {
    return _then(_value.copyWith(
      keyId: null == keyId
          ? _value.keyId
          : keyId // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Ed25519AuthenticatorConfigImplCopyWith<$Res>
    implements $AuthenticatorConfigCopyWith<$Res> {
  factory _$$Ed25519AuthenticatorConfigImplCopyWith(
          _$Ed25519AuthenticatorConfigImpl value,
          $Res Function(_$Ed25519AuthenticatorConfigImpl) then) =
      __$$Ed25519AuthenticatorConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uint8List keyId});
}

/// @nodoc
class __$$Ed25519AuthenticatorConfigImplCopyWithImpl<$Res>
    extends _$AuthenticatorConfigCopyWithImpl<$Res,
        _$Ed25519AuthenticatorConfigImpl>
    implements _$$Ed25519AuthenticatorConfigImplCopyWith<$Res> {
  __$$Ed25519AuthenticatorConfigImplCopyWithImpl(
      _$Ed25519AuthenticatorConfigImpl _value,
      $Res Function(_$Ed25519AuthenticatorConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticatorConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyId = null,
  }) {
    return _then(_$Ed25519AuthenticatorConfigImpl(
      keyId: null == keyId
          ? _value.keyId
          : keyId // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$Ed25519AuthenticatorConfigImpl extends Ed25519AuthenticatorConfig {
  const _$Ed25519AuthenticatorConfigImpl({required this.keyId}) : super._();

  @override
  final Uint8List keyId;

  @override
  String toString() {
    return 'AuthenticatorConfig.ed25519(keyId: $keyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Ed25519AuthenticatorConfigImpl &&
            const DeepCollectionEquality().equals(other.keyId, keyId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(keyId));

  /// Create a copy of AuthenticatorConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Ed25519AuthenticatorConfigImplCopyWith<_$Ed25519AuthenticatorConfigImpl>
      get copyWith => __$$Ed25519AuthenticatorConfigImplCopyWithImpl<
          _$Ed25519AuthenticatorConfigImpl>(this, _$identity);
}

abstract class Ed25519AuthenticatorConfig extends AuthenticatorConfig {
  const factory Ed25519AuthenticatorConfig({required final Uint8List keyId}) =
      _$Ed25519AuthenticatorConfigImpl;
  const Ed25519AuthenticatorConfig._() : super._();

  @override
  Uint8List get keyId;

  /// Create a copy of AuthenticatorConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Ed25519AuthenticatorConfigImplCopyWith<_$Ed25519AuthenticatorConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}
