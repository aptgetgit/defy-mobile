// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../collection_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CollectionDetailsModelImpl _$$CollectionDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CollectionDetailsModelImpl(
      collectionInfo: (json['collections'] as List<dynamic>?)
          ?.map((e) => CollectionInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      listings: (json['listings'] as List<dynamic>?)
          ?.map((e) =>
              CollectionListingsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: json['collection_stats'] == null
          ? null
          : CollectionStatsModel.fromJson(
              json['collection_stats'] as Map<String, dynamic>),
      activity: (json['actions'] as List<dynamic>?)
          ?.map((e) =>
              CollectionActivityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CollectionDetailsModelImplToJson(
        _$CollectionDetailsModelImpl instance) =>
    <String, dynamic>{
      'collections': instance.collectionInfo,
      'listings': instance.listings,
      'collection_stats': instance.stats,
      'actions': instance.activity,
    };

_$CollectionInfoModelImpl _$$CollectionInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CollectionInfoModelImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      semanticSlug: json['semantic_slug'] as String?,
      description: json['description'] as String?,
      floor: (json['floor'] as num?)?.toInt(),
      volume: (json['volume'] as num?)?.toInt(),
      usdVolume: (json['usd_volume'] as num?)?.toDouble(),
      coverUrl: json['cover_url'] as String?,
      supply: (json['supply'] as num?)?.toInt(),
      verified: json['verified'] as bool?,
      discord: json['discord'] as String?,
      twitter: json['twitter'] as String?,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$$CollectionInfoModelImplToJson(
        _$CollectionInfoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'semantic_slug': instance.semanticSlug,
      'description': instance.description,
      'floor': instance.floor,
      'volume': instance.volume,
      'usd_volume': instance.usdVolume,
      'cover_url': instance.coverUrl,
      'supply': instance.supply,
      'verified': instance.verified,
      'discord': instance.discord,
      'twitter': instance.twitter,
      'website': instance.website,
    };

_$CollectionListingsModelImpl _$$CollectionListingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CollectionListingsModelImpl(
      id: json['id'] as String?,
      price: (json['price'] as num?)?.toInt(),
      blockTime: json['block_time'] as String?,
      seller: json['seller'] as String?,
      nft: json['nft'] == null
          ? null
          : CollectionListingsNFTModel.fromJson(
              json['nft'] as Map<String, dynamic>),
      contract: json['contract'] == null
          ? null
          : CollectionListingsContractModel.fromJson(
              json['contract'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CollectionListingsModelImplToJson(
        _$CollectionListingsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'block_time': instance.blockTime,
      'seller': instance.seller,
      'nft': instance.nft,
      'contract': instance.contract,
    };

_$CollectionListingsNFTModelImpl _$$CollectionListingsNFTModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CollectionListingsNFTModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      mediaUrl: json['media_url'] as String?,
      mediaType: json['media_type'] as String?,
      ranking: (json['ranking'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CollectionListingsNFTModelImplToJson(
        _$CollectionListingsNFTModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'media_url': instance.mediaUrl,
      'media_type': instance.mediaType,
      'ranking': instance.ranking,
    };

_$CollectionListingsContractModelImpl
    _$$CollectionListingsContractModelImplFromJson(Map<String, dynamic> json) =>
        _$CollectionListingsContractModelImpl(
          key: json['key'] as String?,
        );

Map<String, dynamic> _$$CollectionListingsContractModelImplToJson(
        _$CollectionListingsContractModelImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
    };

_$CollectionStatsModelImpl _$$CollectionStatsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CollectionStatsModelImpl(
      totalMintVolume: json['total_mint_volume'] as String?,
      totalMintUsdVolume: json['total_mint_usd_volume'] as String?,
      totalSales: (json['total_sales'] as num?)?.toInt(),
      totalUsdVolume: json['total_usd_volume'] as String?,
      totalVolume: json['total_volume'] as String?,
      dayVolume: json['day_volume'] as String?,
      daySales: (json['day_sales'] as num?)?.toInt(),
      dayUsdVolume: json['day_usd_volume'] as String?,
    );

Map<String, dynamic> _$$CollectionStatsModelImplToJson(
        _$CollectionStatsModelImpl instance) =>
    <String, dynamic>{
      'total_mint_volume': instance.totalMintVolume,
      'total_mint_usd_volume': instance.totalMintUsdVolume,
      'total_sales': instance.totalSales,
      'total_usd_volume': instance.totalUsdVolume,
      'total_volume': instance.totalVolume,
      'day_volume': instance.dayVolume,
      'day_sales': instance.daySales,
      'day_usd_volume': instance.dayUsdVolume,
    };

_$CollectionActivityModelImpl _$$CollectionActivityModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CollectionActivityModelImpl(
      id: json['id'] as String?,
      type: json['type'] as String?,
      price: (json['price'] as num?)?.toInt(),
      usdPrice: (json['usd_price'] as num?)?.toDouble(),
      sender: json['sender'] as String?,
      receiver: json['receiver'] as String?,
      blockTime: json['block_time'] as String?,
      nft: json['nft'] == null
          ? null
          : CollectionActivityNFTModel.fromJson(
              json['nft'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CollectionActivityModelImplToJson(
        _$CollectionActivityModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'price': instance.price,
      'usd_price': instance.usdPrice,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'block_time': instance.blockTime,
      'nft': instance.nft,
    };

_$CollectionActivityNFTModelImpl _$$CollectionActivityNFTModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CollectionActivityNFTModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      mediaUrl: json['media_url'] as String?,
      ranking: (json['ranking'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CollectionActivityNFTModelImplToJson(
        _$CollectionActivityNFTModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'media_url': instance.mediaUrl,
      'ranking': instance.ranking,
    };
