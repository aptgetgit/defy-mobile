// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../pool_tvl_apr_chart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoolTvlAprChartDataImpl _$$PoolTvlAprChartDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PoolTvlAprChartDataImpl(
      apr: json['apr'] as String,
      strategyId: json['strategy_id'] as String,
      totalValueLocked: json['total_value_locked'] as String,
      createdAt: json['created_at'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$$PoolTvlAprChartDataImplToJson(
        _$PoolTvlAprChartDataImpl instance) =>
    <String, dynamic>{
      'apr': instance.apr,
      'strategy_id': instance.strategyId,
      'total_value_locked': instance.totalValueLocked,
      'created_at': instance.createdAt,
      'timestamp': instance.timestamp,
    };
