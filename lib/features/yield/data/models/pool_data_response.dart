import 'package:defy/features/yield/data/models/pool_inflow_chart_data_response.dart';
import 'package:defy/features/yield/data/models/pool_payload_data.dart';
import 'package:defy/features/yield/data/models/pool_tvl_apr_chart_data.dart';
import 'package:defy/features/yield/domain/entities/pool_data_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/pool_data_response.g.dart';

@JsonSerializable()
class PoolDataModel {
  @JsonKey(name: 'id', defaultValue: '')
  final String id;

  @JsonKey(name: 'isEnabled')
  final bool? isEnabled;

  @JsonKey(name: 'protocols', defaultValue: [])
  final List<String> poolProtocols;

  @JsonKey(name: 'apr', defaultValue: '')
  final String apr;

  @JsonKey(name: 'nameId', defaultValue: '')
  final String nameId;

  @JsonKey(name: 'description', defaultValue: '')
  final String description;

  @JsonKey(name: 'pid', defaultValue: '')
  final String pid;

  @JsonKey(name: 'poolType', defaultValue: '')
  final String poolType;

  @JsonKey(name: 'stakeToken', defaultValue: [])
  final List<String> stakeToken;

  @JsonKey(name: 'totalValueLocked', defaultValue: '')
  final String totalValueLocked;

  @JsonKey(name: 'tvlToken', defaultValue: '')
  final String tvlToken;

  @JsonKey(name: 'withdrawalSlippage', defaultValue: '')
  final String withdrawalSlippage;

  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @JsonKey(name: 'displayName', defaultValue: '')
  final String displayName;

  @JsonKey(name: 'strategyType', defaultValue: '')
  final String strategyType;

  @JsonKey(name: 'rewardToken', defaultValue: [])
  final List<String> rewardToken;

  @JsonKey(name: 'positionToken', defaultValue: '')
  final String positionToken;

  @JsonKey(name: 'feeToken', defaultValue: [])
  final List<String> feeToken;

  @JsonKey(name: 'depositFee', defaultValue: '')
  final String depositFee;

  @JsonKey(name: 'risk', defaultValue: '')
  final String risk;

  @JsonKey(name: 'withdrawalFee', defaultValue: '')
  final String withdrawalFee;

  @JsonKey(name: 'depositSwapFee', defaultValue: '')
  final String depositSwapFee;

  @JsonKey(name: 'withdrawalSwapFee', defaultValue: '')
  final String withdrawalSwapFee;

  @JsonKey(name: 'stakers', defaultValue: '')
  final String stakers;

  @JsonKey(name: 'liquidityType', defaultValue: '')
  final String liquidityType;

  @JsonKey(name: 'weight', defaultValue: [])
  final List<String> weight;

  @JsonKey(name: 'aprAvg', defaultValue: '')
  final String aprAvg;

  @JsonKey(name: 'vibrantFee', defaultValue: '')
  final String vibrantFee;

  @JsonKey(name: 'volume24h', defaultValue: '')
  final String volume24h;

  @JsonKey(name: 'fee24h', defaultValue: '')
  final String fee24h;

  @JsonKey(name: 'inflow24h', defaultValue: '')
  final String inflow24h;

  @JsonKey(name: 'minApr', defaultValue: '')
  final String minApr;

  @JsonKey(name: 'maxApr', defaultValue: '')
  final String maxApr;

  @JsonKey(name: 'maxLeverage', defaultValue: '')
  final String maxLeverage;

  @JsonKey(name: 'borrowApr', defaultValue: '')
  final String borrowApr;

  @JsonKey(name: 'airdropPoint', defaultValue: '')
  final String airdropPoint;

  @JsonKey(name: 'inflowChartData', defaultValue: [])
  final List<PoolInflowChartDataModel> inflowChartData;

  @JsonKey(name: 'tvlAprChartData', defaultValue: [])
  final List<PoolTvlAprChartDataModel> tvlAprChartData;

  @JsonKey(name: 'ariesDetail')
  final String? ariesDetail;

  @JsonKey(name: 'echelonDetail')
  final String? echelonDetail;

  @JsonKey(name: 'leverageResponseDto')
  final String? leverageResponseDto;

  @JsonKey(name: 'payload')
  final PoolPayloadDataModel payload;

  const PoolDataModel({
    required this.id,
    this.isEnabled,
    required this.poolProtocols,
    required this.apr,
    required this.nameId,
    required this.description,
    required this.pid,
    required this.poolType,
    required this.stakeToken,
    required this.totalValueLocked,
    required this.tvlToken,
    required this.withdrawalSlippage,
    required this.name,
    required this.displayName,
    required this.strategyType,
    required this.rewardToken,
    required this.positionToken,
    required this.feeToken,
    required this.depositFee,
    required this.risk,
    required this.withdrawalFee,
    required this.depositSwapFee,
    required this.withdrawalSwapFee,
    required this.stakers,
    required this.liquidityType,
    required this.weight,
    required this.aprAvg,
    required this.vibrantFee,
    required this.volume24h,
    required this.fee24h,
    required this.inflow24h,
    required this.minApr,
    required this.maxApr,
    required this.maxLeverage,
    required this.borrowApr,
    required this.airdropPoint,
    required this.inflowChartData,
    required this.tvlAprChartData,
    this.ariesDetail,
    this.echelonDetail,
    this.leverageResponseDto,
    required this.payload,
  });

  factory PoolDataModel.fromJson(Map<String, dynamic> json) => _$PoolDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PoolDataModelToJson(this);

  PoolDataEntity toEntity() {
    return PoolDataEntity(
      id: id,
      isEnabled: isEnabled,
      poolProtocols: poolProtocols,
      apr: apr,
      nameId: nameId,
      description: description,
      pid: pid,
      poolType: poolType,
      stakeToken: stakeToken,
      totalValueLocked: totalValueLocked,
      tvlToken: tvlToken,
      withdrawalSlippage: withdrawalSlippage,
      name: name,
      displayName: displayName,
      strategyType: strategyType,
      rewardToken: rewardToken,
      positionToken: positionToken,
      feeToken: feeToken,
      depositFee: depositFee,
      risk: risk,
      withdrawalFee: withdrawalFee,
      depositSwapFee: depositSwapFee,
      withdrawalSwapFee: withdrawalSwapFee,
      stakers: stakers,
      liquidityType: liquidityType,
      weight: weight,
      aprAvg: aprAvg,
      vibrantFee: vibrantFee,
      volume24h: volume24h,
      fee24h: fee24h,
      inflow24h: inflow24h,
      minApr: minApr,
      maxApr: maxApr,
      maxLeverage: maxLeverage,
      borrowApr: borrowApr,
      airdropPoint: airdropPoint,
      inflowChartData: inflowChartData.map((e) => e.toEntity()).toList(),
      tvlAprChartData: tvlAprChartData.map((e) => e.toEntity()).toList(),
      ariesDetail: ariesDetail,
      echelonDetail: echelonDetail,
      leverageResponseDto: leverageResponseDto,
      payload: payload.toEntity(),
    );
  }

  factory PoolDataModel.fromEntity(PoolDataEntity entity) {
    return PoolDataModel(
      id: entity.id,
      isEnabled: entity.isEnabled,
      poolProtocols: entity.poolProtocols,
      apr: entity.apr,
      nameId: entity.nameId,
      description: entity.description,
      pid: entity.pid,
      poolType: entity.poolType,
      stakeToken: entity.stakeToken,
      totalValueLocked: entity.totalValueLocked,
      tvlToken: entity.tvlToken,
      withdrawalSlippage: entity.withdrawalSlippage,
      name: entity.name,
      displayName: entity.displayName,
      strategyType: entity.strategyType,
      rewardToken: entity.rewardToken,
      positionToken: entity.positionToken,
      feeToken: entity.feeToken,
      depositFee: entity.depositFee,
      risk: entity.risk,
      withdrawalFee: entity.withdrawalFee,
      depositSwapFee: entity.depositSwapFee,
      withdrawalSwapFee: entity.withdrawalSwapFee,
      stakers: entity.stakers,
      liquidityType: entity.liquidityType,
      weight: entity.weight,
      aprAvg: entity.aprAvg,
      vibrantFee: entity.vibrantFee,
      volume24h: entity.volume24h,
      fee24h: entity.fee24h,
      inflow24h: entity.inflow24h,
      minApr: entity.minApr,
      maxApr: entity.maxApr,
      maxLeverage: entity.maxLeverage,
      borrowApr: entity.borrowApr,
      airdropPoint: entity.airdropPoint,
      inflowChartData: entity.inflowChartData.map((e) => PoolInflowChartDataModel.fromEntity(e)).toList(),
      tvlAprChartData: entity.tvlAprChartData.map((e) => PoolTvlAprChartDataModel.fromEntity(e)).toList(),
      ariesDetail: entity.ariesDetail,
      echelonDetail: entity.echelonDetail,
      leverageResponseDto: entity.leverageResponseDto,
      payload: PoolPayloadDataModel.fromEntity(entity.payload),
    );
  }
}