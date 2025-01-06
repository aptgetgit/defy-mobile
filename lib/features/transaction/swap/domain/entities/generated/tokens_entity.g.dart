// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../tokens_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenEntityImpl _$$TokenEntityImplFromJson(Map<String, dynamic> json) =>
    _$TokenEntityImpl(
      chainId: (json['chain_id'] as num?)?.toInt(),
      tokenAddress: json['token_address'] as String?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      decimals: (json['decimals'] as num?)?.toInt(),
      bridge: json['bridge'] as String?,
      panoraSymbol: json['panora_symbol'] as String?,
      logoUrl: json['logo_url'] as String?,
      websiteUrl: json['website_url'] as String?,
      category: json['category'] as String?,
      isInPanoraTokenList: json['is_in_panora_token_list'] as bool?,
      isBanned: json['is_banned'] as bool?,
      panoraOrderIndex: (json['panora_order_index'] as num?)?.toInt(),
      coingeckoId: json['coingecko_id'] as String?,
      coinMarketCapId: (json['coin_market_cap_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TokenEntityImplToJson(_$TokenEntityImpl instance) =>
    <String, dynamic>{
      'chain_id': instance.chainId,
      'token_address': instance.tokenAddress,
      'name': instance.name,
      'symbol': instance.symbol,
      'decimals': instance.decimals,
      'bridge': instance.bridge,
      'panora_symbol': instance.panoraSymbol,
      'logo_url': instance.logoUrl,
      'website_url': instance.websiteUrl,
      'category': instance.category,
      'is_in_panora_token_list': instance.isInPanoraTokenList,
      'is_banned': instance.isBanned,
      'panora_order_index': instance.panoraOrderIndex,
      'coingecko_id': instance.coingeckoId,
      'coin_market_cap_id': instance.coinMarketCapId,
    };
