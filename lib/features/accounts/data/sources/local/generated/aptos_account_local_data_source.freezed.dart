// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../aptos_account_local_data_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoreAptosAccountParams {
  Uint8List get accountAddress => throw _privateConstructorUsedError;
  Uint8List get authenticationKey => throw _privateConstructorUsedError;
  int get publicKeyId => throw _privateConstructorUsedError;

  /// Create a copy of StoreAptosAccountParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreAptosAccountParamsCopyWith<StoreAptosAccountParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreAptosAccountParamsCopyWith<$Res> {
  factory $StoreAptosAccountParamsCopyWith(StoreAptosAccountParams value,
          $Res Function(StoreAptosAccountParams) then) =
      _$StoreAptosAccountParamsCopyWithImpl<$Res, StoreAptosAccountParams>;
  @useResult
  $Res call(
      {Uint8List accountAddress, Uint8List authenticationKey, int publicKeyId});
}

/// @nodoc
class _$StoreAptosAccountParamsCopyWithImpl<$Res,
        $Val extends StoreAptosAccountParams>
    implements $StoreAptosAccountParamsCopyWith<$Res> {
  _$StoreAptosAccountParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreAptosAccountParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountAddress = null,
    Object? authenticationKey = null,
    Object? publicKeyId = null,
  }) {
    return _then(_value.copyWith(
      accountAddress: null == accountAddress
          ? _value.accountAddress
          : accountAddress // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      authenticationKey: null == authenticationKey
          ? _value.authenticationKey
          : authenticationKey // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      publicKeyId: null == publicKeyId
          ? _value.publicKeyId
          : publicKeyId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Ed25519AptosAccountParamsImplCopyWith<$Res>
    implements $StoreAptosAccountParamsCopyWith<$Res> {
  factory _$$Ed25519AptosAccountParamsImplCopyWith(
          _$Ed25519AptosAccountParamsImpl value,
          $Res Function(_$Ed25519AptosAccountParamsImpl) then) =
      __$$Ed25519AptosAccountParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Uint8List accountAddress, Uint8List authenticationKey, int publicKeyId});
}

/// @nodoc
class __$$Ed25519AptosAccountParamsImplCopyWithImpl<$Res>
    extends _$StoreAptosAccountParamsCopyWithImpl<$Res,
        _$Ed25519AptosAccountParamsImpl>
    implements _$$Ed25519AptosAccountParamsImplCopyWith<$Res> {
  __$$Ed25519AptosAccountParamsImplCopyWithImpl(
      _$Ed25519AptosAccountParamsImpl _value,
      $Res Function(_$Ed25519AptosAccountParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreAptosAccountParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountAddress = null,
    Object? authenticationKey = null,
    Object? publicKeyId = null,
  }) {
    return _then(_$Ed25519AptosAccountParamsImpl(
      accountAddress: null == accountAddress
          ? _value.accountAddress
          : accountAddress // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      authenticationKey: null == authenticationKey
          ? _value.authenticationKey
          : authenticationKey // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      publicKeyId: null == publicKeyId
          ? _value.publicKeyId
          : publicKeyId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Ed25519AptosAccountParamsImpl implements Ed25519AptosAccountParams {
  const _$Ed25519AptosAccountParamsImpl(
      {required this.accountAddress,
      required this.authenticationKey,
      required this.publicKeyId});

  @override
  final Uint8List accountAddress;
  @override
  final Uint8List authenticationKey;
  @override
  final int publicKeyId;

  @override
  String toString() {
    return 'StoreAptosAccountParams.withEd25519Config(accountAddress: $accountAddress, authenticationKey: $authenticationKey, publicKeyId: $publicKeyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Ed25519AptosAccountParamsImpl &&
            const DeepCollectionEquality()
                .equals(other.accountAddress, accountAddress) &&
            const DeepCollectionEquality()
                .equals(other.authenticationKey, authenticationKey) &&
            (identical(other.publicKeyId, publicKeyId) ||
                other.publicKeyId == publicKeyId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(accountAddress),
      const DeepCollectionEquality().hash(authenticationKey),
      publicKeyId);

  /// Create a copy of StoreAptosAccountParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Ed25519AptosAccountParamsImplCopyWith<_$Ed25519AptosAccountParamsImpl>
      get copyWith => __$$Ed25519AptosAccountParamsImplCopyWithImpl<
          _$Ed25519AptosAccountParamsImpl>(this, _$identity);
}

abstract class Ed25519AptosAccountParams implements StoreAptosAccountParams {
  const factory Ed25519AptosAccountParams(
      {required final Uint8List accountAddress,
      required final Uint8List authenticationKey,
      required final int publicKeyId}) = _$Ed25519AptosAccountParamsImpl;

  @override
  Uint8List get accountAddress;
  @override
  Uint8List get authenticationKey;
  @override
  int get publicKeyId;

  /// Create a copy of StoreAptosAccountParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Ed25519AptosAccountParamsImplCopyWith<_$Ed25519AptosAccountParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
