// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../gas_price_estimate_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GasPriceEstimateRemoteModel _$GasPriceEstimateRemoteModelFromJson(
    Map<String, dynamic> json) {
  return _GasPriceEstimateRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$GasPriceEstimateRemoteModel {
  int get gasEstimate => throw _privateConstructorUsedError;
  int? get deprioritizedGasEstimate => throw _privateConstructorUsedError;
  int? get prioritizedGasEstimate => throw _privateConstructorUsedError;

  /// Create a copy of GasPriceEstimateRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GasPriceEstimateRemoteModelCopyWith<GasPriceEstimateRemoteModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GasPriceEstimateRemoteModelCopyWith<$Res> {
  factory $GasPriceEstimateRemoteModelCopyWith(
          GasPriceEstimateRemoteModel value,
          $Res Function(GasPriceEstimateRemoteModel) then) =
      _$GasPriceEstimateRemoteModelCopyWithImpl<$Res,
          GasPriceEstimateRemoteModel>;
  @useResult
  $Res call(
      {int gasEstimate,
      int? deprioritizedGasEstimate,
      int? prioritizedGasEstimate});
}

/// @nodoc
class _$GasPriceEstimateRemoteModelCopyWithImpl<$Res,
        $Val extends GasPriceEstimateRemoteModel>
    implements $GasPriceEstimateRemoteModelCopyWith<$Res> {
  _$GasPriceEstimateRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GasPriceEstimateRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gasEstimate = null,
    Object? deprioritizedGasEstimate = freezed,
    Object? prioritizedGasEstimate = freezed,
  }) {
    return _then(_value.copyWith(
      gasEstimate: null == gasEstimate
          ? _value.gasEstimate
          : gasEstimate // ignore: cast_nullable_to_non_nullable
              as int,
      deprioritizedGasEstimate: freezed == deprioritizedGasEstimate
          ? _value.deprioritizedGasEstimate
          : deprioritizedGasEstimate // ignore: cast_nullable_to_non_nullable
              as int?,
      prioritizedGasEstimate: freezed == prioritizedGasEstimate
          ? _value.prioritizedGasEstimate
          : prioritizedGasEstimate // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GasPriceEstimateRemoteModelImplCopyWith<$Res>
    implements $GasPriceEstimateRemoteModelCopyWith<$Res> {
  factory _$$GasPriceEstimateRemoteModelImplCopyWith(
          _$GasPriceEstimateRemoteModelImpl value,
          $Res Function(_$GasPriceEstimateRemoteModelImpl) then) =
      __$$GasPriceEstimateRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int gasEstimate,
      int? deprioritizedGasEstimate,
      int? prioritizedGasEstimate});
}

/// @nodoc
class __$$GasPriceEstimateRemoteModelImplCopyWithImpl<$Res>
    extends _$GasPriceEstimateRemoteModelCopyWithImpl<$Res,
        _$GasPriceEstimateRemoteModelImpl>
    implements _$$GasPriceEstimateRemoteModelImplCopyWith<$Res> {
  __$$GasPriceEstimateRemoteModelImplCopyWithImpl(
      _$GasPriceEstimateRemoteModelImpl _value,
      $Res Function(_$GasPriceEstimateRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GasPriceEstimateRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gasEstimate = null,
    Object? deprioritizedGasEstimate = freezed,
    Object? prioritizedGasEstimate = freezed,
  }) {
    return _then(_$GasPriceEstimateRemoteModelImpl(
      gasEstimate: null == gasEstimate
          ? _value.gasEstimate
          : gasEstimate // ignore: cast_nullable_to_non_nullable
              as int,
      deprioritizedGasEstimate: freezed == deprioritizedGasEstimate
          ? _value.deprioritizedGasEstimate
          : deprioritizedGasEstimate // ignore: cast_nullable_to_non_nullable
              as int?,
      prioritizedGasEstimate: freezed == prioritizedGasEstimate
          ? _value.prioritizedGasEstimate
          : prioritizedGasEstimate // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$GasPriceEstimateRemoteModelImpl extends _GasPriceEstimateRemoteModel {
  const _$GasPriceEstimateRemoteModelImpl(
      {required this.gasEstimate,
      this.deprioritizedGasEstimate,
      this.prioritizedGasEstimate})
      : super._();

  factory _$GasPriceEstimateRemoteModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GasPriceEstimateRemoteModelImplFromJson(json);

  @override
  final int gasEstimate;
  @override
  final int? deprioritizedGasEstimate;
  @override
  final int? prioritizedGasEstimate;

  @override
  String toString() {
    return 'GasPriceEstimateRemoteModel(gasEstimate: $gasEstimate, deprioritizedGasEstimate: $deprioritizedGasEstimate, prioritizedGasEstimate: $prioritizedGasEstimate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GasPriceEstimateRemoteModelImpl &&
            (identical(other.gasEstimate, gasEstimate) ||
                other.gasEstimate == gasEstimate) &&
            (identical(
                    other.deprioritizedGasEstimate, deprioritizedGasEstimate) ||
                other.deprioritizedGasEstimate == deprioritizedGasEstimate) &&
            (identical(other.prioritizedGasEstimate, prioritizedGasEstimate) ||
                other.prioritizedGasEstimate == prioritizedGasEstimate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gasEstimate,
      deprioritizedGasEstimate, prioritizedGasEstimate);

  /// Create a copy of GasPriceEstimateRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GasPriceEstimateRemoteModelImplCopyWith<_$GasPriceEstimateRemoteModelImpl>
      get copyWith => __$$GasPriceEstimateRemoteModelImplCopyWithImpl<
          _$GasPriceEstimateRemoteModelImpl>(this, _$identity);
}

abstract class _GasPriceEstimateRemoteModel
    extends GasPriceEstimateRemoteModel {
  const factory _GasPriceEstimateRemoteModel(
      {required final int gasEstimate,
      final int? deprioritizedGasEstimate,
      final int? prioritizedGasEstimate}) = _$GasPriceEstimateRemoteModelImpl;
  const _GasPriceEstimateRemoteModel._() : super._();

  factory _GasPriceEstimateRemoteModel.fromJson(Map<String, dynamic> json) =
      _$GasPriceEstimateRemoteModelImpl.fromJson;

  @override
  int get gasEstimate;
  @override
  int? get deprioritizedGasEstimate;
  @override
  int? get prioritizedGasEstimate;

  /// Create a copy of GasPriceEstimateRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GasPriceEstimateRemoteModelImplCopyWith<_$GasPriceEstimateRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
