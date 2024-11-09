import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/pool_inflow_chart_data_response.freezed.dart';
part 'generated/pool_inflow_chart_data_response.g.dart';

@freezed 
class PoolInflowChartDataResponse with _$PoolInflowChartDataResponse {
  const factory PoolInflowChartDataResponse({
    required String strategyId,
    required String inflow24h,
    required String createdAt,
    required String timestamp,
    
  }) = _PoolInflowChartDataResponse;

  factory PoolInflowChartDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PoolInflowChartDataResponseFromJson(json);
}