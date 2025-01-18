// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../public_key_local_data_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StorePublicKeyParams {
  Jwk get publicKey => throw _privateConstructorUsedError;

  /// Create a copy of StorePublicKeyParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StorePublicKeyParamsCopyWith<StorePublicKeyParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorePublicKeyParamsCopyWith<$Res> {
  factory $StorePublicKeyParamsCopyWith(StorePublicKeyParams value,
          $Res Function(StorePublicKeyParams) then) =
      _$StorePublicKeyParamsCopyWithImpl<$Res, StorePublicKeyParams>;
  @useResult
  $Res call({Jwk publicKey});
}

/// @nodoc
class _$StorePublicKeyParamsCopyWithImpl<$Res,
        $Val extends StorePublicKeyParams>
    implements $StorePublicKeyParamsCopyWith<$Res> {
  _$StorePublicKeyParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StorePublicKeyParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicKey = null,
  }) {
    return _then(_value.copyWith(
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as Jwk,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HDKeyPublicKeyParamsImplCopyWith<$Res>
    implements $StorePublicKeyParamsCopyWith<$Res> {
  factory _$$HDKeyPublicKeyParamsImplCopyWith(_$HDKeyPublicKeyParamsImpl value,
          $Res Function(_$HDKeyPublicKeyParamsImpl) then) =
      __$$HDKeyPublicKeyParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Jwk publicKey, Uint8List entropyHash, Uint8List derivationPath});
}

/// @nodoc
class __$$HDKeyPublicKeyParamsImplCopyWithImpl<$Res>
    extends _$StorePublicKeyParamsCopyWithImpl<$Res, _$HDKeyPublicKeyParamsImpl>
    implements _$$HDKeyPublicKeyParamsImplCopyWith<$Res> {
  __$$HDKeyPublicKeyParamsImplCopyWithImpl(_$HDKeyPublicKeyParamsImpl _value,
      $Res Function(_$HDKeyPublicKeyParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StorePublicKeyParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicKey = null,
    Object? entropyHash = null,
    Object? derivationPath = null,
  }) {
    return _then(_$HDKeyPublicKeyParamsImpl(
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as Jwk,
      entropyHash: null == entropyHash
          ? _value.entropyHash
          : entropyHash // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      derivationPath: null == derivationPath
          ? _value.derivationPath
          : derivationPath // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$HDKeyPublicKeyParamsImpl implements HDKeyPublicKeyParams {
  const _$HDKeyPublicKeyParamsImpl(
      {required this.publicKey,
      required this.entropyHash,
      required this.derivationPath});

  @override
  final Jwk publicKey;
  @override
  final Uint8List entropyHash;
  @override
  final Uint8List derivationPath;

  @override
  String toString() {
    return 'StorePublicKeyParams.fromHDKey(publicKey: $publicKey, entropyHash: $entropyHash, derivationPath: $derivationPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HDKeyPublicKeyParamsImpl &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey) &&
            const DeepCollectionEquality()
                .equals(other.entropyHash, entropyHash) &&
            const DeepCollectionEquality()
                .equals(other.derivationPath, derivationPath));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      publicKey,
      const DeepCollectionEquality().hash(entropyHash),
      const DeepCollectionEquality().hash(derivationPath));

  /// Create a copy of StorePublicKeyParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HDKeyPublicKeyParamsImplCopyWith<_$HDKeyPublicKeyParamsImpl>
      get copyWith =>
          __$$HDKeyPublicKeyParamsImplCopyWithImpl<_$HDKeyPublicKeyParamsImpl>(
              this, _$identity);
}

abstract class HDKeyPublicKeyParams implements StorePublicKeyParams {
  const factory HDKeyPublicKeyParams(
      {required final Jwk publicKey,
      required final Uint8List entropyHash,
      required final Uint8List derivationPath}) = _$HDKeyPublicKeyParamsImpl;

  @override
  Jwk get publicKey;
  Uint8List get entropyHash;
  Uint8List get derivationPath;

  /// Create a copy of StorePublicKeyParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HDKeyPublicKeyParamsImplCopyWith<_$HDKeyPublicKeyParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PrivateKeyPublicKeyParamsImplCopyWith<$Res>
    implements $StorePublicKeyParamsCopyWith<$Res> {
  factory _$$PrivateKeyPublicKeyParamsImplCopyWith(
          _$PrivateKeyPublicKeyParamsImpl value,
          $Res Function(_$PrivateKeyPublicKeyParamsImpl) then) =
      __$$PrivateKeyPublicKeyParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Jwk publicKey, Uint8List jwkThumbprint});
}

/// @nodoc
class __$$PrivateKeyPublicKeyParamsImplCopyWithImpl<$Res>
    extends _$StorePublicKeyParamsCopyWithImpl<$Res,
        _$PrivateKeyPublicKeyParamsImpl>
    implements _$$PrivateKeyPublicKeyParamsImplCopyWith<$Res> {
  __$$PrivateKeyPublicKeyParamsImplCopyWithImpl(
      _$PrivateKeyPublicKeyParamsImpl _value,
      $Res Function(_$PrivateKeyPublicKeyParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StorePublicKeyParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicKey = null,
    Object? jwkThumbprint = null,
  }) {
    return _then(_$PrivateKeyPublicKeyParamsImpl(
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as Jwk,
      jwkThumbprint: null == jwkThumbprint
          ? _value.jwkThumbprint
          : jwkThumbprint // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$PrivateKeyPublicKeyParamsImpl implements PrivateKeyPublicKeyParams {
  const _$PrivateKeyPublicKeyParamsImpl(
      {required this.publicKey, required this.jwkThumbprint});

  @override
  final Jwk publicKey;
  @override
  final Uint8List jwkThumbprint;

  @override
  String toString() {
    return 'StorePublicKeyParams.fromPrivateKey(publicKey: $publicKey, jwkThumbprint: $jwkThumbprint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivateKeyPublicKeyParamsImpl &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey) &&
            const DeepCollectionEquality()
                .equals(other.jwkThumbprint, jwkThumbprint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, publicKey,
      const DeepCollectionEquality().hash(jwkThumbprint));

  /// Create a copy of StorePublicKeyParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivateKeyPublicKeyParamsImplCopyWith<_$PrivateKeyPublicKeyParamsImpl>
      get copyWith => __$$PrivateKeyPublicKeyParamsImplCopyWithImpl<
          _$PrivateKeyPublicKeyParamsImpl>(this, _$identity);
}

abstract class PrivateKeyPublicKeyParams implements StorePublicKeyParams {
  const factory PrivateKeyPublicKeyParams(
          {required final Jwk publicKey,
          required final Uint8List jwkThumbprint}) =
      _$PrivateKeyPublicKeyParamsImpl;

  @override
  Jwk get publicKey;
  Uint8List get jwkThumbprint;

  /// Create a copy of StorePublicKeyParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivateKeyPublicKeyParamsImplCopyWith<_$PrivateKeyPublicKeyParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
