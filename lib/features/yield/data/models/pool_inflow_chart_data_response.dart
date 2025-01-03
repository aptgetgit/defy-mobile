// pool_inflow_chart_data_model.dart

import 'package:defy/features/yield/domain/entities/pool_inflow_chart_data_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/pool_inflow_chart_data_response.g.dart';

@JsonSerializable()
class PoolInflowChartDataModel {
  @JsonKey(name: 'strategyId', defaultValue: '')
  final String strategyId;

  @JsonKey(name: 'inflow24h', defaultValue: '')
  final String inflow24h;

  @JsonKey(name: 'createdAt', defaultValue: '')
  final String createdAt;

  @JsonKey(name: 'timestamp', defaultValue: '')
  final String timestamp;

  const PoolInflowChartDataModel({
    required this.strategyId,
    required this.inflow24h,
    required this.createdAt,
    required this.timestamp,
  });

  factory PoolInflowChartDataModel.fromJson(Map<String, dynamic> json) => 
      _$PoolInflowChartDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PoolInflowChartDataModelToJson(this);

  PoolInflowChartDataEntity toEntity() {
    return PoolInflowChartDataEntity(
      strategyId: strategyId,
      inflow24h: inflow24h,
      createdAt: createdAt,
      timestamp: timestamp,
    );
  }

  factory PoolInflowChartDataModel.fromEntity(PoolInflowChartDataEntity entity) {
    return PoolInflowChartDataModel(
      strategyId: entity.strategyId,
      inflow24h: entity.inflow24h,
      createdAt: entity.createdAt,
      timestamp: entity.timestamp,
    );
  }
}