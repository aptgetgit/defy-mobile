import 'package:defy/features/yield/data/models/pool_inflow_chart_data_response.dart';
import 'package:defy/features/yield/data/models/pool_payload_data.dart';
import 'package:defy/features/yield/data/models/pool_tvl_apr_chart_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/pool_data_response.freezed.dart';
part 'generated/pool_data_response.g.dart';

@freezed
class PoolDataResponse with _$PoolDataResponse {
  factory PoolDataResponse({
    required String id,
    required bool isEnabled,
    @JsonKey(fromJson: parseProtocols) required List<String> poolProtocols,
    required String apr,
    required String nameId,
    required String description,
    required String pid,
    required String poolType,
    @JsonKey(fromJson: parseStakeToken) required List<String> stakeToken,
    required String totalValueLocked,
    required String tvlToken,
    required String withdrawalSlippage,
    required String name,
    required String displayName,
    required String strategyType,
    @JsonKey(fromJson: parseRewardToken) required List<String> rewardToken,
    required String positionToken,
    @JsonKey(fromJson: parseFeeToken) required List<String> feeToken,
    required String depositFee,
    required String risk,
    required String withdrawalFee,
    required String depositSwapFee,
    required String withdrawalSwapFee,
    required String stakers,
    required String liquidityType,
    @JsonKey(fromJson: parseWeight) required List<String> weight,
    required String aprAvg,
    required String vibrantFee,
    required String volume24h,
    required String fee24h,
    required String inflow24h,
    required String minApr,
    required String maxApr,
    required String maxLeverage,
    required String borrowApr,
    required String airdropPoint,
    @JsonKey(fromJson: parsePoolInflowChartData)
    required List<PoolInflowChartDataResponse> inflowChartData,
    @JsonKey(fromJson: parseTvlAprChartData)
    required List<PoolTvlAprChartData> tvlAprChartData,
    String? ariesDetail,
    String? echelonDetail,
    String? leverageResponseDto,
    required PoolPayloadData payload,
  }) = _PoolDataResponse;

  factory PoolDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PoolDataResponseFromJson(json);
}

List<String> parseFeeToken(dynamic value) {
  if (value is String) {
    return value.isEmpty ? [] : [value];
  } else if (value is List) {
    return List<String>.from(value);
  } else {
    return [];
  }
}

List<String> parseRewardToken(dynamic value) {
  if (value is String) {
    return value.isEmpty ? [] : [value];
  } else if (value is List) {
    return List<String>.from(value);
  } else {
    return [];
  }
}

List<String> parseWeight(dynamic value) {
  if (value is String) {
    return value.isEmpty ? [] : [value];
  } else if (value is List) {
    return List<String>.from(value);
  } else {
    return [];
  }
}

List<String> parseProtocols(dynamic value) {
  if (value is String) {
    return value.isEmpty ? [] : [value];
  } else if (value is List) {
    return List<String>.from(value);
  } else {
    return [];
  }
}

List<String> parseStakeToken(dynamic value) {
  if (value is String) {
    return value.isEmpty ? [] : [value];
  } else if (value is List) {
    return List<String>.from(value);
  } else {
    return [];
  }
}

List<PoolInflowChartDataResponse> parsePoolInflowChartData(dynamic value) {
  if (value is List) {
    return List<PoolInflowChartDataResponse>.from(
        value.map((e) => PoolInflowChartDataResponse.fromJson(e)));
  } else {
    return [];
  }
}

List<PoolTvlAprChartData> parseTvlAprChartData(dynamic value) {
  if (value is List) {
    return List<PoolTvlAprChartData>.from(
        value.map((e) => PoolTvlAprChartData.fromJson(e)));
  } else {
    return [];
  }
}
