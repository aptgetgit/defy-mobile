// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../pending_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PendingTransaction {
  String get hash => throw _privateConstructorUsedError;
  String get sender => throw _privateConstructorUsedError;
  BigInt get sequenceNumber => throw _privateConstructorUsedError;
  BigInt get maxGasAmount => throw _privateConstructorUsedError;
  BigInt get gasUnitPrice => throw _privateConstructorUsedError;
  BigInt get expirationTimestampSecs => throw _privateConstructorUsedError;

  /// Create a copy of PendingTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingTransactionCopyWith<PendingTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingTransactionCopyWith<$Res> {
  factory $PendingTransactionCopyWith(
          PendingTransaction value, $Res Function(PendingTransaction) then) =
      _$PendingTransactionCopyWithImpl<$Res, PendingTransaction>;
  @useResult
  $Res call(
      {String hash,
      String sender,
      BigInt sequenceNumber,
      BigInt maxGasAmount,
      BigInt gasUnitPrice,
      BigInt expirationTimestampSecs});
}

/// @nodoc
class _$PendingTransactionCopyWithImpl<$Res, $Val extends PendingTransaction>
    implements $PendingTransactionCopyWith<$Res> {
  _$PendingTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
    Object? sender = null,
    Object? sequenceNumber = null,
    Object? maxGasAmount = null,
    Object? gasUnitPrice = null,
    Object? expirationTimestampSecs = null,
  }) {
    return _then(_value.copyWith(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      sequenceNumber: null == sequenceNumber
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as BigInt,
      maxGasAmount: null == maxGasAmount
          ? _value.maxGasAmount
          : maxGasAmount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      gasUnitPrice: null == gasUnitPrice
          ? _value.gasUnitPrice
          : gasUnitPrice // ignore: cast_nullable_to_non_nullable
              as BigInt,
      expirationTimestampSecs: null == expirationTimestampSecs
          ? _value.expirationTimestampSecs
          : expirationTimestampSecs // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PendingTransactionImplCopyWith<$Res>
    implements $PendingTransactionCopyWith<$Res> {
  factory _$$PendingTransactionImplCopyWith(_$PendingTransactionImpl value,
          $Res Function(_$PendingTransactionImpl) then) =
      __$$PendingTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String hash,
      String sender,
      BigInt sequenceNumber,
      BigInt maxGasAmount,
      BigInt gasUnitPrice,
      BigInt expirationTimestampSecs});
}

/// @nodoc
class __$$PendingTransactionImplCopyWithImpl<$Res>
    extends _$PendingTransactionCopyWithImpl<$Res, _$PendingTransactionImpl>
    implements _$$PendingTransactionImplCopyWith<$Res> {
  __$$PendingTransactionImplCopyWithImpl(_$PendingTransactionImpl _value,
      $Res Function(_$PendingTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PendingTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
    Object? sender = null,
    Object? sequenceNumber = null,
    Object? maxGasAmount = null,
    Object? gasUnitPrice = null,
    Object? expirationTimestampSecs = null,
  }) {
    return _then(_$PendingTransactionImpl(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      sequenceNumber: null == sequenceNumber
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as BigInt,
      maxGasAmount: null == maxGasAmount
          ? _value.maxGasAmount
          : maxGasAmount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      gasUnitPrice: null == gasUnitPrice
          ? _value.gasUnitPrice
          : gasUnitPrice // ignore: cast_nullable_to_non_nullable
              as BigInt,
      expirationTimestampSecs: null == expirationTimestampSecs
          ? _value.expirationTimestampSecs
          : expirationTimestampSecs // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$PendingTransactionImpl implements _PendingTransaction {
  const _$PendingTransactionImpl(
      {required this.hash,
      required this.sender,
      required this.sequenceNumber,
      required this.maxGasAmount,
      required this.gasUnitPrice,
      required this.expirationTimestampSecs});

  @override
  final String hash;
  @override
  final String sender;
  @override
  final BigInt sequenceNumber;
  @override
  final BigInt maxGasAmount;
  @override
  final BigInt gasUnitPrice;
  @override
  final BigInt expirationTimestampSecs;

  @override
  String toString() {
    return 'PendingTransaction(hash: $hash, sender: $sender, sequenceNumber: $sequenceNumber, maxGasAmount: $maxGasAmount, gasUnitPrice: $gasUnitPrice, expirationTimestampSecs: $expirationTimestampSecs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingTransactionImpl &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.sequenceNumber, sequenceNumber) ||
                other.sequenceNumber == sequenceNumber) &&
            (identical(other.maxGasAmount, maxGasAmount) ||
                other.maxGasAmount == maxGasAmount) &&
            (identical(other.gasUnitPrice, gasUnitPrice) ||
                other.gasUnitPrice == gasUnitPrice) &&
            (identical(
                    other.expirationTimestampSecs, expirationTimestampSecs) ||
                other.expirationTimestampSecs == expirationTimestampSecs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hash, sender, sequenceNumber,
      maxGasAmount, gasUnitPrice, expirationTimestampSecs);

  /// Create a copy of PendingTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingTransactionImplCopyWith<_$PendingTransactionImpl> get copyWith =>
      __$$PendingTransactionImplCopyWithImpl<_$PendingTransactionImpl>(
          this, _$identity);
}

abstract class _PendingTransaction implements PendingTransaction {
  const factory _PendingTransaction(
          {required final String hash,
          required final String sender,
          required final BigInt sequenceNumber,
          required final BigInt maxGasAmount,
          required final BigInt gasUnitPrice,
          required final BigInt expirationTimestampSecs}) =
      _$PendingTransactionImpl;

  @override
  String get hash;
  @override
  String get sender;
  @override
  BigInt get sequenceNumber;
  @override
  BigInt get maxGasAmount;
  @override
  BigInt get gasUnitPrice;
  @override
  BigInt get expirationTimestampSecs;

  /// Create a copy of PendingTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingTransactionImplCopyWith<_$PendingTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
