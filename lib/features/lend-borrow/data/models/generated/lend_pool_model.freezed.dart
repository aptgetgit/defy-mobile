// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../lend_pool_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LendPoolModel _$LendPoolModelFromJson(Map<String, dynamic> json) {
  return _LendPoolModel.fromJson(json);
}

/// @nodoc
mixin _$LendPoolModel {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'marketCoin')
  String? get marketCoin => throw _privateConstructorUsedError;
  @JsonKey(name: 'borrowApr')
  double? get borrowApr => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplyApr')
  double? get supplyApr => throw _privateConstructorUsedError;
  @JsonKey(name: 'asset_mantissa')
  String? get assetMantissa => throw _privateConstructorUsedError;
  @JsonKey(name: 'asset_name')
  String? get assetName => throw _privateConstructorUsedError;
  @JsonKey(name: 'asset_type')
  String? get assetType => throw _privateConstructorUsedError;
  @JsonKey(name: 'borrow_cap')
  String? get borrowCap => throw _privateConstructorUsedError;
  @JsonKey(name: 'collateral_factor_bps')
  String? get collateralFactorBps => throw _privateConstructorUsedError;
  @JsonKey(name: 'efficiency_mode_id')
  int? get efficiencyModeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'initial_liquidity')
  String? get initialLiquidity => throw _privateConstructorUsedError;
  @JsonKey(name: 'paused')
  bool? get paused => throw _privateConstructorUsedError;
  @JsonKey(name: 'supply_cap')
  String? get supplyCap => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_cash')
  String? get totalCash => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_liability')
  String? get totalLiability => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_reserve')
  String? get totalReserve => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_shares')
  String? get totalShares => throw _privateConstructorUsedError;
  @JsonKey(name: 'extend_ref')
  ExtendRefModel? get extendRef => throw _privateConstructorUsedError;
  @JsonKey(name: 'interest_rate_index')
  InterestRateIndexModel? get interestRateIndex =>
      throw _privateConstructorUsedError;

  /// Serializes this LendPoolModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LendPoolModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LendPoolModelCopyWith<LendPoolModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LendPoolModelCopyWith<$Res> {
  factory $LendPoolModelCopyWith(
          LendPoolModel value, $Res Function(LendPoolModel) then) =
      _$LendPoolModelCopyWithImpl<$Res, LendPoolModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'marketCoin') String? marketCoin,
      @JsonKey(name: 'borrowApr') double? borrowApr,
      @JsonKey(name: 'supplyApr') double? supplyApr,
      @JsonKey(name: 'asset_mantissa') String? assetMantissa,
      @JsonKey(name: 'asset_name') String? assetName,
      @JsonKey(name: 'asset_type') String? assetType,
      @JsonKey(name: 'borrow_cap') String? borrowCap,
      @JsonKey(name: 'collateral_factor_bps') String? collateralFactorBps,
      @JsonKey(name: 'efficiency_mode_id') int? efficiencyModeId,
      @JsonKey(name: 'initial_liquidity') String? initialLiquidity,
      @JsonKey(name: 'paused') bool? paused,
      @JsonKey(name: 'supply_cap') String? supplyCap,
      @JsonKey(name: 'total_cash') String? totalCash,
      @JsonKey(name: 'total_liability') String? totalLiability,
      @JsonKey(name: 'total_reserve') String? totalReserve,
      @JsonKey(name: 'total_shares') String? totalShares,
      @JsonKey(name: 'extend_ref') ExtendRefModel? extendRef,
      @JsonKey(name: 'interest_rate_index')
      InterestRateIndexModel? interestRateIndex});

  $ExtendRefModelCopyWith<$Res>? get extendRef;
  $InterestRateIndexModelCopyWith<$Res>? get interestRateIndex;
}

/// @nodoc
class _$LendPoolModelCopyWithImpl<$Res, $Val extends LendPoolModel>
    implements $LendPoolModelCopyWith<$Res> {
  _$LendPoolModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LendPoolModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? marketCoin = freezed,
    Object? borrowApr = freezed,
    Object? supplyApr = freezed,
    Object? assetMantissa = freezed,
    Object? assetName = freezed,
    Object? assetType = freezed,
    Object? borrowCap = freezed,
    Object? collateralFactorBps = freezed,
    Object? efficiencyModeId = freezed,
    Object? initialLiquidity = freezed,
    Object? paused = freezed,
    Object? supplyCap = freezed,
    Object? totalCash = freezed,
    Object? totalLiability = freezed,
    Object? totalReserve = freezed,
    Object? totalShares = freezed,
    Object? extendRef = freezed,
    Object? interestRateIndex = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      marketCoin: freezed == marketCoin
          ? _value.marketCoin
          : marketCoin // ignore: cast_nullable_to_non_nullable
              as String?,
      borrowApr: freezed == borrowApr
          ? _value.borrowApr
          : borrowApr // ignore: cast_nullable_to_non_nullable
              as double?,
      supplyApr: freezed == supplyApr
          ? _value.supplyApr
          : supplyApr // ignore: cast_nullable_to_non_nullable
              as double?,
      assetMantissa: freezed == assetMantissa
          ? _value.assetMantissa
          : assetMantissa // ignore: cast_nullable_to_non_nullable
              as String?,
      assetName: freezed == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String?,
      assetType: freezed == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as String?,
      borrowCap: freezed == borrowCap
          ? _value.borrowCap
          : borrowCap // ignore: cast_nullable_to_non_nullable
              as String?,
      collateralFactorBps: freezed == collateralFactorBps
          ? _value.collateralFactorBps
          : collateralFactorBps // ignore: cast_nullable_to_non_nullable
              as String?,
      efficiencyModeId: freezed == efficiencyModeId
          ? _value.efficiencyModeId
          : efficiencyModeId // ignore: cast_nullable_to_non_nullable
              as int?,
      initialLiquidity: freezed == initialLiquidity
          ? _value.initialLiquidity
          : initialLiquidity // ignore: cast_nullable_to_non_nullable
              as String?,
      paused: freezed == paused
          ? _value.paused
          : paused // ignore: cast_nullable_to_non_nullable
              as bool?,
      supplyCap: freezed == supplyCap
          ? _value.supplyCap
          : supplyCap // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCash: freezed == totalCash
          ? _value.totalCash
          : totalCash // ignore: cast_nullable_to_non_nullable
              as String?,
      totalLiability: freezed == totalLiability
          ? _value.totalLiability
          : totalLiability // ignore: cast_nullable_to_non_nullable
              as String?,
      totalReserve: freezed == totalReserve
          ? _value.totalReserve
          : totalReserve // ignore: cast_nullable_to_non_nullable
              as String?,
      totalShares: freezed == totalShares
          ? _value.totalShares
          : totalShares // ignore: cast_nullable_to_non_nullable
              as String?,
      extendRef: freezed == extendRef
          ? _value.extendRef
          : extendRef // ignore: cast_nullable_to_non_nullable
              as ExtendRefModel?,
      interestRateIndex: freezed == interestRateIndex
          ? _value.interestRateIndex
          : interestRateIndex // ignore: cast_nullable_to_non_nullable
              as InterestRateIndexModel?,
    ) as $Val);
  }

  /// Create a copy of LendPoolModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExtendRefModelCopyWith<$Res>? get extendRef {
    if (_value.extendRef == null) {
      return null;
    }

    return $ExtendRefModelCopyWith<$Res>(_value.extendRef!, (value) {
      return _then(_value.copyWith(extendRef: value) as $Val);
    });
  }

  /// Create a copy of LendPoolModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InterestRateIndexModelCopyWith<$Res>? get interestRateIndex {
    if (_value.interestRateIndex == null) {
      return null;
    }

    return $InterestRateIndexModelCopyWith<$Res>(_value.interestRateIndex!,
        (value) {
      return _then(_value.copyWith(interestRateIndex: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LendPoolModelImplCopyWith<$Res>
    implements $LendPoolModelCopyWith<$Res> {
  factory _$$LendPoolModelImplCopyWith(
          _$LendPoolModelImpl value, $Res Function(_$LendPoolModelImpl) then) =
      __$$LendPoolModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'marketCoin') String? marketCoin,
      @JsonKey(name: 'borrowApr') double? borrowApr,
      @JsonKey(name: 'supplyApr') double? supplyApr,
      @JsonKey(name: 'asset_mantissa') String? assetMantissa,
      @JsonKey(name: 'asset_name') String? assetName,
      @JsonKey(name: 'asset_type') String? assetType,
      @JsonKey(name: 'borrow_cap') String? borrowCap,
      @JsonKey(name: 'collateral_factor_bps') String? collateralFactorBps,
      @JsonKey(name: 'efficiency_mode_id') int? efficiencyModeId,
      @JsonKey(name: 'initial_liquidity') String? initialLiquidity,
      @JsonKey(name: 'paused') bool? paused,
      @JsonKey(name: 'supply_cap') String? supplyCap,
      @JsonKey(name: 'total_cash') String? totalCash,
      @JsonKey(name: 'total_liability') String? totalLiability,
      @JsonKey(name: 'total_reserve') String? totalReserve,
      @JsonKey(name: 'total_shares') String? totalShares,
      @JsonKey(name: 'extend_ref') ExtendRefModel? extendRef,
      @JsonKey(name: 'interest_rate_index')
      InterestRateIndexModel? interestRateIndex});

  @override
  $ExtendRefModelCopyWith<$Res>? get extendRef;
  @override
  $InterestRateIndexModelCopyWith<$Res>? get interestRateIndex;
}

/// @nodoc
class __$$LendPoolModelImplCopyWithImpl<$Res>
    extends _$LendPoolModelCopyWithImpl<$Res, _$LendPoolModelImpl>
    implements _$$LendPoolModelImplCopyWith<$Res> {
  __$$LendPoolModelImplCopyWithImpl(
      _$LendPoolModelImpl _value, $Res Function(_$LendPoolModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LendPoolModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? marketCoin = freezed,
    Object? borrowApr = freezed,
    Object? supplyApr = freezed,
    Object? assetMantissa = freezed,
    Object? assetName = freezed,
    Object? assetType = freezed,
    Object? borrowCap = freezed,
    Object? collateralFactorBps = freezed,
    Object? efficiencyModeId = freezed,
    Object? initialLiquidity = freezed,
    Object? paused = freezed,
    Object? supplyCap = freezed,
    Object? totalCash = freezed,
    Object? totalLiability = freezed,
    Object? totalReserve = freezed,
    Object? totalShares = freezed,
    Object? extendRef = freezed,
    Object? interestRateIndex = freezed,
  }) {
    return _then(_$LendPoolModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      marketCoin: freezed == marketCoin
          ? _value.marketCoin
          : marketCoin // ignore: cast_nullable_to_non_nullable
              as String?,
      borrowApr: freezed == borrowApr
          ? _value.borrowApr
          : borrowApr // ignore: cast_nullable_to_non_nullable
              as double?,
      supplyApr: freezed == supplyApr
          ? _value.supplyApr
          : supplyApr // ignore: cast_nullable_to_non_nullable
              as double?,
      assetMantissa: freezed == assetMantissa
          ? _value.assetMantissa
          : assetMantissa // ignore: cast_nullable_to_non_nullable
              as String?,
      assetName: freezed == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String?,
      assetType: freezed == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as String?,
      borrowCap: freezed == borrowCap
          ? _value.borrowCap
          : borrowCap // ignore: cast_nullable_to_non_nullable
              as String?,
      collateralFactorBps: freezed == collateralFactorBps
          ? _value.collateralFactorBps
          : collateralFactorBps // ignore: cast_nullable_to_non_nullable
              as String?,
      efficiencyModeId: freezed == efficiencyModeId
          ? _value.efficiencyModeId
          : efficiencyModeId // ignore: cast_nullable_to_non_nullable
              as int?,
      initialLiquidity: freezed == initialLiquidity
          ? _value.initialLiquidity
          : initialLiquidity // ignore: cast_nullable_to_non_nullable
              as String?,
      paused: freezed == paused
          ? _value.paused
          : paused // ignore: cast_nullable_to_non_nullable
              as bool?,
      supplyCap: freezed == supplyCap
          ? _value.supplyCap
          : supplyCap // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCash: freezed == totalCash
          ? _value.totalCash
          : totalCash // ignore: cast_nullable_to_non_nullable
              as String?,
      totalLiability: freezed == totalLiability
          ? _value.totalLiability
          : totalLiability // ignore: cast_nullable_to_non_nullable
              as String?,
      totalReserve: freezed == totalReserve
          ? _value.totalReserve
          : totalReserve // ignore: cast_nullable_to_non_nullable
              as String?,
      totalShares: freezed == totalShares
          ? _value.totalShares
          : totalShares // ignore: cast_nullable_to_non_nullable
              as String?,
      extendRef: freezed == extendRef
          ? _value.extendRef
          : extendRef // ignore: cast_nullable_to_non_nullable
              as ExtendRefModel?,
      interestRateIndex: freezed == interestRateIndex
          ? _value.interestRateIndex
          : interestRateIndex // ignore: cast_nullable_to_non_nullable
              as InterestRateIndexModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LendPoolModelImpl extends _LendPoolModel {
  const _$LendPoolModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'marketCoin') this.marketCoin,
      @JsonKey(name: 'borrowApr') this.borrowApr,
      @JsonKey(name: 'supplyApr') this.supplyApr,
      @JsonKey(name: 'asset_mantissa') this.assetMantissa,
      @JsonKey(name: 'asset_name') this.assetName,
      @JsonKey(name: 'asset_type') this.assetType,
      @JsonKey(name: 'borrow_cap') this.borrowCap,
      @JsonKey(name: 'collateral_factor_bps') this.collateralFactorBps,
      @JsonKey(name: 'efficiency_mode_id') this.efficiencyModeId,
      @JsonKey(name: 'initial_liquidity') this.initialLiquidity,
      @JsonKey(name: 'paused') this.paused,
      @JsonKey(name: 'supply_cap') this.supplyCap,
      @JsonKey(name: 'total_cash') this.totalCash,
      @JsonKey(name: 'total_liability') this.totalLiability,
      @JsonKey(name: 'total_reserve') this.totalReserve,
      @JsonKey(name: 'total_shares') this.totalShares,
      @JsonKey(name: 'extend_ref') this.extendRef,
      @JsonKey(name: 'interest_rate_index') this.interestRateIndex})
      : super._();

  factory _$LendPoolModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LendPoolModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'marketCoin')
  final String? marketCoin;
  @override
  @JsonKey(name: 'borrowApr')
  final double? borrowApr;
  @override
  @JsonKey(name: 'supplyApr')
  final double? supplyApr;
  @override
  @JsonKey(name: 'asset_mantissa')
  final String? assetMantissa;
  @override
  @JsonKey(name: 'asset_name')
  final String? assetName;
  @override
  @JsonKey(name: 'asset_type')
  final String? assetType;
  @override
  @JsonKey(name: 'borrow_cap')
  final String? borrowCap;
  @override
  @JsonKey(name: 'collateral_factor_bps')
  final String? collateralFactorBps;
  @override
  @JsonKey(name: 'efficiency_mode_id')
  final int? efficiencyModeId;
  @override
  @JsonKey(name: 'initial_liquidity')
  final String? initialLiquidity;
  @override
  @JsonKey(name: 'paused')
  final bool? paused;
  @override
  @JsonKey(name: 'supply_cap')
  final String? supplyCap;
  @override
  @JsonKey(name: 'total_cash')
  final String? totalCash;
  @override
  @JsonKey(name: 'total_liability')
  final String? totalLiability;
  @override
  @JsonKey(name: 'total_reserve')
  final String? totalReserve;
  @override
  @JsonKey(name: 'total_shares')
  final String? totalShares;
  @override
  @JsonKey(name: 'extend_ref')
  final ExtendRefModel? extendRef;
  @override
  @JsonKey(name: 'interest_rate_index')
  final InterestRateIndexModel? interestRateIndex;

  @override
  String toString() {
    return 'LendPoolModel(id: $id, marketCoin: $marketCoin, borrowApr: $borrowApr, supplyApr: $supplyApr, assetMantissa: $assetMantissa, assetName: $assetName, assetType: $assetType, borrowCap: $borrowCap, collateralFactorBps: $collateralFactorBps, efficiencyModeId: $efficiencyModeId, initialLiquidity: $initialLiquidity, paused: $paused, supplyCap: $supplyCap, totalCash: $totalCash, totalLiability: $totalLiability, totalReserve: $totalReserve, totalShares: $totalShares, extendRef: $extendRef, interestRateIndex: $interestRateIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LendPoolModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.marketCoin, marketCoin) ||
                other.marketCoin == marketCoin) &&
            (identical(other.borrowApr, borrowApr) ||
                other.borrowApr == borrowApr) &&
            (identical(other.supplyApr, supplyApr) ||
                other.supplyApr == supplyApr) &&
            (identical(other.assetMantissa, assetMantissa) ||
                other.assetMantissa == assetMantissa) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.borrowCap, borrowCap) ||
                other.borrowCap == borrowCap) &&
            (identical(other.collateralFactorBps, collateralFactorBps) ||
                other.collateralFactorBps == collateralFactorBps) &&
            (identical(other.efficiencyModeId, efficiencyModeId) ||
                other.efficiencyModeId == efficiencyModeId) &&
            (identical(other.initialLiquidity, initialLiquidity) ||
                other.initialLiquidity == initialLiquidity) &&
            (identical(other.paused, paused) || other.paused == paused) &&
            (identical(other.supplyCap, supplyCap) ||
                other.supplyCap == supplyCap) &&
            (identical(other.totalCash, totalCash) ||
                other.totalCash == totalCash) &&
            (identical(other.totalLiability, totalLiability) ||
                other.totalLiability == totalLiability) &&
            (identical(other.totalReserve, totalReserve) ||
                other.totalReserve == totalReserve) &&
            (identical(other.totalShares, totalShares) ||
                other.totalShares == totalShares) &&
            (identical(other.extendRef, extendRef) ||
                other.extendRef == extendRef) &&
            (identical(other.interestRateIndex, interestRateIndex) ||
                other.interestRateIndex == interestRateIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        marketCoin,
        borrowApr,
        supplyApr,
        assetMantissa,
        assetName,
        assetType,
        borrowCap,
        collateralFactorBps,
        efficiencyModeId,
        initialLiquidity,
        paused,
        supplyCap,
        totalCash,
        totalLiability,
        totalReserve,
        totalShares,
        extendRef,
        interestRateIndex
      ]);

  /// Create a copy of LendPoolModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LendPoolModelImplCopyWith<_$LendPoolModelImpl> get copyWith =>
      __$$LendPoolModelImplCopyWithImpl<_$LendPoolModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LendPoolModelImplToJson(
      this,
    );
  }
}

abstract class _LendPoolModel extends LendPoolModel {
  const factory _LendPoolModel(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'marketCoin') final String? marketCoin,
      @JsonKey(name: 'borrowApr') final double? borrowApr,
      @JsonKey(name: 'supplyApr') final double? supplyApr,
      @JsonKey(name: 'asset_mantissa') final String? assetMantissa,
      @JsonKey(name: 'asset_name') final String? assetName,
      @JsonKey(name: 'asset_type') final String? assetType,
      @JsonKey(name: 'borrow_cap') final String? borrowCap,
      @JsonKey(name: 'collateral_factor_bps') final String? collateralFactorBps,
      @JsonKey(name: 'efficiency_mode_id') final int? efficiencyModeId,
      @JsonKey(name: 'initial_liquidity') final String? initialLiquidity,
      @JsonKey(name: 'paused') final bool? paused,
      @JsonKey(name: 'supply_cap') final String? supplyCap,
      @JsonKey(name: 'total_cash') final String? totalCash,
      @JsonKey(name: 'total_liability') final String? totalLiability,
      @JsonKey(name: 'total_reserve') final String? totalReserve,
      @JsonKey(name: 'total_shares') final String? totalShares,
      @JsonKey(name: 'extend_ref') final ExtendRefModel? extendRef,
      @JsonKey(name: 'interest_rate_index')
      final InterestRateIndexModel? interestRateIndex}) = _$LendPoolModelImpl;
  const _LendPoolModel._() : super._();

  factory _LendPoolModel.fromJson(Map<String, dynamic> json) =
      _$LendPoolModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'marketCoin')
  String? get marketCoin;
  @override
  @JsonKey(name: 'borrowApr')
  double? get borrowApr;
  @override
  @JsonKey(name: 'supplyApr')
  double? get supplyApr;
  @override
  @JsonKey(name: 'asset_mantissa')
  String? get assetMantissa;
  @override
  @JsonKey(name: 'asset_name')
  String? get assetName;
  @override
  @JsonKey(name: 'asset_type')
  String? get assetType;
  @override
  @JsonKey(name: 'borrow_cap')
  String? get borrowCap;
  @override
  @JsonKey(name: 'collateral_factor_bps')
  String? get collateralFactorBps;
  @override
  @JsonKey(name: 'efficiency_mode_id')
  int? get efficiencyModeId;
  @override
  @JsonKey(name: 'initial_liquidity')
  String? get initialLiquidity;
  @override
  @JsonKey(name: 'paused')
  bool? get paused;
  @override
  @JsonKey(name: 'supply_cap')
  String? get supplyCap;
  @override
  @JsonKey(name: 'total_cash')
  String? get totalCash;
  @override
  @JsonKey(name: 'total_liability')
  String? get totalLiability;
  @override
  @JsonKey(name: 'total_reserve')
  String? get totalReserve;
  @override
  @JsonKey(name: 'total_shares')
  String? get totalShares;
  @override
  @JsonKey(name: 'extend_ref')
  ExtendRefModel? get extendRef;
  @override
  @JsonKey(name: 'interest_rate_index')
  InterestRateIndexModel? get interestRateIndex;

  /// Create a copy of LendPoolModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LendPoolModelImplCopyWith<_$LendPoolModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtendRefModel _$ExtendRefModelFromJson(Map<String, dynamic> json) {
  return _ExtendRefModel.fromJson(json);
}

/// @nodoc
mixin _$ExtendRefModel {
  @JsonKey(name: 'self')
  String? get self => throw _privateConstructorUsedError;

  /// Serializes this ExtendRefModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtendRefModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtendRefModelCopyWith<ExtendRefModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtendRefModelCopyWith<$Res> {
  factory $ExtendRefModelCopyWith(
          ExtendRefModel value, $Res Function(ExtendRefModel) then) =
      _$ExtendRefModelCopyWithImpl<$Res, ExtendRefModel>;
  @useResult
  $Res call({@JsonKey(name: 'self') String? self});
}

/// @nodoc
class _$ExtendRefModelCopyWithImpl<$Res, $Val extends ExtendRefModel>
    implements $ExtendRefModelCopyWith<$Res> {
  _$ExtendRefModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtendRefModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? self = freezed,
  }) {
    return _then(_value.copyWith(
      self: freezed == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExtendRefModelImplCopyWith<$Res>
    implements $ExtendRefModelCopyWith<$Res> {
  factory _$$ExtendRefModelImplCopyWith(_$ExtendRefModelImpl value,
          $Res Function(_$ExtendRefModelImpl) then) =
      __$$ExtendRefModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'self') String? self});
}

/// @nodoc
class __$$ExtendRefModelImplCopyWithImpl<$Res>
    extends _$ExtendRefModelCopyWithImpl<$Res, _$ExtendRefModelImpl>
    implements _$$ExtendRefModelImplCopyWith<$Res> {
  __$$ExtendRefModelImplCopyWithImpl(
      _$ExtendRefModelImpl _value, $Res Function(_$ExtendRefModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExtendRefModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? self = freezed,
  }) {
    return _then(_$ExtendRefModelImpl(
      self: freezed == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtendRefModelImpl extends _ExtendRefModel {
  const _$ExtendRefModelImpl({@JsonKey(name: 'self') this.self}) : super._();

  factory _$ExtendRefModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtendRefModelImplFromJson(json);

  @override
  @JsonKey(name: 'self')
  final String? self;

  @override
  String toString() {
    return 'ExtendRefModel(self: $self)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtendRefModelImpl &&
            (identical(other.self, self) || other.self == self));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, self);

  /// Create a copy of ExtendRefModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtendRefModelImplCopyWith<_$ExtendRefModelImpl> get copyWith =>
      __$$ExtendRefModelImplCopyWithImpl<_$ExtendRefModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtendRefModelImplToJson(
      this,
    );
  }
}

abstract class _ExtendRefModel extends ExtendRefModel {
  const factory _ExtendRefModel({@JsonKey(name: 'self') final String? self}) =
      _$ExtendRefModelImpl;
  const _ExtendRefModel._() : super._();

  factory _ExtendRefModel.fromJson(Map<String, dynamic> json) =
      _$ExtendRefModelImpl.fromJson;

  @override
  @JsonKey(name: 'self')
  String? get self;

  /// Create a copy of ExtendRefModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtendRefModelImplCopyWith<_$ExtendRefModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InterestRateIndexModel _$InterestRateIndexModelFromJson(
    Map<String, dynamic> json) {
  return _InterestRateIndexModel.fromJson(json);
}

/// @nodoc
mixin _$InterestRateIndexModel {
  @JsonKey(name: 'v')
  String? get v => throw _privateConstructorUsedError;

  /// Serializes this InterestRateIndexModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InterestRateIndexModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InterestRateIndexModelCopyWith<InterestRateIndexModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterestRateIndexModelCopyWith<$Res> {
  factory $InterestRateIndexModelCopyWith(InterestRateIndexModel value,
          $Res Function(InterestRateIndexModel) then) =
      _$InterestRateIndexModelCopyWithImpl<$Res, InterestRateIndexModel>;
  @useResult
  $Res call({@JsonKey(name: 'v') String? v});
}

/// @nodoc
class _$InterestRateIndexModelCopyWithImpl<$Res,
        $Val extends InterestRateIndexModel>
    implements $InterestRateIndexModelCopyWith<$Res> {
  _$InterestRateIndexModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InterestRateIndexModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = freezed,
  }) {
    return _then(_value.copyWith(
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterestRateIndexModelImplCopyWith<$Res>
    implements $InterestRateIndexModelCopyWith<$Res> {
  factory _$$InterestRateIndexModelImplCopyWith(
          _$InterestRateIndexModelImpl value,
          $Res Function(_$InterestRateIndexModelImpl) then) =
      __$$InterestRateIndexModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'v') String? v});
}

/// @nodoc
class __$$InterestRateIndexModelImplCopyWithImpl<$Res>
    extends _$InterestRateIndexModelCopyWithImpl<$Res,
        _$InterestRateIndexModelImpl>
    implements _$$InterestRateIndexModelImplCopyWith<$Res> {
  __$$InterestRateIndexModelImplCopyWithImpl(
      _$InterestRateIndexModelImpl _value,
      $Res Function(_$InterestRateIndexModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InterestRateIndexModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = freezed,
  }) {
    return _then(_$InterestRateIndexModelImpl(
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InterestRateIndexModelImpl extends _InterestRateIndexModel {
  const _$InterestRateIndexModelImpl({@JsonKey(name: 'v') this.v}) : super._();

  factory _$InterestRateIndexModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterestRateIndexModelImplFromJson(json);

  @override
  @JsonKey(name: 'v')
  final String? v;

  @override
  String toString() {
    return 'InterestRateIndexModel(v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterestRateIndexModelImpl &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, v);

  /// Create a copy of InterestRateIndexModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InterestRateIndexModelImplCopyWith<_$InterestRateIndexModelImpl>
      get copyWith => __$$InterestRateIndexModelImplCopyWithImpl<
          _$InterestRateIndexModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterestRateIndexModelImplToJson(
      this,
    );
  }
}

abstract class _InterestRateIndexModel extends InterestRateIndexModel {
  const factory _InterestRateIndexModel({@JsonKey(name: 'v') final String? v}) =
      _$InterestRateIndexModelImpl;
  const _InterestRateIndexModel._() : super._();

  factory _InterestRateIndexModel.fromJson(Map<String, dynamic> json) =
      _$InterestRateIndexModelImpl.fromJson;

  @override
  @JsonKey(name: 'v')
  String? get v;

  /// Create a copy of InterestRateIndexModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InterestRateIndexModelImplCopyWith<_$InterestRateIndexModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
