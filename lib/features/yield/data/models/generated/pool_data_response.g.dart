// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../pool_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoolDataModel _$PoolDataModelFromJson(Map<String, dynamic> json) =>
    PoolDataModel(
      id: json['id'] as String? ?? '',
      isEnabled: json['isEnabled'] as bool?,
      poolProtocols: (json['protocols'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      apr: json['apr'] as String? ?? '',
      nameId: json['nameId'] as String? ?? '',
      description: json['description'] as String? ?? '',
      pid: json['pid'] as String? ?? '',
      poolType: json['poolType'] as String? ?? '',
      stakeToken: (json['stakeToken'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      totalValueLocked: json['totalValueLocked'] as String? ?? '',
      tvlToken: json['tvlToken'] as String? ?? '',
      withdrawalSlippage: json['withdrawalSlippage'] as String? ?? '',
      name: json['name'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
      strategyType: json['strategyType'] as String? ?? '',
      rewardToken: (json['rewardToken'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      positionToken: json['positionToken'] as String? ?? '',
      feeToken: (json['feeToken'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      depositFee: json['depositFee'] as String? ?? '',
      risk: json['risk'] as String? ?? '',
      withdrawalFee: json['withdrawalFee'] as String? ?? '',
      depositSwapFee: json['depositSwapFee'] as String? ?? '',
      withdrawalSwapFee: json['withdrawalSwapFee'] as String? ?? '',
      stakers: json['stakers'] as String? ?? '',
      liquidityType: json['liquidityType'] as String? ?? '',
      weight: (json['weight'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      aprAvg: json['aprAvg'] as String? ?? '',
      vibrantFee: json['vibrantFee'] as String? ?? '',
      volume24h: json['volume24h'] as String? ?? '',
      fee24h: json['fee24h'] as String? ?? '',
      inflow24h: json['inflow24h'] as String? ?? '',
      minApr: json['minApr'] as String? ?? '',
      maxApr: json['maxApr'] as String? ?? '',
      maxLeverage: json['maxLeverage'] as String? ?? '',
      borrowApr: json['borrowApr'] as String? ?? '',
      airdropPoint: json['airdropPoint'] as String? ?? '',
      inflowChartData: (json['inflowChartData'] as List<dynamic>?)
              ?.map((e) =>
                  PoolInflowChartDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tvlAprChartData: (json['tvlAprChartData'] as List<dynamic>?)
              ?.map((e) =>
                  PoolTvlAprChartDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      ariesDetail: json['ariesDetail'] as String?,
      echelonDetail: json['echelonDetail'] as String?,
      leverageResponseDto: json['leverageResponseDto'] as String?,
      payload: PoolPayloadDataModel.fromJson(
          json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PoolDataModelToJson(PoolDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isEnabled': instance.isEnabled,
      'protocols': instance.poolProtocols,
      'apr': instance.apr,
      'nameId': instance.nameId,
      'description': instance.description,
      'pid': instance.pid,
      'poolType': instance.poolType,
      'stakeToken': instance.stakeToken,
      'totalValueLocked': instance.totalValueLocked,
      'tvlToken': instance.tvlToken,
      'withdrawalSlippage': instance.withdrawalSlippage,
      'name': instance.name,
      'displayName': instance.displayName,
      'strategyType': instance.strategyType,
      'rewardToken': instance.rewardToken,
      'positionToken': instance.positionToken,
      'feeToken': instance.feeToken,
      'depositFee': instance.depositFee,
      'risk': instance.risk,
      'withdrawalFee': instance.withdrawalFee,
      'depositSwapFee': instance.depositSwapFee,
      'withdrawalSwapFee': instance.withdrawalSwapFee,
      'stakers': instance.stakers,
      'liquidityType': instance.liquidityType,
      'weight': instance.weight,
      'aprAvg': instance.aprAvg,
      'vibrantFee': instance.vibrantFee,
      'volume24h': instance.volume24h,
      'fee24h': instance.fee24h,
      'inflow24h': instance.inflow24h,
      'minApr': instance.minApr,
      'maxApr': instance.maxApr,
      'maxLeverage': instance.maxLeverage,
      'borrowApr': instance.borrowApr,
      'airdropPoint': instance.airdropPoint,
      'inflowChartData': instance.inflowChartData,
      'tvlAprChartData': instance.tvlAprChartData,
      'ariesDetail': instance.ariesDetail,
      'echelonDetail': instance.echelonDetail,
      'leverageResponseDto': instance.leverageResponseDto,
      'payload': instance.payload,
    };
