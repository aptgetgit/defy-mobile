// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../token_metadata_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenMetaDataRemoteModelImpl _$$TokenMetaDataRemoteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TokenMetaDataRemoteModelImpl(
      coinId: json['coin_id'] as String?,
      coinName: json['coin_name'] as String?,
      coinDecimals: (json['coin_decimals'] as num?)?.toInt(),
      coinDefyappSymbol: json['coin_defyapp_symbol'] as String?,
      coinDescription: json['coin_description'] as String?,
      coinLogoUrl: json['coin_logo_url'] as String?,
      coinMetric: json['coin_metric'] == null
          ? null
          : TokenMetricModel.fromJson(
              json['coin_metric'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TokenMetaDataRemoteModelImplToJson(
        _$TokenMetaDataRemoteModelImpl instance) =>
    <String, dynamic>{
      'coin_id': instance.coinId,
      'coin_name': instance.coinName,
      'coin_decimals': instance.coinDecimals,
      'coin_defyapp_symbol': instance.coinDefyappSymbol,
      'coin_description': instance.coinDescription,
      'coin_logo_url': instance.coinLogoUrl,
      'coin_metric': instance.coinMetric,
    };

_$TokenMetricModelImpl _$$TokenMetricModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TokenMetricModelImpl(
      priceChange1hr: (json['price_change_1hr'] as num?)?.toDouble(),
      priceChange24hr: (json['price_change_24h'] as num?)?.toDouble(),
      priceChange30d: (json['price_change_30d'] as num?)?.toDouble(),
      priceChange5m: (json['price_change_5m'] as num?)?.toDouble(),
      priceChange6hr: (json['price_change_6hr'] as num?)?.toDouble(),
      priceChange7d: (json['price_change_7d'] as num?)?.toDouble(),
      priceUsd: (json['price_usd'] as num?)?.toDouble(),
      volume24hr: (json['volume_24hr'] as num?)?.toDouble(),
      volume30d: (json['volume_30d'] as num?)?.toDouble(),
      volume7d: (json['volume_7d'] as num?)?.toDouble(),
      volumeChange24hr: (json['volume_change_24hr'] as num?)?.toDouble(),
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

Map<String, dynamic> _$$TokenMetricModelImplToJson(
        _$TokenMetricModelImpl instance) =>
    <String, dynamic>{
      'price_change_1hr': instance.priceChange1hr,
      'price_change_24h': instance.priceChange24hr,
      'price_change_30d': instance.priceChange30d,
      'price_change_5m': instance.priceChange5m,
      'price_change_6hr': instance.priceChange6hr,
      'price_change_7d': instance.priceChange7d,
      'price_usd': instance.priceUsd,
      'volume_24hr': instance.volume24hr,
      'volume_30d': instance.volume30d,
      'volume_7d': instance.volume7d,
      'volume_change_24hr': instance.volumeChange24hr,
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
