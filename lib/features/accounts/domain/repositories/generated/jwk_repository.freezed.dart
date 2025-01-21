// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../jwk_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KeySourceConfig {}

/// @nodoc
abstract class $KeySourceConfigCopyWith<$Res> {
  factory $KeySourceConfigCopyWith(
          KeySourceConfig value, $Res Function(KeySourceConfig) then) =
      _$KeySourceConfigCopyWithImpl<$Res, KeySourceConfig>;
}

/// @nodoc
class _$KeySourceConfigCopyWithImpl<$Res, $Val extends KeySourceConfig>
    implements $KeySourceConfigCopyWith<$Res> {
  _$KeySourceConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KeySourceConfig
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HdKeySourceConfigImplCopyWith<$Res> {
  factory _$$HdKeySourceConfigImplCopyWith(_$HdKeySourceConfigImpl value,
          $Res Function(_$HdKeySourceConfigImpl) then) =
      __$$HdKeySourceConfigImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List entropyHash, AptosDerivationPath derivationPath});
}

/// @nodoc
class __$$HdKeySourceConfigImplCopyWithImpl<$Res>
    extends _$KeySourceConfigCopyWithImpl<$Res, _$HdKeySourceConfigImpl>
    implements _$$HdKeySourceConfigImplCopyWith<$Res> {
  __$$HdKeySourceConfigImplCopyWithImpl(_$HdKeySourceConfigImpl _value,
      $Res Function(_$HdKeySourceConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entropyHash = null,
    Object? derivationPath = null,
  }) {
    return _then(_$HdKeySourceConfigImpl(
      entropyHash: null == entropyHash
          ? _value.entropyHash
          : entropyHash // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      derivationPath: null == derivationPath
          ? _value.derivationPath
          : derivationPath // ignore: cast_nullable_to_non_nullable
              as AptosDerivationPath,
    ));
  }
}

/// @nodoc

class _$HdKeySourceConfigImpl implements HdKeySourceConfig {
  const _$HdKeySourceConfigImpl(
      {required this.entropyHash, required this.derivationPath});

  @override
  final Uint8List entropyHash;
  @override
  final AptosDerivationPath derivationPath;

  @override
  String toString() {
    return 'KeySourceConfig.fromHdKey(entropyHash: $entropyHash, derivationPath: $derivationPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HdKeySourceConfigImpl &&
            const DeepCollectionEquality()
                .equals(other.entropyHash, entropyHash) &&
            (identical(other.derivationPath, derivationPath) ||
                other.derivationPath == derivationPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(entropyHash), derivationPath);

  /// Create a copy of KeySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HdKeySourceConfigImplCopyWith<_$HdKeySourceConfigImpl> get copyWith =>
      __$$HdKeySourceConfigImplCopyWithImpl<_$HdKeySourceConfigImpl>(
          this, _$identity);
}

abstract class HdKeySourceConfig implements KeySourceConfig {
  const factory HdKeySourceConfig(
          {required final Uint8List entropyHash,
          required final AptosDerivationPath derivationPath}) =
      _$HdKeySourceConfigImpl;

  Uint8List get entropyHash;
  AptosDerivationPath get derivationPath;

  /// Create a copy of KeySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HdKeySourceConfigImplCopyWith<_$HdKeySourceConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SigningKeySourceConfigImplCopyWith<$Res> {
  factory _$$SigningKeySourceConfigImplCopyWith(
          _$SigningKeySourceConfigImpl value,
          $Res Function(_$SigningKeySourceConfigImpl) then) =
      __$$SigningKeySourceConfigImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List jwkThumbprint});
}

/// @nodoc
class __$$SigningKeySourceConfigImplCopyWithImpl<$Res>
    extends _$KeySourceConfigCopyWithImpl<$Res, _$SigningKeySourceConfigImpl>
    implements _$$SigningKeySourceConfigImplCopyWith<$Res> {
  __$$SigningKeySourceConfigImplCopyWithImpl(
      _$SigningKeySourceConfigImpl _value,
      $Res Function(_$SigningKeySourceConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jwkThumbprint = null,
  }) {
    return _then(_$SigningKeySourceConfigImpl(
      jwkThumbprint: null == jwkThumbprint
          ? _value.jwkThumbprint
          : jwkThumbprint // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$SigningKeySourceConfigImpl implements SigningKeySourceConfig {
  const _$SigningKeySourceConfigImpl({required this.jwkThumbprint});

  @override
  final Uint8List jwkThumbprint;

  @override
  String toString() {
    return 'KeySourceConfig.fromSigningKey(jwkThumbprint: $jwkThumbprint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigningKeySourceConfigImpl &&
            const DeepCollectionEquality()
                .equals(other.jwkThumbprint, jwkThumbprint));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(jwkThumbprint));

  /// Create a copy of KeySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SigningKeySourceConfigImplCopyWith<_$SigningKeySourceConfigImpl>
      get copyWith => __$$SigningKeySourceConfigImplCopyWithImpl<
          _$SigningKeySourceConfigImpl>(this, _$identity);
}

abstract class SigningKeySourceConfig implements KeySourceConfig {
  const factory SigningKeySourceConfig(
      {required final Uint8List jwkThumbprint}) = _$SigningKeySourceConfigImpl;

  Uint8List get jwkThumbprint;

  /// Create a copy of KeySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SigningKeySourceConfigImplCopyWith<_$SigningKeySourceConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}
