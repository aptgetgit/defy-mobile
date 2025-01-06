// pool_tvl_apr_chart_data_model.dart

import 'package:defy/features/yield/domain/entities/pool_tvl_apr_chart_data_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/pool_tvl_apr_chart_data.g.dart';

@JsonSerializable()
class PoolTvlAprChartDataModel {
  @JsonKey(name: 'apr', defaultValue: '')
  final String apr;

  @JsonKey(name: 'strategyId', defaultValue: '')
  final String strategyId;

  @JsonKey(name: 'totalValueLocked', defaultValue: '')
  final String totalValueLocked;

  @JsonKey(name: 'createdAt', defaultValue: '')
  final String createdAt;

  @JsonKey(name: 'timestamp', defaultValue: '')
  final String timestamp;

  const PoolTvlAprChartDataModel({
    required this.apr,
    required this.strategyId,
    required this.totalValueLocked,
    required this.createdAt,
    required this.timestamp,
  });

  factory PoolTvlAprChartDataModel.fromJson(Map<String, dynamic> json) => 
      _$PoolTvlAprChartDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PoolTvlAprChartDataModelToJson(this);

  PoolTvlAprChartDataEntity toEntity() {
    return PoolTvlAprChartDataEntity(
      apr: apr,
      strategyId: strategyId,
      totalValueLocked: totalValueLocked,
      createdAt: createdAt,
      timestamp: timestamp,
    );
  }

  factory PoolTvlAprChartDataModel.fromEntity(PoolTvlAprChartDataEntity entity) {
    return PoolTvlAprChartDataModel(
      apr: entity.apr,
      strategyId: entity.strategyId,
      totalValueLocked: entity.totalValueLocked,
      createdAt: entity.createdAt,
      timestamp: entity.timestamp,
    );
  }
}