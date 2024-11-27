// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../blockchain_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlockchainAccount _$BlockchainAccountFromJson(Map<String, dynamic> json) {
  return _BlockchainAccount.fromJson(json);
}

/// @nodoc
mixin _$BlockchainAccount {
  String get id => throw _privateConstructorUsedError;
  String get accountAddress => throw _privateConstructorUsedError;
  String get blockchainNetworkId => throw _privateConstructorUsedError;

  /// Serializes this BlockchainAccount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BlockchainAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlockchainAccountCopyWith<BlockchainAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockchainAccountCopyWith<$Res> {
  factory $BlockchainAccountCopyWith(
          BlockchainAccount value, $Res Function(BlockchainAccount) then) =
      _$BlockchainAccountCopyWithImpl<$Res, BlockchainAccount>;
  @useResult
  $Res call({String id, String accountAddress, String blockchainNetworkId});
}

/// @nodoc
class _$BlockchainAccountCopyWithImpl<$Res, $Val extends BlockchainAccount>
    implements $BlockchainAccountCopyWith<$Res> {
  _$BlockchainAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlockchainAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountAddress = null,
    Object? blockchainNetworkId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountAddress: null == accountAddress
          ? _value.accountAddress
          : accountAddress // ignore: cast_nullable_to_non_nullable
              as String,
      blockchainNetworkId: null == blockchainNetworkId
          ? _value.blockchainNetworkId
          : blockchainNetworkId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockchainAccountImplCopyWith<$Res>
    implements $BlockchainAccountCopyWith<$Res> {
  factory _$$BlockchainAccountImplCopyWith(_$BlockchainAccountImpl value,
          $Res Function(_$BlockchainAccountImpl) then) =
      __$$BlockchainAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String accountAddress, String blockchainNetworkId});
}

/// @nodoc
class __$$BlockchainAccountImplCopyWithImpl<$Res>
    extends _$BlockchainAccountCopyWithImpl<$Res, _$BlockchainAccountImpl>
    implements _$$BlockchainAccountImplCopyWith<$Res> {
  __$$BlockchainAccountImplCopyWithImpl(_$BlockchainAccountImpl _value,
      $Res Function(_$BlockchainAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlockchainAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountAddress = null,
    Object? blockchainNetworkId = null,
  }) {
    return _then(_$BlockchainAccountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountAddress: null == accountAddress
          ? _value.accountAddress
          : accountAddress // ignore: cast_nullable_to_non_nullable
              as String,
      blockchainNetworkId: null == blockchainNetworkId
          ? _value.blockchainNetworkId
          : blockchainNetworkId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockchainAccountImpl extends _BlockchainAccount {
  const _$BlockchainAccountImpl(
      {required this.id,
      required this.accountAddress,
      required this.blockchainNetworkId})
      : super._();

  factory _$BlockchainAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockchainAccountImplFromJson(json);

  @override
  final String id;
  @override
  final String accountAddress;
  @override
  final String blockchainNetworkId;

  @override
  String toString() {
    return 'BlockchainAccount(id: $id, accountAddress: $accountAddress, blockchainNetworkId: $blockchainNetworkId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockchainAccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountAddress, accountAddress) ||
                other.accountAddress == accountAddress) &&
            (identical(other.blockchainNetworkId, blockchainNetworkId) ||
                other.blockchainNetworkId == blockchainNetworkId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, accountAddress, blockchainNetworkId);

  /// Create a copy of BlockchainAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockchainAccountImplCopyWith<_$BlockchainAccountImpl> get copyWith =>
      __$$BlockchainAccountImplCopyWithImpl<_$BlockchainAccountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockchainAccountImplToJson(
      this,
    );
  }
}

abstract class _BlockchainAccount extends BlockchainAccount {
  const factory _BlockchainAccount(
      {required final String id,
      required final String accountAddress,
      required final String blockchainNetworkId}) = _$BlockchainAccountImpl;
  const _BlockchainAccount._() : super._();

  factory _BlockchainAccount.fromJson(Map<String, dynamic> json) =
      _$BlockchainAccountImpl.fromJson;

  @override
  String get id;
  @override
  String get accountAddress;
  @override
  String get blockchainNetworkId;

  /// Create a copy of BlockchainAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlockchainAccountImplCopyWith<_$BlockchainAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
