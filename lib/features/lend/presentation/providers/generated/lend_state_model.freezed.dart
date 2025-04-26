// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../lend_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LendState {
// E-Mode settings
  bool get isEMode => throw _privateConstructorUsedError;
  String get disabledCategory =>
      throw _privateConstructorUsedError; // Health factor
  double get currentHealthFactor => throw _privateConstructorUsedError;
  double get projectedHealthFactor =>
      throw _privateConstructorUsedError; // Lend amount
  String get lendAmount => throw _privateConstructorUsedError; // Selected asset
  String get selectedAsset => throw _privateConstructorUsedError;
  String get assetIconPath => throw _privateConstructorUsedError;
  String get maxAmount => throw _privateConstructorUsedError;
  String get maxAmountUnit => throw _privateConstructorUsedError;
  String get apy => throw _privateConstructorUsedError; // Net statistics
  double get netAssets => throw _privateConstructorUsedError;
  double get healthFactor => throw _privateConstructorUsedError;
  double get netApy => throw _privateConstructorUsedError;

  /// Create a copy of LendState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LendStateCopyWith<LendState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LendStateCopyWith<$Res> {
  factory $LendStateCopyWith(LendState value, $Res Function(LendState) then) =
      _$LendStateCopyWithImpl<$Res, LendState>;
  @useResult
  $Res call(
      {bool isEMode,
      String disabledCategory,
      double currentHealthFactor,
      double projectedHealthFactor,
      String lendAmount,
      String selectedAsset,
      String assetIconPath,
      String maxAmount,
      String maxAmountUnit,
      String apy,
      double netAssets,
      double healthFactor,
      double netApy});
}

/// @nodoc
class _$LendStateCopyWithImpl<$Res, $Val extends LendState>
    implements $LendStateCopyWith<$Res> {
  _$LendStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LendState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEMode = null,
    Object? disabledCategory = null,
    Object? currentHealthFactor = null,
    Object? projectedHealthFactor = null,
    Object? lendAmount = null,
    Object? selectedAsset = null,
    Object? assetIconPath = null,
    Object? maxAmount = null,
    Object? maxAmountUnit = null,
    Object? apy = null,
    Object? netAssets = null,
    Object? healthFactor = null,
    Object? netApy = null,
  }) {
    return _then(_value.copyWith(
      isEMode: null == isEMode
          ? _value.isEMode
          : isEMode // ignore: cast_nullable_to_non_nullable
              as bool,
      disabledCategory: null == disabledCategory
          ? _value.disabledCategory
          : disabledCategory // ignore: cast_nullable_to_non_nullable
              as String,
      currentHealthFactor: null == currentHealthFactor
          ? _value.currentHealthFactor
          : currentHealthFactor // ignore: cast_nullable_to_non_nullable
              as double,
      projectedHealthFactor: null == projectedHealthFactor
          ? _value.projectedHealthFactor
          : projectedHealthFactor // ignore: cast_nullable_to_non_nullable
              as double,
      lendAmount: null == lendAmount
          ? _value.lendAmount
          : lendAmount // ignore: cast_nullable_to_non_nullable
              as String,
      selectedAsset: null == selectedAsset
          ? _value.selectedAsset
          : selectedAsset // ignore: cast_nullable_to_non_nullable
              as String,
      assetIconPath: null == assetIconPath
          ? _value.assetIconPath
          : assetIconPath // ignore: cast_nullable_to_non_nullable
              as String,
      maxAmount: null == maxAmount
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as String,
      maxAmountUnit: null == maxAmountUnit
          ? _value.maxAmountUnit
          : maxAmountUnit // ignore: cast_nullable_to_non_nullable
              as String,
      apy: null == apy
          ? _value.apy
          : apy // ignore: cast_nullable_to_non_nullable
              as String,
      netAssets: null == netAssets
          ? _value.netAssets
          : netAssets // ignore: cast_nullable_to_non_nullable
              as double,
      healthFactor: null == healthFactor
          ? _value.healthFactor
          : healthFactor // ignore: cast_nullable_to_non_nullable
              as double,
      netApy: null == netApy
          ? _value.netApy
          : netApy // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LendStateImplCopyWith<$Res>
    implements $LendStateCopyWith<$Res> {
  factory _$$LendStateImplCopyWith(
          _$LendStateImpl value, $Res Function(_$LendStateImpl) then) =
      __$$LendStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isEMode,
      String disabledCategory,
      double currentHealthFactor,
      double projectedHealthFactor,
      String lendAmount,
      String selectedAsset,
      String assetIconPath,
      String maxAmount,
      String maxAmountUnit,
      String apy,
      double netAssets,
      double healthFactor,
      double netApy});
}

/// @nodoc
class __$$LendStateImplCopyWithImpl<$Res>
    extends _$LendStateCopyWithImpl<$Res, _$LendStateImpl>
    implements _$$LendStateImplCopyWith<$Res> {
  __$$LendStateImplCopyWithImpl(
      _$LendStateImpl _value, $Res Function(_$LendStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LendState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEMode = null,
    Object? disabledCategory = null,
    Object? currentHealthFactor = null,
    Object? projectedHealthFactor = null,
    Object? lendAmount = null,
    Object? selectedAsset = null,
    Object? assetIconPath = null,
    Object? maxAmount = null,
    Object? maxAmountUnit = null,
    Object? apy = null,
    Object? netAssets = null,
    Object? healthFactor = null,
    Object? netApy = null,
  }) {
    return _then(_$LendStateImpl(
      isEMode: null == isEMode
          ? _value.isEMode
          : isEMode // ignore: cast_nullable_to_non_nullable
              as bool,
      disabledCategory: null == disabledCategory
          ? _value.disabledCategory
          : disabledCategory // ignore: cast_nullable_to_non_nullable
              as String,
      currentHealthFactor: null == currentHealthFactor
          ? _value.currentHealthFactor
          : currentHealthFactor // ignore: cast_nullable_to_non_nullable
              as double,
      projectedHealthFactor: null == projectedHealthFactor
          ? _value.projectedHealthFactor
          : projectedHealthFactor // ignore: cast_nullable_to_non_nullable
              as double,
      lendAmount: null == lendAmount
          ? _value.lendAmount
          : lendAmount // ignore: cast_nullable_to_non_nullable
              as String,
      selectedAsset: null == selectedAsset
          ? _value.selectedAsset
          : selectedAsset // ignore: cast_nullable_to_non_nullable
              as String,
      assetIconPath: null == assetIconPath
          ? _value.assetIconPath
          : assetIconPath // ignore: cast_nullable_to_non_nullable
              as String,
      maxAmount: null == maxAmount
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as String,
      maxAmountUnit: null == maxAmountUnit
          ? _value.maxAmountUnit
          : maxAmountUnit // ignore: cast_nullable_to_non_nullable
              as String,
      apy: null == apy
          ? _value.apy
          : apy // ignore: cast_nullable_to_non_nullable
              as String,
      netAssets: null == netAssets
          ? _value.netAssets
          : netAssets // ignore: cast_nullable_to_non_nullable
              as double,
      healthFactor: null == healthFactor
          ? _value.healthFactor
          : healthFactor // ignore: cast_nullable_to_non_nullable
              as double,
      netApy: null == netApy
          ? _value.netApy
          : netApy // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$LendStateImpl implements _LendState {
  const _$LendStateImpl(
      {this.isEMode = false,
      this.disabledCategory = '',
      this.currentHealthFactor = 104.05,
      this.projectedHealthFactor = 140.50,
      this.lendAmount = '0',
      this.selectedAsset = 'Aptos',
      this.assetIconPath = 'assets/icons/aptos.png',
      this.maxAmount = '100.21',
      this.maxAmountUnit = 'APT',
      this.apy = '15%',
      this.netAssets = 12121.21,
      this.healthFactor = 107.55,
      this.netApy = 5.23});

// E-Mode settings
  @override
  @JsonKey()
  final bool isEMode;
  @override
  @JsonKey()
  final String disabledCategory;
// Health factor
  @override
  @JsonKey()
  final double currentHealthFactor;
  @override
  @JsonKey()
  final double projectedHealthFactor;
// Lend amount
  @override
  @JsonKey()
  final String lendAmount;
// Selected asset
  @override
  @JsonKey()
  final String selectedAsset;
  @override
  @JsonKey()
  final String assetIconPath;
  @override
  @JsonKey()
  final String maxAmount;
  @override
  @JsonKey()
  final String maxAmountUnit;
  @override
  @JsonKey()
  final String apy;
// Net statistics
  @override
  @JsonKey()
  final double netAssets;
  @override
  @JsonKey()
  final double healthFactor;
  @override
  @JsonKey()
  final double netApy;

  @override
  String toString() {
    return 'LendState(isEMode: $isEMode, disabledCategory: $disabledCategory, currentHealthFactor: $currentHealthFactor, projectedHealthFactor: $projectedHealthFactor, lendAmount: $lendAmount, selectedAsset: $selectedAsset, assetIconPath: $assetIconPath, maxAmount: $maxAmount, maxAmountUnit: $maxAmountUnit, apy: $apy, netAssets: $netAssets, healthFactor: $healthFactor, netApy: $netApy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LendStateImpl &&
            (identical(other.isEMode, isEMode) || other.isEMode == isEMode) &&
            (identical(other.disabledCategory, disabledCategory) ||
                other.disabledCategory == disabledCategory) &&
            (identical(other.currentHealthFactor, currentHealthFactor) ||
                other.currentHealthFactor == currentHealthFactor) &&
            (identical(other.projectedHealthFactor, projectedHealthFactor) ||
                other.projectedHealthFactor == projectedHealthFactor) &&
            (identical(other.lendAmount, lendAmount) ||
                other.lendAmount == lendAmount) &&
            (identical(other.selectedAsset, selectedAsset) ||
                other.selectedAsset == selectedAsset) &&
            (identical(other.assetIconPath, assetIconPath) ||
                other.assetIconPath == assetIconPath) &&
            (identical(other.maxAmount, maxAmount) ||
                other.maxAmount == maxAmount) &&
            (identical(other.maxAmountUnit, maxAmountUnit) ||
                other.maxAmountUnit == maxAmountUnit) &&
            (identical(other.apy, apy) || other.apy == apy) &&
            (identical(other.netAssets, netAssets) ||
                other.netAssets == netAssets) &&
            (identical(other.healthFactor, healthFactor) ||
                other.healthFactor == healthFactor) &&
            (identical(other.netApy, netApy) || other.netApy == netApy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isEMode,
      disabledCategory,
      currentHealthFactor,
      projectedHealthFactor,
      lendAmount,
      selectedAsset,
      assetIconPath,
      maxAmount,
      maxAmountUnit,
      apy,
      netAssets,
      healthFactor,
      netApy);

  /// Create a copy of LendState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LendStateImplCopyWith<_$LendStateImpl> get copyWith =>
      __$$LendStateImplCopyWithImpl<_$LendStateImpl>(this, _$identity);
}

abstract class _LendState implements LendState {
  const factory _LendState(
      {final bool isEMode,
      final String disabledCategory,
      final double currentHealthFactor,
      final double projectedHealthFactor,
      final String lendAmount,
      final String selectedAsset,
      final String assetIconPath,
      final String maxAmount,
      final String maxAmountUnit,
      final String apy,
      final double netAssets,
      final double healthFactor,
      final double netApy}) = _$LendStateImpl;

// E-Mode settings
  @override
  bool get isEMode;
  @override
  String get disabledCategory; // Health factor
  @override
  double get currentHealthFactor;
  @override
  double get projectedHealthFactor; // Lend amount
  @override
  String get lendAmount; // Selected asset
  @override
  String get selectedAsset;
  @override
  String get assetIconPath;
  @override
  String get maxAmount;
  @override
  String get maxAmountUnit;
  @override
  String get apy; // Net statistics
  @override
  double get netAssets;
  @override
  double get healthFactor;
  @override
  double get netApy;

  /// Create a copy of LendState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LendStateImplCopyWith<_$LendStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
