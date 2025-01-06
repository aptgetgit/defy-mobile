import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/token_metadata.freezed.dart';
part 'generated/token_metadata.g.dart';

@freezed
class TokenMetaDataEntity with _$TokenMetaDataEntity {
  const TokenMetaDataEntity._();

  const factory TokenMetaDataEntity({
  required String? coinId,
  required String? coinName,
  required int? coinDecimals,
  required String? coinDefyappSymbol,
  required String? coinDescription,
  required String? coinLogoUrl,
  required CoinMetricEntity? coinMetric,
  }) = _TokenMetaDataEntity;

  factory TokenMetaDataEntity.fromJson(Map<String, dynamic> json) =>
      _$TokenMetaDataEntityFromJson(json);
}

@freezed
class CoinMetricEntity with _$CoinMetricEntity {
  const CoinMetricEntity._();

  const factory CoinMetricEntity({
  required double? priceChange1hr,
  required double? priceChange24hr,
  required double? priceChange30d,
  required double? priceChange5m,
  required double? priceChange6hr,
  required double? priceChange7d,
  required double? priceUsd,
  required double? volume24hr,
  required double? volume30d,
  required double? volume7d,
  required double? volumeChange24hr,
  required int? totalSupply,
  required num? marketCap,
  required num? selfReportedCirculatingSupply,
  required num? selfReportedMarketCap,
  required num? maxSupply,
  required num? fullyDilutedMarketCap,
  required num? tvl,
  required num? circulatingSupply,
  }) = _CoinMetricEntity;

  factory CoinMetricEntity.fromJson(Map<String, dynamic> json) =>
      _$CoinMetricEntityFromJson(json);
}