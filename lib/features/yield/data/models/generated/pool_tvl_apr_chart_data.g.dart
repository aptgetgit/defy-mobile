// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../pool_tvl_apr_chart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoolTvlAprChartDataModel _$PoolTvlAprChartDataModelFromJson(
        Map<String, dynamic> json) =>
    PoolTvlAprChartDataModel(
      apr: json['apr'] as String? ?? '',
      strategyId: json['strategyId'] as String? ?? '',
      totalValueLocked: json['totalValueLocked'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      timestamp: json['timestamp'] as String? ?? '',
    );

Map<String, dynamic> _$PoolTvlAprChartDataModelToJson(
        PoolTvlAprChartDataModel instance) =>
    <String, dynamic>{
      'apr': instance.apr,
      'strategyId': instance.strategyId,
      'totalValueLocked': instance.totalValueLocked,
      'createdAt': instance.createdAt,
      'timestamp': instance.timestamp,
    };
