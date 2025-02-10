// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../simulation_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SimulationResult {
  String get hash => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  BigInt get gasUsed => throw _privateConstructorUsedError;
  String get vmStatus => throw _privateConstructorUsedError;
  BigInt get maxGasAmount => throw _privateConstructorUsedError;
  BigInt get gasUnitPrice => throw _privateConstructorUsedError;

  /// Create a copy of SimulationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimulationResultCopyWith<SimulationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimulationResultCopyWith<$Res> {
  factory $SimulationResultCopyWith(
          SimulationResult value, $Res Function(SimulationResult) then) =
      _$SimulationResultCopyWithImpl<$Res, SimulationResult>;
  @useResult
  $Res call(
      {String hash,
      bool success,
      BigInt gasUsed,
      String vmStatus,
      BigInt maxGasAmount,
      BigInt gasUnitPrice});
}

/// @nodoc
class _$SimulationResultCopyWithImpl<$Res, $Val extends SimulationResult>
    implements $SimulationResultCopyWith<$Res> {
  _$SimulationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimulationResult
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
    return _then(_value.copyWith(
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
              as BigInt,
      vmStatus: null == vmStatus
          ? _value.vmStatus
          : vmStatus // ignore: cast_nullable_to_non_nullable
              as String,
      maxGasAmount: null == maxGasAmount
          ? _value.maxGasAmount
          : maxGasAmount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      gasUnitPrice: null == gasUnitPrice
          ? _value.gasUnitPrice
          : gasUnitPrice // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SimulationResultImplCopyWith<$Res>
    implements $SimulationResultCopyWith<$Res> {
  factory _$$SimulationResultImplCopyWith(_$SimulationResultImpl value,
          $Res Function(_$SimulationResultImpl) then) =
      __$$SimulationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String hash,
      bool success,
      BigInt gasUsed,
      String vmStatus,
      BigInt maxGasAmount,
      BigInt gasUnitPrice});
}

/// @nodoc
class __$$SimulationResultImplCopyWithImpl<$Res>
    extends _$SimulationResultCopyWithImpl<$Res, _$SimulationResultImpl>
    implements _$$SimulationResultImplCopyWith<$Res> {
  __$$SimulationResultImplCopyWithImpl(_$SimulationResultImpl _value,
      $Res Function(_$SimulationResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of SimulationResult
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
    return _then(_$SimulationResultImpl(
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
              as BigInt,
      vmStatus: null == vmStatus
          ? _value.vmStatus
          : vmStatus // ignore: cast_nullable_to_non_nullable
              as String,
      maxGasAmount: null == maxGasAmount
          ? _value.maxGasAmount
          : maxGasAmount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      gasUnitPrice: null == gasUnitPrice
          ? _value.gasUnitPrice
          : gasUnitPrice // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$SimulationResultImpl implements _SimulationResult {
  const _$SimulationResultImpl(
      {required this.hash,
      required this.success,
      required this.gasUsed,
      required this.vmStatus,
      required this.maxGasAmount,
      required this.gasUnitPrice});

  @override
  final String hash;
  @override
  final bool success;
  @override
  final BigInt gasUsed;
  @override
  final String vmStatus;
  @override
  final BigInt maxGasAmount;
  @override
  final BigInt gasUnitPrice;

  @override
  String toString() {
    return 'SimulationResult(hash: $hash, success: $success, gasUsed: $gasUsed, vmStatus: $vmStatus, maxGasAmount: $maxGasAmount, gasUnitPrice: $gasUnitPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimulationResultImpl &&
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

  @override
  int get hashCode => Object.hash(runtimeType, hash, success, gasUsed, vmStatus,
      maxGasAmount, gasUnitPrice);

  /// Create a copy of SimulationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimulationResultImplCopyWith<_$SimulationResultImpl> get copyWith =>
      __$$SimulationResultImplCopyWithImpl<_$SimulationResultImpl>(
          this, _$identity);
}

abstract class _SimulationResult implements SimulationResult {
  const factory _SimulationResult(
      {required final String hash,
      required final bool success,
      required final BigInt gasUsed,
      required final String vmStatus,
      required final BigInt maxGasAmount,
      required final BigInt gasUnitPrice}) = _$SimulationResultImpl;

  @override
  String get hash;
  @override
  bool get success;
  @override
  BigInt get gasUsed;
  @override
  String get vmStatus;
  @override
  BigInt get maxGasAmount;
  @override
  BigInt get gasUnitPrice;

  /// Create a copy of SimulationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimulationResultImplCopyWith<_$SimulationResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
