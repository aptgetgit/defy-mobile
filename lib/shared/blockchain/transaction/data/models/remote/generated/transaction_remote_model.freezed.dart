// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../transaction_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionRemoteModel _$TransactionRemoteModelFromJson(
    Map<String, dynamic> json) {
  switch (json['type']) {
    case 'pending_transaction':
      return PendingTransactionRemoteModel.fromJson(json);
    case 'user_transaction':
      return UserTransactionRemoteModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'TransactionRemoteModel',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$TransactionRemoteModel {
  String get hash => throw _privateConstructorUsedError;
  String get maxGasAmount => throw _privateConstructorUsedError;
  String get gasUnitPrice => throw _privateConstructorUsedError;

  /// Create a copy of TransactionRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionRemoteModelCopyWith<TransactionRemoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionRemoteModelCopyWith<$Res> {
  factory $TransactionRemoteModelCopyWith(TransactionRemoteModel value,
          $Res Function(TransactionRemoteModel) then) =
      _$TransactionRemoteModelCopyWithImpl<$Res, TransactionRemoteModel>;
  @useResult
  $Res call({String hash, String maxGasAmount, String gasUnitPrice});
}

/// @nodoc
class _$TransactionRemoteModelCopyWithImpl<$Res,
        $Val extends TransactionRemoteModel>
    implements $TransactionRemoteModelCopyWith<$Res> {
  _$TransactionRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
    Object? maxGasAmount = null,
    Object? gasUnitPrice = null,
  }) {
    return _then(_value.copyWith(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      maxGasAmount: null == maxGasAmount
          ? _value.maxGasAmount
          : maxGasAmount // ignore: cast_nullable_to_non_nullable
              as String,
      gasUnitPrice: null == gasUnitPrice
          ? _value.gasUnitPrice
          : gasUnitPrice // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PendingTransactionRemoteModelImplCopyWith<$Res>
    implements $TransactionRemoteModelCopyWith<$Res> {
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
    extends _$TransactionRemoteModelCopyWithImpl<$Res,
        _$PendingTransactionRemoteModelImpl>
    implements _$$PendingTransactionRemoteModelImplCopyWith<$Res> {
  __$$PendingTransactionRemoteModelImplCopyWithImpl(
      _$PendingTransactionRemoteModelImpl _value,
      $Res Function(_$PendingTransactionRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionRemoteModel
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
    extends PendingTransactionRemoteModel {
  const _$PendingTransactionRemoteModelImpl(
      {required this.hash,
      required this.sender,
      required this.sequenceNumber,
      required this.maxGasAmount,
      required this.gasUnitPrice,
      required this.expirationTimestampSecs,
      final String? $type})
      : $type = $type ?? 'pending_transaction',
        super._();

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

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'TransactionRemoteModel.pending(hash: $hash, sender: $sender, sequenceNumber: $sequenceNumber, maxGasAmount: $maxGasAmount, gasUnitPrice: $gasUnitPrice, expirationTimestampSecs: $expirationTimestampSecs)';
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

  /// Create a copy of TransactionRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingTransactionRemoteModelImplCopyWith<
          _$PendingTransactionRemoteModelImpl>
      get copyWith => __$$PendingTransactionRemoteModelImplCopyWithImpl<
          _$PendingTransactionRemoteModelImpl>(this, _$identity);
}

abstract class PendingTransactionRemoteModel extends TransactionRemoteModel {
  const factory PendingTransactionRemoteModel(
          {required final String hash,
          required final String sender,
          required final String sequenceNumber,
          required final String maxGasAmount,
          required final String gasUnitPrice,
          required final String expirationTimestampSecs}) =
      _$PendingTransactionRemoteModelImpl;
  const PendingTransactionRemoteModel._() : super._();

  factory PendingTransactionRemoteModel.fromJson(Map<String, dynamic> json) =
      _$PendingTransactionRemoteModelImpl.fromJson;

  @override
  String get hash;
  String get sender;
  String get sequenceNumber;
  @override
  String get maxGasAmount;
  @override
  String get gasUnitPrice;
  String get expirationTimestampSecs;

  /// Create a copy of TransactionRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingTransactionRemoteModelImplCopyWith<
          _$PendingTransactionRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserTransactionRemoteModelImplCopyWith<$Res>
    implements $TransactionRemoteModelCopyWith<$Res> {
  factory _$$UserTransactionRemoteModelImplCopyWith(
          _$UserTransactionRemoteModelImpl value,
          $Res Function(_$UserTransactionRemoteModelImpl) then) =
      __$$UserTransactionRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String hash,
      bool success,
      String gasUsed,
      String vmStatus,
      String maxGasAmount,
      String gasUnitPrice});
}

/// @nodoc
class __$$UserTransactionRemoteModelImplCopyWithImpl<$Res>
    extends _$TransactionRemoteModelCopyWithImpl<$Res,
        _$UserTransactionRemoteModelImpl>
    implements _$$UserTransactionRemoteModelImplCopyWith<$Res> {
  __$$UserTransactionRemoteModelImplCopyWithImpl(
      _$UserTransactionRemoteModelImpl _value,
      $Res Function(_$UserTransactionRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
    Object? success = null,
    Object? gasUsed = null,
    Object? vmStatus = null,
    Object? maxGasAmount = null,
    Object? gasUnitPrice = null,
  }) {
    return _then(_$UserTransactionRemoteModelImpl(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      gasUsed: null == gasUsed
          ? _value.gasUsed
          : gasUsed // ignore: cast_nullable_to_non_nullable
              as String,
      vmStatus: null == vmStatus
          ? _value.vmStatus
          : vmStatus // ignore: cast_nullable_to_non_nullable
              as String,
      maxGasAmount: null == maxGasAmount
          ? _value.maxGasAmount
          : maxGasAmount // ignore: cast_nullable_to_non_nullable
              as String,
      gasUnitPrice: null == gasUnitPrice
          ? _value.gasUnitPrice
          : gasUnitPrice // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$UserTransactionRemoteModelImpl extends UserTransactionRemoteModel {
  const _$UserTransactionRemoteModelImpl(
      {required this.hash,
      required this.success,
      required this.gasUsed,
      required this.vmStatus,
      required this.maxGasAmount,
      required this.gasUnitPrice,
      final String? $type})
      : $type = $type ?? 'user_transaction',
        super._();

  factory _$UserTransactionRemoteModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserTransactionRemoteModelImplFromJson(json);

  @override
  final String hash;
  @override
  final bool success;
  @override
  final String gasUsed;
  @override
  final String vmStatus;
  @override
  final String maxGasAmount;
  @override
  final String gasUnitPrice;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'TransactionRemoteModel.user(hash: $hash, success: $success, gasUsed: $gasUsed, vmStatus: $vmStatus, maxGasAmount: $maxGasAmount, gasUnitPrice: $gasUnitPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTransactionRemoteModelImpl &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.gasUsed, gasUsed) || other.gasUsed == gasUsed) &&
            (identical(other.vmStatus, vmStatus) ||
                other.vmStatus == vmStatus) &&
            (identical(other.maxGasAmount, maxGasAmount) ||
                other.maxGasAmount == maxGasAmount) &&
            (identical(other.gasUnitPrice, gasUnitPrice) ||
                other.gasUnitPrice == gasUnitPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hash, success, gasUsed, vmStatus,
      maxGasAmount, gasUnitPrice);

  /// Create a copy of TransactionRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTransactionRemoteModelImplCopyWith<_$UserTransactionRemoteModelImpl>
      get copyWith => __$$UserTransactionRemoteModelImplCopyWithImpl<
          _$UserTransactionRemoteModelImpl>(this, _$identity);
}

abstract class UserTransactionRemoteModel extends TransactionRemoteModel {
  const factory UserTransactionRemoteModel(
      {required final String hash,
      required final bool success,
      required final String gasUsed,
      required final String vmStatus,
      required final String maxGasAmount,
      required final String gasUnitPrice}) = _$UserTransactionRemoteModelImpl;
  const UserTransactionRemoteModel._() : super._();

  factory UserTransactionRemoteModel.fromJson(Map<String, dynamic> json) =
      _$UserTransactionRemoteModelImpl.fromJson;

  @override
  String get hash;
  bool get success;
  String get gasUsed;
  String get vmStatus;
  @override
  String get maxGasAmount;
  @override
  String get gasUnitPrice;

  /// Create a copy of TransactionRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserTransactionRemoteModelImplCopyWith<_$UserTransactionRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
