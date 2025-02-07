// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../pending_transaction_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PendingTransactionRemoteModel _$PendingTransactionRemoteModelFromJson(
    Map<String, dynamic> json) {
  return _PendingTransactionRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$PendingTransactionRemoteModel {
  String get hash => throw _privateConstructorUsedError;
  String get sender => throw _privateConstructorUsedError;
  String get sequenceNumber => throw _privateConstructorUsedError;
  String get maxGasAmount => throw _privateConstructorUsedError;
  String get gasUnitPrice => throw _privateConstructorUsedError;
  String get expirationTimestampSecs => throw _privateConstructorUsedError;

  /// Create a copy of PendingTransactionRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingTransactionRemoteModelCopyWith<PendingTransactionRemoteModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingTransactionRemoteModelCopyWith<$Res> {
  factory $PendingTransactionRemoteModelCopyWith(
          PendingTransactionRemoteModel value,
          $Res Function(PendingTransactionRemoteModel) then) =
      _$PendingTransactionRemoteModelCopyWithImpl<$Res,
          PendingTransactionRemoteModel>;
  @useResult
  $Res call(
      {String hash,
      String sender,
      String sequenceNumber,
      String maxGasAmount,
      String gasUnitPrice,
      String expirationTimestampSecs});
}

/// @nodoc
class _$PendingTransactionRemoteModelCopyWithImpl<$Res,
        $Val extends PendingTransactionRemoteModel>
    implements $PendingTransactionRemoteModelCopyWith<$Res> {
  _$PendingTransactionRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingTransactionRemoteModel
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
              as String,
      maxGasAmount: null == maxGasAmount
          ? _value.maxGasAmount
          : maxGasAmount // ignore: cast_nullable_to_non_nullable
              as String,
      gasUnitPrice: null == gasUnitPrice
          ? _value.gasUnitPrice
          : gasUnitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      expirationTimestampSecs: null == expirationTimestampSecs
          ? _value.expirationTimestampSecs
          : expirationTimestampSecs // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PendingTransactionRemoteModelImplCopyWith<$Res>
    implements $PendingTransactionRemoteModelCopyWith<$Res> {
  factory _$$PendingTransactionRemoteModelImplCopyWith(
          _$PendingTransactionRemoteModelImpl value,
          $Res Function(_$PendingTransactionRemoteModelImpl) then) =
      __$$PendingTransactionRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String hash,
      String sender,
      String sequenceNumber,
      String maxGasAmount,
      String gasUnitPrice,
      String expirationTimestampSecs});
}

/// @nodoc
class __$$PendingTransactionRemoteModelImplCopyWithImpl<$Res>
    extends _$PendingTransactionRemoteModelCopyWithImpl<$Res,
        _$PendingTransactionRemoteModelImpl>
    implements _$$PendingTransactionRemoteModelImplCopyWith<$Res> {
  __$$PendingTransactionRemoteModelImplCopyWithImpl(
      _$PendingTransactionRemoteModelImpl _value,
      $Res Function(_$PendingTransactionRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PendingTransactionRemoteModel
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
    return _then(_$PendingTransactionRemoteModelImpl(
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
              as String,
      maxGasAmount: null == maxGasAmount
          ? _value.maxGasAmount
          : maxGasAmount // ignore: cast_nullable_to_non_nullable
              as String,
      gasUnitPrice: null == gasUnitPrice
          ? _value.gasUnitPrice
          : gasUnitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      expirationTimestampSecs: null == expirationTimestampSecs
          ? _value.expirationTimestampSecs
          : expirationTimestampSecs // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$PendingTransactionRemoteModelImpl
    extends _PendingTransactionRemoteModel {
  const _$PendingTransactionRemoteModelImpl(
      {required this.hash,
      required this.sender,
      required this.sequenceNumber,
      required this.maxGasAmount,
      required this.gasUnitPrice,
      required this.expirationTimestampSecs})
      : super._();

  factory _$PendingTransactionRemoteModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PendingTransactionRemoteModelImplFromJson(json);

  @override
  final String hash;
  @override
  final String sender;
  @override
  final String sequenceNumber;
  @override
  final String maxGasAmount;
  @override
  final String gasUnitPrice;
  @override
  final String expirationTimestampSecs;

  @override
  String toString() {
    return 'PendingTransactionRemoteModel(hash: $hash, sender: $sender, sequenceNumber: $sequenceNumber, maxGasAmount: $maxGasAmount, gasUnitPrice: $gasUnitPrice, expirationTimestampSecs: $expirationTimestampSecs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingTransactionRemoteModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hash, sender, sequenceNumber,
      maxGasAmount, gasUnitPrice, expirationTimestampSecs);

  /// Create a copy of PendingTransactionRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingTransactionRemoteModelImplCopyWith<
          _$PendingTransactionRemoteModelImpl>
      get copyWith => __$$PendingTransactionRemoteModelImplCopyWithImpl<
          _$PendingTransactionRemoteModelImpl>(this, _$identity);
}

abstract class _PendingTransactionRemoteModel
    extends PendingTransactionRemoteModel {
  const factory _PendingTransactionRemoteModel(
          {required final String hash,
          required final String sender,
          required final String sequenceNumber,
          required final String maxGasAmount,
          required final String gasUnitPrice,
          required final String expirationTimestampSecs}) =
      _$PendingTransactionRemoteModelImpl;
  const _PendingTransactionRemoteModel._() : super._();

  factory _PendingTransactionRemoteModel.fromJson(Map<String, dynamic> json) =
      _$PendingTransactionRemoteModelImpl.fromJson;

  @override
  String get hash;
  @override
  String get sender;
  @override
  String get sequenceNumber;
  @override
  String get maxGasAmount;
  @override
  String get gasUnitPrice;
  @override
  String get expirationTimestampSecs;

  /// Create a copy of PendingTransactionRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingTransactionRemoteModelImplCopyWith<
          _$PendingTransactionRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
