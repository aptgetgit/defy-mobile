// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../token_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenMetaDataEntityImpl _$$TokenMetaDataEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$TokenMetaDataEntityImpl(
      coinId: json['coin_id'] as String?,
      coinName: json['coin_name'] as String?,
      coinDecimals: (json['coin_decimals'] as num?)?.toInt(),
      coinDefyappSymbol: json['coin_defyapp_symbol'] as String?,
      coinDescription: json['coin_description'] as String?,
      coinLogoUrl: json['coin_logo_url'] as String?,
      coinMetric: json['coin_metric'] == null
          ? null
          : CoinMetricEntity.fromJson(
              json['coin_metric'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TokenMetaDataEntityImplToJson(
        _$TokenMetaDataEntityImpl instance) =>
    <String, dynamic>{
      'coin_id': instance.coinId,
      'coin_name': instance.coinName,
      'coin_decimals': instance.coinDecimals,
      'coin_defyapp_symbol': instance.coinDefyappSymbol,
      'coin_description': instance.coinDescription,
      'coin_logo_url': instance.coinLogoUrl,
      'coin_metric': instance.coinMetric,
    };

_$CoinMetricEntityImpl _$$CoinMetricEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$CoinMetricEntityImpl(
      priceChange1hr: (json['price_change1hr'] as num?)?.toDouble(),
      priceChange24hr: (json['price_change24hr'] as num?)?.toDouble(),
      priceChange30d: (json['price_change30d'] as num?)?.toDouble(),
      priceChange5m: (json['price_change5m'] as num?)?.toDouble(),
      priceChange6hr: (json['price_change6hr'] as num?)?.toDouble(),
      priceChange7d: (json['price_change7d'] as num?)?.toDouble(),
      priceUsd: (json['price_usd'] as num?)?.toDouble(),
      volume24hr: (json['volume24hr'] as num?)?.toDouble(),
      volume30d: (json['volume30d'] as num?)?.toDouble(),
      volume7d: (json['volume7d'] as num?)?.toDouble(),
      volumeChange24hr: (json['volume_change24hr'] as num?)?.toDouble(),
      totalSupply: (json['total_supply'] as num?)?.toInt(),
      marketCap: json['market_cap'] as num?,
      selfReportedCirculatingSupply:
          json['self_reported_circulating_supply'] as num?,
      selfReportedMarketCap: json['self_reported_market_cap'] as num?,
      maxSupply: json['max_supply'] as num?,
      fullyDilutedMarketCap: json['fully_diluted_market_cap'] as num?,
      tvl: json['tvl'] as num?,
      circulatingSupply: json['circulating_supply'] as num?,
    );

Map<String, dynamic> _$$CoinMetricEntityImplToJson(
        _$CoinMetricEntityImpl instance) =>
    <String, dynamic>{
      'price_change1hr': instance.priceChange1hr,
      'price_change24hr': instance.priceChange24hr,
      'price_change30d': instance.priceChange30d,
      'price_change5m': instance.priceChange5m,
      'price_change6hr': instance.priceChange6hr,
      'price_change7d': instance.priceChange7d,
      'price_usd': instance.priceUsd,
      'volume24hr': instance.volume24hr,
      'volume30d': instance.volume30d,
      'volume7d': instance.volume7d,
      'volume_change24hr': instance.volumeChange24hr,
      'total_supply': instance.totalSupply,
      'market_cap': instance.marketCap,
      'self_reported_circulating_supply':
          instance.selfReportedCirculatingSupply,
      'self_reported_market_cap': instance.selfReportedMarketCap,
      'max_supply': instance.maxSupply,
      'fully_diluted_market_cap': instance.fullyDilutedMarketCap,
      'tvl': instance.tvl,
      'circulating_supply': instance.circulatingSupply,
    };
