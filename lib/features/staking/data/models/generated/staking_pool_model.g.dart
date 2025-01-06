// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../staking_pool_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StakingPoolModelImpl _$$StakingPoolModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StakingPoolModelImpl(
      operatorAddress: json['operator_address'] as String?,
      stakePoolAddress: json['stake_pool_address'] as String?,
      rewardsGrowthPercentage: json['rewards_growth_percentage'] as num?,
      lastEpochPerformance: json['last_epoch_performance'] as String?,
      locationStats: json['location_stats'] == null
          ? null
          : LocationStatsModel.fromJson(
              json['location_stats'] as Map<String, dynamic>),
      totalAptRewardsDistributed: json['total_apt_rewards_distributed'] as num?,
      votingPower: json['voting_power'] as String?,
      commissionRate: json['commission_rate'] as num?,
      activeDelegators: json['active_delegators'] as num?,
      operatorAptosName: json['operator_aptos_name'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$StakingPoolModelImplToJson(
        _$StakingPoolModelImpl instance) =>
    <String, dynamic>{
      'operator_address': instance.operatorAddress,
      'stake_pool_address': instance.stakePoolAddress,
      'rewards_growth_percentage': instance.rewardsGrowthPercentage,
      'last_epoch_performance': instance.lastEpochPerformance,
      'location_stats': instance.locationStats,
      'total_apt_rewards_distributed': instance.totalAptRewardsDistributed,
      'voting_power': instance.votingPower,
      'commission_rate': instance.commissionRate,
      'active_delegators': instance.activeDelegators,
      'operator_aptos_name': instance.operatorAptosName,
      'state': instance.state,
    };

_$LocationStatsModelImpl _$$LocationStatsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationStatsModelImpl(
      peerId: json['peer_id'] as String?,
      epoch: json['epoch'] as num?,
      country: json['country'] as String?,
      region: json['region'] as String?,
      city: json['city'] as String?,
      latitude: json['latitude'] as num?,
      longitude: json['longitude'] as num?,
    );

Map<String, dynamic> _$$LocationStatsModelImplToJson(
        _$LocationStatsModelImpl instance) =>
    <String, dynamic>{
      'peer_id': instance.peerId,
      'epoch': instance.epoch,
      'country': instance.country,
      'region': instance.region,
      'city': instance.city,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
