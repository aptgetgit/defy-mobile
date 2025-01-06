import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/lend_pool_entity.dart';

part 'generated/lend_pool_model.freezed.dart';
part 'generated/lend_pool_model.g.dart';

@freezed
class LendPoolModel with _$LendPoolModel {
  const LendPoolModel._();

  const factory LendPoolModel({
    @JsonKey(name: 'id') String? id,
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
    @JsonKey(name: 'interest_rate_index') InterestRateIndexModel? interestRateIndex,
  }) = _LendPoolModel;

  factory LendPoolModel.fromJson(Map<String, dynamic> json) =>
      _$LendPoolModelFromJson(json);

  LendPoolEntity toEntity() => LendPoolEntity(
        id: id,
        marketCoin: marketCoin,
        borrowApr: borrowApr,
        supplyApr: supplyApr,
        assetMantissa: assetMantissa,
        assetName: assetName,
        assetType: assetType,
        borrowCap: borrowCap,
        collateralFactorBps: collateralFactorBps,
        efficiencyModeId: efficiencyModeId,
        initialLiquidity: initialLiquidity,
        paused: paused,
        supplyCap: supplyCap,
        totalCash: totalCash,
        totalLiability: totalLiability,
        totalReserve: totalReserve,
        totalShares: totalShares,
        extendRef: extendRef?.toEntity(),
        interestRateIndex: interestRateIndex?.toEntity(),
      );
}

@freezed
class ExtendRefModel with _$ExtendRefModel {
  const ExtendRefModel._();

  const factory ExtendRefModel({
    @JsonKey(name: 'self') String? self,
  }) = _ExtendRefModel;

  factory ExtendRefModel.fromJson(Map<String, dynamic> json) =>
      _$ExtendRefModelFromJson(json);

  ExtendRefEntity toEntity() => ExtendRefEntity(self: self);
}

@freezed
class InterestRateIndexModel with _$InterestRateIndexModel {
  const InterestRateIndexModel._();

  const factory InterestRateIndexModel({
    @JsonKey(name: 'v') String? v,
  }) = _InterestRateIndexModel;

  factory InterestRateIndexModel.fromJson(Map<String, dynamic> json) =>
      _$InterestRateIndexModelFromJson(json);

  InterestRateIndexEntity toEntity() => InterestRateIndexEntity(v: v);
}