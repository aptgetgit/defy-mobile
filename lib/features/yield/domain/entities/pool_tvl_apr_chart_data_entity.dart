// pool_tvl_apr_chart_data_entity.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/pool_tvl_apr_chart_data_entity.freezed.dart';

@freezed
class PoolTvlAprChartDataEntity with _$PoolTvlAprChartDataEntity {
  const factory PoolTvlAprChartDataEntity({
    required String apr,
    required String strategyId,
    required String totalValueLocked,
    required String createdAt,
    required String timestamp,
  }) = _PoolTvlAprChartDataEntity;
}