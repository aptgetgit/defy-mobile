import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/pool_response.freezed.dart';
part 'generated/pool_response.g.dart';

@freezed
class PoolResponse with _$PoolResponse {
  const factory PoolResponse({
    required String id,
    required bool isEnabled,
    required List<String> protocols,
    required String apr,
    required String nameId,
    required String description,
    required List<String> stakeToken,
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
    required List<String> weight,
    required String aprAvg,
    required String volume24h,
    required String fee24h,
  }) = _PoolResponse;

  factory PoolResponse.fromJson(Map<String, dynamic> json) =>
      _$PoolResponseFromJson(json);
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
