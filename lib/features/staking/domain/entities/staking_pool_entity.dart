
import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/staking_pool_entity.freezed.dart';

@freezed
class StakingPoolEntity with _$StakingPoolEntity {
  const factory StakingPoolEntity({
    String? operatorAddress,
    String? stakePoolAddress,
    num? rewardsGrowthPercentage,
    String? lastEpochPerformance,
    LocationStatsEntity? locationStats,
    num? totalAptRewardsDistributed,
    String? votingPower,
    num? commissionRate,
    num? activeDelegators,
    String? operatorAptosName,
    String? state,
  })= _StakingPoolEntity;
}

@freezed
class LocationStatsEntity with _$LocationStatsEntity {
  const factory LocationStatsEntity({
    String? peerId,
    num? epoch,
    String? country,
    String? region,
    String? city,
    num? latitude,
    num? longitude,
  })= _LocationStatsEntity;
}