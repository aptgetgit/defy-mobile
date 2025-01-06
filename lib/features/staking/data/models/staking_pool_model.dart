// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/staking_pool_entity.dart';

part 'generated/staking_pool_model.freezed.dart';
part 'generated/staking_pool_model.g.dart';

@freezed
class StakingPoolModel with _$StakingPoolModel {
  const StakingPoolModel._();

  const factory StakingPoolModel({
    @JsonKey(name: 'operator_address') String? operatorAddress,
    @JsonKey(name: 'stake_pool_address') String? stakePoolAddress,
    @JsonKey(name: 'rewards_growth_percentage') num? rewardsGrowthPercentage,
    @JsonKey(name: 'last_epoch_performance') String? lastEpochPerformance,
    @JsonKey(name: 'location_stats') LocationStatsModel? locationStats,
    @JsonKey(name: 'total_apt_rewards_distributed') num? totalAptRewardsDistributed,
    @JsonKey(name: 'voting_power') String? votingPower,
    @JsonKey(name: 'commission_rate') num? commissionRate,
    @JsonKey(name: 'active_delegators') num? activeDelegators,
    @JsonKey(name: 'operator_aptos_name') String? operatorAptosName,
    @JsonKey(name: 'state') String? state,
  }) = _StakingPoolModel;

  factory StakingPoolModel.fromJson(Map<String, dynamic> json) =>
      _$StakingPoolModelFromJson(json);

  StakingPoolEntity toEntity() {
    return StakingPoolEntity(
      operatorAddress: operatorAddress,
      stakePoolAddress: stakePoolAddress,
      rewardsGrowthPercentage: rewardsGrowthPercentage,
      lastEpochPerformance: lastEpochPerformance,
      locationStats: locationStats?.toEntity(),
      totalAptRewardsDistributed: totalAptRewardsDistributed,
      votingPower: votingPower,
      commissionRate: commissionRate,
      activeDelegators: activeDelegators,
      operatorAptosName: operatorAptosName,
      state: state,
    );
  }

  factory StakingPoolModel.fromEntity(StakingPoolEntity entity) {
    return StakingPoolModel(
      operatorAddress: entity.operatorAddress,
      stakePoolAddress: entity.stakePoolAddress,
      rewardsGrowthPercentage: entity.rewardsGrowthPercentage,
      lastEpochPerformance: entity.lastEpochPerformance,
      locationStats: entity.locationStats != null
          ? LocationStatsModel.fromEntity(entity.locationStats!)
          : null,
      totalAptRewardsDistributed: entity.totalAptRewardsDistributed,
      votingPower: entity.votingPower,
      commissionRate: entity.commissionRate,
      activeDelegators: entity.activeDelegators,
      operatorAptosName: entity.operatorAptosName,
      state: entity.state,
    );
  }
}

@freezed
class LocationStatsModel with _$LocationStatsModel {
  const LocationStatsModel._();

  const factory LocationStatsModel({
    @JsonKey(name: 'peer_id') String? peerId,
    @JsonKey(name: 'epoch') num? epoch,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'region') String? region,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'latitude') num? latitude,
    @JsonKey(name: 'longitude') num? longitude,
  }) = _LocationStatsModel;

  factory LocationStatsModel.fromJson(Map<String, dynamic> json) =>
      _$LocationStatsModelFromJson(json);

  LocationStatsEntity toEntity() {
    return LocationStatsEntity(
      peerId: peerId,
      epoch: epoch,
      country: country,
      region: region,
      city: city,
      latitude: latitude,
      longitude: longitude,
    );
  }

  factory LocationStatsModel.fromEntity(LocationStatsEntity entity) {
    return LocationStatsModel(
      peerId: entity.peerId,
      epoch: entity.epoch,
      country: entity.country,
      region: entity.region,
      city: entity.city,
      latitude: entity.latitude,
      longitude: entity.longitude,
    );
  }
}