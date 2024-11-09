import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/pool_tvl_apr_chart_data.freezed.dart';
part 'generated/pool_tvl_apr_chart_data.g.dart';

@freezed
class PoolTvlAprChartData with _$PoolTvlAprChartData {
  const factory PoolTvlAprChartData({
    required String apr,
    required String strategyId,
    required String totalValueLocked,
    required String createdAt,
    required String timestamp,
  }) = _PoolTvlAprChartData;

  factory PoolTvlAprChartData.fromJson(Map<String, dynamic> json) =>
      _$PoolTvlAprChartDataFromJson(json);
}
