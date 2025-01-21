// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../aptos_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AptosAccount {
  AccountAddress get accountAddress => throw _privateConstructorUsedError;
  AuthenticationKey get authenticationKey => throw _privateConstructorUsedError;

  /// Create a copy of AptosAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AptosAccountCopyWith<AptosAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AptosAccountCopyWith<$Res> {
  factory $AptosAccountCopyWith(
          AptosAccount value, $Res Function(AptosAccount) then) =
      _$AptosAccountCopyWithImpl<$Res, AptosAccount>;
  @useResult
  $Res call(
      {AccountAddress accountAddress, AuthenticationKey authenticationKey});

  $AccountAddressCopyWith<$Res> get accountAddress;
  $AuthenticationKeyCopyWith<$Res> get authenticationKey;
}

/// @nodoc
class _$AptosAccountCopyWithImpl<$Res, $Val extends AptosAccount>
    implements $AptosAccountCopyWith<$Res> {
  _$AptosAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AptosAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountAddress = null,
    Object? authenticationKey = null,
  }) {
    return _then(_value.copyWith(
      accountAddress: null == accountAddress
          ? _value.accountAddress
          : accountAddress // ignore: cast_nullable_to_non_nullable
              as AccountAddress,
      authenticationKey: null == authenticationKey
          ? _value.authenticationKey
          : authenticationKey // ignore: cast_nullable_to_non_nullable
              as AuthenticationKey,
    ) as $Val);
  }

  /// Create a copy of AptosAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountAddressCopyWith<$Res> get accountAddress {
    return $AccountAddressCopyWith<$Res>(_value.accountAddress, (value) {
      return _then(_value.copyWith(accountAddress: value) as $Val);
    });
  }

  /// Create a copy of AptosAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthenticationKeyCopyWith<$Res> get authenticationKey {
    return $AuthenticationKeyCopyWith<$Res>(_value.authenticationKey, (value) {
      return _then(_value.copyWith(authenticationKey: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AptosAccountImplCopyWith<$Res>
    implements $AptosAccountCopyWith<$Res> {
  factory _$$AptosAccountImplCopyWith(
          _$AptosAccountImpl value, $Res Function(_$AptosAccountImpl) then) =
      __$$AptosAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AccountAddress accountAddress, AuthenticationKey authenticationKey});

  @override
  $AccountAddressCopyWith<$Res> get accountAddress;
  @override
  $AuthenticationKeyCopyWith<$Res> get authenticationKey;
}

/// @nodoc
class __$$AptosAccountImplCopyWithImpl<$Res>
    extends _$AptosAccountCopyWithImpl<$Res, _$AptosAccountImpl>
    implements _$$AptosAccountImplCopyWith<$Res> {
  __$$AptosAccountImplCopyWithImpl(
      _$AptosAccountImpl _value, $Res Function(_$AptosAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of AptosAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountAddress = null,
    Object? authenticationKey = null,
  }) {
    return _then(_$AptosAccountImpl(
      accountAddress: null == accountAddress
          ? _value.accountAddress
          : accountAddress // ignore: cast_nullable_to_non_nullable
              as AccountAddress,
      authenticationKey: null == authenticationKey
          ? _value.authenticationKey
          : authenticationKey // ignore: cast_nullable_to_non_nullable
              as AuthenticationKey,
    ));
  }
}

/// @nodoc

class _$AptosAccountImpl extends _AptosAccount {
  const _$AptosAccountImpl(
      {required this.accountAddress, required this.authenticationKey})
      : super._();

  @override
  final AccountAddress accountAddress;
  @override
  final AuthenticationKey authenticationKey;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AptosAccountImpl &&
            (identical(other.accountAddress, accountAddress) ||
                other.accountAddress == accountAddress) &&
            (identical(other.authenticationKey, authenticationKey) ||
                other.authenticationKey == authenticationKey));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accountAddress, authenticationKey);

  /// Create a copy of AptosAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AptosAccountImplCopyWith<_$AptosAccountImpl> get copyWith =>
      __$$AptosAccountImplCopyWithImpl<_$AptosAccountImpl>(this, _$identity);
}

abstract class _AptosAccount extends AptosAccount {
  const factory _AptosAccount(
      {required final AccountAddress accountAddress,
      required final AuthenticationKey authenticationKey}) = _$AptosAccountImpl;
  const _AptosAccount._() : super._();

  @override
  AccountAddress get accountAddress;
  @override
  AuthenticationKey get authenticationKey;

  /// Create a copy of AptosAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AptosAccountImplCopyWith<_$AptosAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
