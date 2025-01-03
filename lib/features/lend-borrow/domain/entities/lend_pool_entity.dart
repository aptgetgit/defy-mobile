import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/lend_pool_entity.freezed.dart';

@freezed
class LendPoolEntity with _$LendPoolEntity {
  const factory LendPoolEntity({
    String? id,
    String? marketCoin,
    double? borrowApr,
    double? supplyApr,
    String? assetMantissa,
    String? assetName,
    String? assetType,
    String? borrowCap,
    String? collateralFactorBps,
    int? efficiencyModeId,
    String? initialLiquidity,
    bool? paused,
    String? supplyCap,
    String? totalCash,
    String? totalLiability,
    String? totalReserve,
    String? totalShares,
    ExtendRefEntity? extendRef,
    InterestRateIndexEntity? interestRateIndex,
  }) = _LendPoolEntity;
}

@freezed
class ExtendRefEntity with _$ExtendRefEntity {
  const factory ExtendRefEntity({
    String? self,
  }) = _ExtendRefEntity;
}

@freezed
class InterestRateIndexEntity with _$InterestRateIndexEntity {
  const factory InterestRateIndexEntity({
    String? v,
  }) = _InterestRateIndexEntity;
}