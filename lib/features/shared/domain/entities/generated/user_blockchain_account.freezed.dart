// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_blockchain_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserBlockchainAccount _$UserBlockchainAccountFromJson(
    Map<String, dynamic> json) {
  return _UserBlockchainAccount.fromJson(json);
}

/// @nodoc
mixin _$UserBlockchainAccount {
  String get id => throw _privateConstructorUsedError;
  String get accountAddress => throw _privateConstructorUsedError;
  String get blockchainNetworkId => throw _privateConstructorUsedError;

  /// Create a copy of UserBlockchainAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBlockchainAccountCopyWith<UserBlockchainAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBlockchainAccountCopyWith<$Res> {
  factory $UserBlockchainAccountCopyWith(UserBlockchainAccount value,
          $Res Function(UserBlockchainAccount) then) =
      _$UserBlockchainAccountCopyWithImpl<$Res, UserBlockchainAccount>;
  @useResult
  $Res call({String id, String accountAddress, String blockchainNetworkId});
}

/// @nodoc
class _$UserBlockchainAccountCopyWithImpl<$Res,
        $Val extends UserBlockchainAccount>
    implements $UserBlockchainAccountCopyWith<$Res> {
  _$UserBlockchainAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBlockchainAccount
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
abstract class _$$UserBlockchainAccountImplCopyWith<$Res>
    implements $UserBlockchainAccountCopyWith<$Res> {
  factory _$$UserBlockchainAccountImplCopyWith(
          _$UserBlockchainAccountImpl value,
          $Res Function(_$UserBlockchainAccountImpl) then) =
      __$$UserBlockchainAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String accountAddress, String blockchainNetworkId});
}

/// @nodoc
class __$$UserBlockchainAccountImplCopyWithImpl<$Res>
    extends _$UserBlockchainAccountCopyWithImpl<$Res,
        _$UserBlockchainAccountImpl>
    implements _$$UserBlockchainAccountImplCopyWith<$Res> {
  __$$UserBlockchainAccountImplCopyWithImpl(_$UserBlockchainAccountImpl _value,
      $Res Function(_$UserBlockchainAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBlockchainAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountAddress = null,
    Object? blockchainNetworkId = null,
  }) {
    return _then(_$UserBlockchainAccountImpl(
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
@JsonSerializable(createToJson: false)
class _$UserBlockchainAccountImpl extends _UserBlockchainAccount {
  const _$UserBlockchainAccountImpl(
      {required this.id,
      required this.accountAddress,
      required this.blockchainNetworkId})
      : super._();

  factory _$UserBlockchainAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBlockchainAccountImplFromJson(json);

  @override
  final String id;
  @override
  final String accountAddress;
  @override
  final String blockchainNetworkId;

  @override
  String toString() {
    return 'UserBlockchainAccount(id: $id, accountAddress: $accountAddress, blockchainNetworkId: $blockchainNetworkId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBlockchainAccountImpl &&
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

  /// Create a copy of UserBlockchainAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBlockchainAccountImplCopyWith<_$UserBlockchainAccountImpl>
      get copyWith => __$$UserBlockchainAccountImplCopyWithImpl<
          _$UserBlockchainAccountImpl>(this, _$identity);
}

abstract class _UserBlockchainAccount extends UserBlockchainAccount {
  const factory _UserBlockchainAccount(
      {required final String id,
      required final String accountAddress,
      required final String blockchainNetworkId}) = _$UserBlockchainAccountImpl;
  const _UserBlockchainAccount._() : super._();

  factory _UserBlockchainAccount.fromJson(Map<String, dynamic> json) =
      _$UserBlockchainAccountImpl.fromJson;

  @override
  String get id;
  @override
  String get accountAddress;
  @override
  String get blockchainNetworkId;

  /// Create a copy of UserBlockchainAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBlockchainAccountImplCopyWith<_$UserBlockchainAccountImpl>
      get copyWith => throw _privateConstructorUsedError;
}
