// pool_inflow_chart_data_entity.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/pool_inflow_chart_data_entity.freezed.dart';

@freezed
class PoolInflowChartDataEntity with _$PoolInflowChartDataEntity {
  const factory PoolInflowChartDataEntity({
    required String strategyId,
    required String inflow24h,
    required String createdAt,
    required String timestamp,
  }) = _PoolInflowChartDataEntity;
}