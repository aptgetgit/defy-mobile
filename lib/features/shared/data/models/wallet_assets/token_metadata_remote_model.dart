import 'package:defy/features/shared/domain/entities/token_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/token_metadata_remote_model.freezed.dart';
part 'generated/token_metadata_remote_model.g.dart';

@freezed
class TokenMetaDataRemoteModel with _$TokenMetaDataRemoteModel {
  const TokenMetaDataRemoteModel._();
  factory TokenMetaDataRemoteModel({
    @JsonKey(name: 'coin_id') required String? coinId,
    @JsonKey(name: 'coin_name') required String? coinName,
    @JsonKey(name: 'coin_decimals') required int? coinDecimals,
    @JsonKey(name: 'coin_defyapp_symbol') required String? coinDefyappSymbol,
    @JsonKey(name: 'coin_description') required String? coinDescription,
    @JsonKey(name: 'coin_logo_url') required String? coinLogoUrl,
    @JsonKey(name: 'coin_metric') required TokenMetricModel? coinMetric,
  }) = _TokenMetaDataRemoteModel;

  factory TokenMetaDataRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$TokenMetaDataRemoteModelFromJson(json);

  TokenMetaDataEntity toDomain() => TokenMetaDataEntity(
        coinId: coinId,
        coinName: coinName,
        coinDecimals: coinDecimals,
        coinDefyappSymbol: coinDefyappSymbol,
        coinDescription: coinDescription,
        coinLogoUrl: coinLogoUrl,
        coinMetric: coinMetric?.toDomain(),
      );

  static TokenMetaDataRemoteModel fromDomain(TokenMetaDataEntity token) =>
      TokenMetaDataRemoteModel(
        coinId: token.coinId,
        coinName: token.coinName,
        coinDecimals: token.coinDecimals,
        coinDefyappSymbol: token.coinDefyappSymbol,
        coinDescription: token.coinDescription,
        coinLogoUrl: token.coinLogoUrl,
        coinMetric: TokenMetricModel.fromDomain(token.coinMetric),
      );
}

@freezed
class TokenMetricModel with _$TokenMetricModel {
  const TokenMetricModel._();
  factory TokenMetricModel({
    @JsonKey(name: 'price_change_1hr') required double? priceChange1hr,
    @JsonKey(name: 'price_change_24h') required double? priceChange24hr,
    @JsonKey(name: 'price_change_30d') required double? priceChange30d,
    @JsonKey(name: 'price_change_5m') required double? priceChange5m,
    @JsonKey(name: 'price_change_6hr') required double? priceChange6hr,
    @JsonKey(name: 'price_change_7d') required double? priceChange7d,
    @JsonKey(name: 'price_usd') required double? priceUsd,
    @JsonKey(name: 'volume_24hr') required double? volume24hr,
    @JsonKey(name: 'volume_30d') required double? volume30d,
    @JsonKey(name: 'volume_7d') required double? volume7d,
    @JsonKey(name: 'volume_change_24hr') required double? volumeChange24hr,
    @JsonKey(name: 'total_supply') required int? totalSupply,
    @JsonKey(name: 'market_cap') required num? marketCap,
    @JsonKey(name: 'self_reported_circulating_supply')
    required num? selfReportedCirculatingSupply,
    @JsonKey(name: 'self_reported_market_cap')
    required num? selfReportedMarketCap,
    @JsonKey(name: 'max_supply') required num? maxSupply,
    @JsonKey(name: 'fully_diluted_market_cap')
    required num? fullyDilutedMarketCap,
    @JsonKey(name: 'tvl') required num? tvl,
    @JsonKey(name: 'circulating_supply') required num? circulatingSupply,
  }) = _TokenMetricModel;

  factory TokenMetricModel.fromJson(Map<String, dynamic> json) =>
      _$TokenMetricModelFromJson(json);

  CoinMetricEntity toDomain() => CoinMetricEntity(
        priceChange1hr: priceChange1hr,
        priceChange24hr: priceChange24hr,
        priceChange30d: priceChange30d,
        priceChange5m: priceChange5m,
        priceChange6hr: priceChange6hr,
        priceChange7d: priceChange7d,
        priceUsd: priceUsd,
        volume24hr: volume24hr,
        volume30d: volume30d,
        volume7d: volume7d,
        volumeChange24hr: volumeChange24hr,
        totalSupply: totalSupply,
        marketCap: marketCap,
        selfReportedCirculatingSupply: selfReportedCirculatingSupply,
        selfReportedMarketCap: selfReportedMarketCap,
        maxSupply: maxSupply,
        fullyDilutedMarketCap: fullyDilutedMarketCap,
        tvl: tvl,
        circulatingSupply: circulatingSupply,
      );

  static TokenMetricModel fromDomain(CoinMetricEntity? token) => TokenMetricModel(
        priceChange1hr: token?.priceChange1hr,
        priceChange24hr: token?.priceChange24hr,
        priceChange30d: token?.priceChange30d,
        priceChange5m: token?.priceChange5m,
        priceChange6hr: token?.priceChange6hr,
        priceChange7d: token?.priceChange7d,
        priceUsd: token?.priceUsd,
        volume24hr: token?.volume24hr,
        volume30d: token?.volume30d,
        volume7d: token?.volume7d,
        volumeChange24hr: token?.volumeChange24hr,
        totalSupply: token?.totalSupply,
        marketCap: token?.marketCap,
        selfReportedCirculatingSupply: token?.selfReportedCirculatingSupply,
        selfReportedMarketCap: token?.selfReportedMarketCap,
        maxSupply: token?.maxSupply,
        fullyDilutedMarketCap: token?.fullyDilutedMarketCap,
        tvl: token?.tvl,
        circulatingSupply: token?.circulatingSupply,
      );
}
