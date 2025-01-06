// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../lend_pool_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LendPoolModelImpl _$$LendPoolModelImplFromJson(Map<String, dynamic> json) =>
    _$LendPoolModelImpl(
      id: json['id'] as String?,
      marketCoin: json['marketCoin'] as String?,
      borrowApr: (json['borrowApr'] as num?)?.toDouble(),
      supplyApr: (json['supplyApr'] as num?)?.toDouble(),
      assetMantissa: json['asset_mantissa'] as String?,
      assetName: json['asset_name'] as String?,
      assetType: json['asset_type'] as String?,
      borrowCap: json['borrow_cap'] as String?,
      collateralFactorBps: json['collateral_factor_bps'] as String?,
      efficiencyModeId: (json['efficiency_mode_id'] as num?)?.toInt(),
      initialLiquidity: json['initial_liquidity'] as String?,
      paused: json['paused'] as bool?,
      supplyCap: json['supply_cap'] as String?,
      totalCash: json['total_cash'] as String?,
      totalLiability: json['total_liability'] as String?,
      totalReserve: json['total_reserve'] as String?,
      totalShares: json['total_shares'] as String?,
      extendRef: json['extend_ref'] == null
          ? null
          : ExtendRefModel.fromJson(json['extend_ref'] as Map<String, dynamic>),
      interestRateIndex: json['interest_rate_index'] == null
          ? null
          : InterestRateIndexModel.fromJson(
              json['interest_rate_index'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LendPoolModelImplToJson(_$LendPoolModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'marketCoin': instance.marketCoin,
      'borrowApr': instance.borrowApr,
      'supplyApr': instance.supplyApr,
      'asset_mantissa': instance.assetMantissa,
      'asset_name': instance.assetName,
      'asset_type': instance.assetType,
      'borrow_cap': instance.borrowCap,
      'collateral_factor_bps': instance.collateralFactorBps,
      'efficiency_mode_id': instance.efficiencyModeId,
      'initial_liquidity': instance.initialLiquidity,
      'paused': instance.paused,
      'supply_cap': instance.supplyCap,
      'total_cash': instance.totalCash,
      'total_liability': instance.totalLiability,
      'total_reserve': instance.totalReserve,
      'total_shares': instance.totalShares,
      'extend_ref': instance.extendRef,
      'interest_rate_index': instance.interestRateIndex,
    };

_$ExtendRefModelImpl _$$ExtendRefModelImplFromJson(Map<String, dynamic> json) =>
    _$ExtendRefModelImpl(
      self: json['self'] as String?,
    );

Map<String, dynamic> _$$ExtendRefModelImplToJson(
        _$ExtendRefModelImpl instance) =>
    <String, dynamic>{
      'self': instance.self,
    };

_$InterestRateIndexModelImpl _$$InterestRateIndexModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InterestRateIndexModelImpl(
      v: json['v'] as String?,
    );

Map<String, dynamic> _$$InterestRateIndexModelImplToJson(
        _$InterestRateIndexModelImpl instance) =>
    <String, dynamic>{
      'v': instance.v,
    };
