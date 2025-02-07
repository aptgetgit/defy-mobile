// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../account_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountData {
  BigInt get sequenceNumber => throw _privateConstructorUsedError;
  AuthenticationKey get authenticationKey => throw _privateConstructorUsedError;

  /// Create a copy of AccountData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountDataCopyWith<AccountData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDataCopyWith<$Res> {
  factory $AccountDataCopyWith(
          AccountData value, $Res Function(AccountData) then) =
      _$AccountDataCopyWithImpl<$Res, AccountData>;
  @useResult
  $Res call({BigInt sequenceNumber, AuthenticationKey authenticationKey});

  $AuthenticationKeyCopyWith<$Res> get authenticationKey;
}

/// @nodoc
class _$AccountDataCopyWithImpl<$Res, $Val extends AccountData>
    implements $AccountDataCopyWith<$Res> {
  _$AccountDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sequenceNumber = null,
    Object? authenticationKey = null,
  }) {
    return _then(_value.copyWith(
      sequenceNumber: null == sequenceNumber
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as BigInt,
      authenticationKey: null == authenticationKey
          ? _value.authenticationKey
          : authenticationKey // ignore: cast_nullable_to_non_nullable
              as AuthenticationKey,
    ) as $Val);
  }

  /// Create a copy of AccountData
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
abstract class _$$AccountDataImplCopyWith<$Res>
    implements $AccountDataCopyWith<$Res> {
  factory _$$AccountDataImplCopyWith(
          _$AccountDataImpl value, $Res Function(_$AccountDataImpl) then) =
      __$$AccountDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BigInt sequenceNumber, AuthenticationKey authenticationKey});

  @override
  $AuthenticationKeyCopyWith<$Res> get authenticationKey;
}

/// @nodoc
class __$$AccountDataImplCopyWithImpl<$Res>
    extends _$AccountDataCopyWithImpl<$Res, _$AccountDataImpl>
    implements _$$AccountDataImplCopyWith<$Res> {
  __$$AccountDataImplCopyWithImpl(
      _$AccountDataImpl _value, $Res Function(_$AccountDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sequenceNumber = null,
    Object? authenticationKey = null,
  }) {
    return _then(_$AccountDataImpl(
      sequenceNumber: null == sequenceNumber
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as BigInt,
      authenticationKey: null == authenticationKey
          ? _value.authenticationKey
          : authenticationKey // ignore: cast_nullable_to_non_nullable
              as AuthenticationKey,
    ));
  }
}

/// @nodoc

class _$AccountDataImpl implements _AccountData {
  const _$AccountDataImpl(
      {required this.sequenceNumber, required this.authenticationKey});

  @override
  final BigInt sequenceNumber;
  @override
  final AuthenticationKey authenticationKey;

  @override
  String toString() {
    return 'AccountData(sequenceNumber: $sequenceNumber, authenticationKey: $authenticationKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDataImpl &&
            (identical(other.sequenceNumber, sequenceNumber) ||
                other.sequenceNumber == sequenceNumber) &&
            (identical(other.authenticationKey, authenticationKey) ||
                other.authenticationKey == authenticationKey));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, sequenceNumber, authenticationKey);

  /// Create a copy of AccountData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountDataImplCopyWith<_$AccountDataImpl> get copyWith =>
      __$$AccountDataImplCopyWithImpl<_$AccountDataImpl>(this, _$identity);
}

abstract class _AccountData implements AccountData {
  const factory _AccountData(
      {required final BigInt sequenceNumber,
      required final AuthenticationKey authenticationKey}) = _$AccountDataImpl;

  @override
  BigInt get sequenceNumber;
  @override
  AuthenticationKey get authenticationKey;

  /// Create a copy of AccountData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountDataImplCopyWith<_$AccountDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
