// pool_data_entity.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'pool_inflow_chart_data_entity.dart';
import 'pool_tvl_apr_chart_data_entity.dart';
import 'pool_payload_data_entity.dart';

part 'generated/pool_data_entity.freezed.dart';

@freezed
class PoolDataEntity with _$PoolDataEntity {
  const factory PoolDataEntity({
    required String id,
    bool? isEnabled,
    required List<String> poolProtocols,
    required String apr,
    required String nameId,
    required String description,
    required String pid,
    required String poolType,
    required List<String> stakeToken,
    required String totalValueLocked,
    required String tvlToken,
    required String withdrawalSlippage,
    required String name,
    required String displayName,
    required String strategyType,
    required List<String> rewardToken,
    required String positionToken,
    required List<String> feeToken,
    required String depositFee,
    required String risk,
    required String withdrawalFee,
    required String depositSwapFee,
    required String withdrawalSwapFee,
    required String stakers,
    required String liquidityType,
    required List<String> weight,
    required String aprAvg,
    required String vibrantFee,
    required String volume24h,
    required String fee24h,
    required String inflow24h,
    required String minApr,
    required String maxApr,
    required String maxLeverage,
    required String borrowApr,
    required String airdropPoint,
    required List<PoolInflowChartDataEntity> inflowChartData,
    required List<PoolTvlAprChartDataEntity> tvlAprChartData,
    String? ariesDetail,
    String? echelonDetail,
    String? leverageResponseDto,
    required PoolPayloadDataEntity payload,
  }) = _PoolDataEntity;
}