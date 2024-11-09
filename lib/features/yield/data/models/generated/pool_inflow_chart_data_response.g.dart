// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../pool_inflow_chart_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoolInflowChartDataResponseImpl _$$PoolInflowChartDataResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PoolInflowChartDataResponseImpl(
      strategyId: json['strategy_id'] as String,
      inflow24h: json['inflow24h'] as String,
      createdAt: json['created_at'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$$PoolInflowChartDataResponseImplToJson(
        _$PoolInflowChartDataResponseImpl instance) =>
    <String, dynamic>{
      'strategy_id': instance.strategyId,
      'inflow24h': instance.inflow24h,
      'created_at': instance.createdAt,
      'timestamp': instance.timestamp,
    };
