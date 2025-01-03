import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/pool_response_entity.freezed.dart';

@freezed
class PoolResponseEntity with _$PoolResponseEntity {
  const factory PoolResponseEntity({
    String? id,
    bool? isEnabled,
    List<String>? protocols,
    String? apr,
    String? nameId,
    String? description,
    List<String>? stakeToken,
    String? totalValueLocked,
    String? tvlToken,
    String? withdrawalSlippage,
    String? name,
    String? displayName,
    String? strategyType,
    List<String>? rewardToken,
    String? positionToken,
    List<String>? feeToken,
    String? depositFee,
    String? risk,
    String? withdrawalFee,
    String? depositSwapFee,
    String? withdrawalSwapFee,
    String? stakers,
    String? liquidityType,
    List<String>? weight,
    String? aprAvg,
    String? volume24h,
    String? fee24h,
  }) = _PoolResponseEntity;
}