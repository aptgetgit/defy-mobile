// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../trending_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrendingCollectionModelImpl _$$TrendingCollectionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TrendingCollectionModelImpl(
      id: json['id'] as String?,
      currentTradesCount: (json['current_trades_count'] as num?)?.toInt(),
      currentUsdVolume: json['current_usd_volume'] as String?,
      currentVolume: json['current_volume'] as String?,
      previousTradesCount: (json['previous_trades_count'] as num?)?.toInt(),
      previousUsdVolume: json['previous_usd_volume'] as String?,
      previousVolume: json['previous_volume'] as String?,
      collection: json['collection'] == null
          ? null
          : CollectionModel.fromJson(
              json['collection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TrendingCollectionModelImplToJson(
        _$TrendingCollectionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'current_trades_count': instance.currentTradesCount,
      'current_usd_volume': instance.currentUsdVolume,
      'current_volume': instance.currentVolume,
      'previous_trades_count': instance.previousTradesCount,
      'previous_usd_volume': instance.previousUsdVolume,
      'previous_volume': instance.previousVolume,
      'collection': instance.collection,
    };

_$CollectionModelImpl _$$CollectionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CollectionModelImpl(
      id: json['id'] as String?,
      slug: json['slug'] as String?,
      title: json['title'] as String?,
      supply: (json['supply'] as num?)?.toInt(),
      coverUrl: json['cover_url'] as String?,
      floor: (json['floor'] as num?)?.toInt(),
      usdVolume: (json['usd_volume'] as num?)?.toDouble(),
      volume: (json['volume'] as num?)?.toInt(),
      verified: json['verified'] as bool?,
    );

Map<String, dynamic> _$$CollectionModelImplToJson(
        _$CollectionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title': instance.title,
      'supply': instance.supply,
      'cover_url': instance.coverUrl,
      'floor': instance.floor,
      'usd_volume': instance.usdVolume,
      'volume': instance.volume,
      'verified': instance.verified,
    };
