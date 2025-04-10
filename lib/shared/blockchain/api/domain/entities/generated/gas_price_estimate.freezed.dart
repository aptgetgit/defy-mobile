// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../gas_price_estimate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GasPriceEstimate {
  BigInt get gasEstimate => throw _privateConstructorUsedError;
  Option<BigInt> get deprioritizedGasEstimate =>
      throw _privateConstructorUsedError;
  Option<BigInt> get prioritizedGasEstimate =>
      throw _privateConstructorUsedError;

  /// Create a copy of GasPriceEstimate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GasPriceEstimateCopyWith<GasPriceEstimate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GasPriceEstimateCopyWith<$Res> {
  factory $GasPriceEstimateCopyWith(
          GasPriceEstimate value, $Res Function(GasPriceEstimate) then) =
      _$GasPriceEstimateCopyWithImpl<$Res, GasPriceEstimate>;
  @useResult
  $Res call(
      {BigInt gasEstimate,
      Option<BigInt> deprioritizedGasEstimate,
      Option<BigInt> prioritizedGasEstimate});
}

/// @nodoc
class _$GasPriceEstimateCopyWithImpl<$Res, $Val extends GasPriceEstimate>
    implements $GasPriceEstimateCopyWith<$Res> {
  _$GasPriceEstimateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GasPriceEstimate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gasEstimate = null,
    Object? deprioritizedGasEstimate = null,
    Object? prioritizedGasEstimate = null,
  }) {
    return _then(_value.copyWith(
      gasEstimate: null == gasEstimate
          ? _value.gasEstimate
          : gasEstimate // ignore: cast_nullable_to_non_nullable
              as BigInt,
      deprioritizedGasEstimate: null == deprioritizedGasEstimate
          ? _value.deprioritizedGasEstimate
          : deprioritizedGasEstimate // ignore: cast_nullable_to_non_nullable
              as Option<BigInt>,
      prioritizedGasEstimate: null == prioritizedGasEstimate
          ? _value.prioritizedGasEstimate
          : prioritizedGasEstimate // ignore: cast_nullable_to_non_nullable
              as Option<BigInt>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GasPriceEstimateImplCopyWith<$Res>
    implements $GasPriceEstimateCopyWith<$Res> {
  factory _$$GasPriceEstimateImplCopyWith(_$GasPriceEstimateImpl value,
          $Res Function(_$GasPriceEstimateImpl) then) =
      __$$GasPriceEstimateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BigInt gasEstimate,
      Option<BigInt> deprioritizedGasEstimate,
      Option<BigInt> prioritizedGasEstimate});
}

/// @nodoc
class __$$GasPriceEstimateImplCopyWithImpl<$Res>
    extends _$GasPriceEstimateCopyWithImpl<$Res, _$GasPriceEstimateImpl>
    implements _$$GasPriceEstimateImplCopyWith<$Res> {
  __$$GasPriceEstimateImplCopyWithImpl(_$GasPriceEstimateImpl _value,
      $Res Function(_$GasPriceEstimateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GasPriceEstimate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gasEstimate = null,
    Object? deprioritizedGasEstimate = null,
    Object? prioritizedGasEstimate = null,
  }) {
    return _then(_$GasPriceEstimateImpl(
      gasEstimate: null == gasEstimate
          ? _value.gasEstimate
          : gasEstimate // ignore: cast_nullable_to_non_nullable
              as BigInt,
      deprioritizedGasEstimate: null == deprioritizedGasEstimate
          ? _value.deprioritizedGasEstimate
          : deprioritizedGasEstimate // ignore: cast_nullable_to_non_nullable
              as Option<BigInt>,
      prioritizedGasEstimate: null == prioritizedGasEstimate
          ? _value.prioritizedGasEstimate
          : prioritizedGasEstimate // ignore: cast_nullable_to_non_nullable
              as Option<BigInt>,
    ));
  }
}

/// @nodoc

class _$GasPriceEstimateImpl implements _GasPriceEstimate {
  const _$GasPriceEstimateImpl(
      {required this.gasEstimate,
      required this.deprioritizedGasEstimate,
      required this.prioritizedGasEstimate});

  @override
  final BigInt gasEstimate;
  @override
  final Option<BigInt> deprioritizedGasEstimate;
  @override
  final Option<BigInt> prioritizedGasEstimate;

  @override
  String toString() {
    return 'GasPriceEstimate(gasEstimate: $gasEstimate, deprioritizedGasEstimate: $deprioritizedGasEstimate, prioritizedGasEstimate: $prioritizedGasEstimate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GasPriceEstimateImpl &&
            (identical(other.gasEstimate, gasEstimate) ||
                other.gasEstimate == gasEstimate) &&
            (identical(
                    other.deprioritizedGasEstimate, deprioritizedGasEstimate) ||
                other.deprioritizedGasEstimate == deprioritizedGasEstimate) &&
            (identical(other.prioritizedGasEstimate, prioritizedGasEstimate) ||
                other.prioritizedGasEstimate == prioritizedGasEstimate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gasEstimate,
      deprioritizedGasEstimate, prioritizedGasEstimate);

  /// Create a copy of GasPriceEstimate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GasPriceEstimateImplCopyWith<_$GasPriceEstimateImpl> get copyWith =>
      __$$GasPriceEstimateImplCopyWithImpl<_$GasPriceEstimateImpl>(
          this, _$identity);
}

abstract class _GasPriceEstimate implements GasPriceEstimate {
  const factory _GasPriceEstimate(
          {required final BigInt gasEstimate,
          required final Option<BigInt> deprioritizedGasEstimate,
          required final Option<BigInt> prioritizedGasEstimate}) =
      _$GasPriceEstimateImpl;

  @override
  BigInt get gasEstimate;
  @override
  Option<BigInt> get deprioritizedGasEstimate;
  @override
  Option<BigInt> get prioritizedGasEstimate;

  /// Create a copy of GasPriceEstimate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GasPriceEstimateImplCopyWith<_$GasPriceEstimateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
