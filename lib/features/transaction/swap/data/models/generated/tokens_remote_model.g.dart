// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../tokens_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokensRemoteModelImpl _$$TokensRemoteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TokensRemoteModelImpl(
      chainId: (json['chainId'] as num?)?.toInt(),
      tokenAddress: json['tokenAddress'],
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      decimals: (json['decimals'] as num?)?.toInt(),
      bridge: json['bridge'] as String?,
      panoraSymbol: json['panoraSymbol'] as String?,
      logoUrl: json['logoUrl'] as String?,
      websiteUrl: json['websiteUrl'] as String?,
      category: json['category'] as String?,
      isInPanoraTokenList: json['isInPanoraTokenList'] as bool?,
      isBanned: json['isBanned'] as bool?,
      panoraOrderIndex: (json['panoraOrderIndex'] as num?)?.toInt(),
      coingeckoId: json['coingeckoId'] as String?,
      coinMarketCapId: (json['coinMarketCapId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TokensRemoteModelImplToJson(
        _$TokensRemoteModelImpl instance) =>
    <String, dynamic>{
      'chainId': instance.chainId,
      'tokenAddress': instance.tokenAddress,
      'name': instance.name,
      'symbol': instance.symbol,
      'decimals': instance.decimals,
      'bridge': instance.bridge,
      'panoraSymbol': instance.panoraSymbol,
      'logoUrl': instance.logoUrl,
      'websiteUrl': instance.websiteUrl,
      'category': instance.category,
      'isInPanoraTokenList': instance.isInPanoraTokenList,
      'isBanned': instance.isBanned,
      'panoraOrderIndex': instance.panoraOrderIndex,
      'coingeckoId': instance.coingeckoId,
      'coinMarketCapId': instance.coinMarketCapId,
    };
