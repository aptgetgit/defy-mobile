// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../pool_inflow_chart_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoolInflowChartDataModel _$PoolInflowChartDataModelFromJson(
        Map<String, dynamic> json) =>
    PoolInflowChartDataModel(
      strategyId: json['strategyId'] as String? ?? '',
      inflow24h: json['inflow24h'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      timestamp: json['timestamp'] as String? ?? '',
    );

Map<String, dynamic> _$PoolInflowChartDataModelToJson(
        PoolInflowChartDataModel instance) =>
    <String, dynamic>{
      'strategyId': instance.strategyId,
      'inflow24h': instance.inflow24h,
      'createdAt': instance.createdAt,
      'timestamp': instance.timestamp,
    };
