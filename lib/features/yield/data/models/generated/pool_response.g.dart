// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../pool_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoolResponseImpl _$$PoolResponseImplFromJson(Map<String, dynamic> json) =>
    _$PoolResponseImpl(
      id: json['id'] as String,
      isEnabled: json['is_enabled'] as bool,
      protocols:
          (json['protocols'] as List<dynamic>).map((e) => e as String).toList(),
      apr: json['apr'] as String,
      nameId: json['name_id'] as String,
      description: json['description'] as String,
      stakeToken: (json['stake_token'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      totalValueLocked: json['total_value_locked'] as String,
      tvlToken: json['tvl_token'] as String,
      withdrawalSlippage: json['withdrawal_slippage'] as String,
      name: json['name'] as String,
      displayName: json['display_name'] as String,
      strategyType: json['strategy_type'] as String,
      rewardToken: parseRewardToken(json['reward_token']),
      positionToken: json['position_token'] as String,
      feeToken: parseFeeToken(json['fee_token']),
      depositFee: json['deposit_fee'] as String,
      risk: json['risk'] as String,
      withdrawalFee: json['withdrawal_fee'] as String,
      depositSwapFee: json['deposit_swap_fee'] as String,
      withdrawalSwapFee: json['withdrawal_swap_fee'] as String,
      stakers: json['stakers'] as String,
      liquidityType: json['liquidity_type'] as String,
      weight:
          (json['weight'] as List<dynamic>).map((e) => e as String).toList(),
      aprAvg: json['apr_avg'] as String,
      volume24h: json['volume24h'] as String,
      fee24h: json['fee24h'] as String,
    );

Map<String, dynamic> _$$PoolResponseImplToJson(_$PoolResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_enabled': instance.isEnabled,
      'protocols': instance.protocols,
      'apr': instance.apr,
      'name_id': instance.nameId,
      'description': instance.description,
      'stake_token': instance.stakeToken,
      'total_value_locked': instance.totalValueLocked,
      'tvl_token': instance.tvlToken,
      'withdrawal_slippage': instance.withdrawalSlippage,
      'name': instance.name,
      'display_name': instance.displayName,
      'strategy_type': instance.strategyType,
      'reward_token': instance.rewardToken,
      'position_token': instance.positionToken,
      'fee_token': instance.feeToken,
      'deposit_fee': instance.depositFee,
      'risk': instance.risk,
      'withdrawal_fee': instance.withdrawalFee,
      'deposit_swap_fee': instance.depositSwapFee,
      'withdrawal_swap_fee': instance.withdrawalSwapFee,
      'stakers': instance.stakers,
      'liquidity_type': instance.liquidityType,
      'weight': instance.weight,
      'apr_avg': instance.aprAvg,
      'volume24h': instance.volume24h,
      'fee24h': instance.fee24h,
    };
