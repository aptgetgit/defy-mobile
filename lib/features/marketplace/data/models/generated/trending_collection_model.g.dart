// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../trending_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrendingCollectionModelImpl _$$TrendingCollectionModelImplFromJson(
        Map json) =>
    $checkedCreate(
      r'_$TrendingCollectionModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'current_trades_count',
            'current_usd_volume',
            'current_volume',
            'previous_trades_count',
            'previous_usd_volume',
            'previous_volume',
            'collection'
          ],
        );
        final val = _$TrendingCollectionModelImpl(
          id: $checkedConvert('id', (v) => v as String?),
          currentTradesCount: $checkedConvert(
              'current_trades_count', (v) => (v as num?)?.toInt()),
          currentUsdVolume:
              $checkedConvert('current_usd_volume', (v) => v as String?),
          currentVolume: $checkedConvert('current_volume', (v) => v as String?),
          previousTradesCount: $checkedConvert(
              'previous_trades_count', (v) => (v as num?)?.toInt()),
          previousUsdVolume:
              $checkedConvert('previous_usd_volume', (v) => v as String?),
          previousVolume:
              $checkedConvert('previous_volume', (v) => v as String?),
          collection: $checkedConvert(
              'collection',
              (v) => v == null
                  ? null
                  : CollectionModel.fromJson(
                      Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
      fieldKeyMap: const {
        'currentTradesCount': 'current_trades_count',
        'currentUsdVolume': 'current_usd_volume',
        'currentVolume': 'current_volume',
        'previousTradesCount': 'previous_trades_count',
        'previousUsdVolume': 'previous_usd_volume',
        'previousVolume': 'previous_volume'
      },
    );

const _$$TrendingCollectionModelImplFieldMap = <String, String>{
  'id': 'id',
  'currentTradesCount': 'current_trades_count',
  'currentUsdVolume': 'current_usd_volume',
  'currentVolume': 'current_volume',
  'previousTradesCount': 'previous_trades_count',
  'previousUsdVolume': 'previous_usd_volume',
  'previousVolume': 'previous_volume',
  'collection': 'collection',
};

abstract final class _$$TrendingCollectionModelImplJsonKeys {
  static const String id = 'id';
  static const String currentTradesCount = 'current_trades_count';
  static const String currentUsdVolume = 'current_usd_volume';
  static const String currentVolume = 'current_volume';
  static const String previousTradesCount = 'previous_trades_count';
  static const String previousUsdVolume = 'previous_usd_volume';
  static const String previousVolume = 'previous_volume';
  static const String collection = 'collection';
}

// ignore: unused_element
abstract class _$$TrendingCollectionModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? id(String? instance) => instance;
  // ignore: unused_element
  static Object? currentTradesCount(int? instance) => instance;
  // ignore: unused_element
  static Object? currentUsdVolume(String? instance) => instance;
  // ignore: unused_element
  static Object? currentVolume(String? instance) => instance;
  // ignore: unused_element
  static Object? previousTradesCount(int? instance) => instance;
  // ignore: unused_element
  static Object? previousUsdVolume(String? instance) => instance;
  // ignore: unused_element
  static Object? previousVolume(String? instance) => instance;
  // ignore: unused_element
  static Object? collection(CollectionModel? instance) => instance?.toJson();
}

Map<String, dynamic> _$$TrendingCollectionModelImplToJson(
        _$TrendingCollectionModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.currentTradesCount case final value?)
        'current_trades_count': value,
      if (instance.currentUsdVolume case final value?)
        'current_usd_volume': value,
      if (instance.currentVolume case final value?) 'current_volume': value,
      if (instance.previousTradesCount case final value?)
        'previous_trades_count': value,
      if (instance.previousUsdVolume case final value?)
        'previous_usd_volume': value,
      if (instance.previousVolume case final value?) 'previous_volume': value,
      if (instance.collection?.toJson() case final value?) 'collection': value,
    };

_$CollectionModelImpl _$$CollectionModelImplFromJson(Map json) =>
    $checkedCreate(
      r'_$CollectionModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'slug',
            'title',
            'supply',
            'cover_url',
            'floor',
            'usd_volume',
            'volume',
            'verified'
          ],
        );
        final val = _$CollectionModelImpl(
          id: $checkedConvert('id', (v) => v as String?),
          slug: $checkedConvert('slug', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
          supply: $checkedConvert('supply', (v) => (v as num?)?.toInt()),
          coverUrl: $checkedConvert('cover_url', (v) => v as String?),
          floor: $checkedConvert('floor', (v) => (v as num?)?.toInt()),
          usdVolume:
              $checkedConvert('usd_volume', (v) => (v as num?)?.toDouble()),
          volume: $checkedConvert('volume', (v) => (v as num?)?.toInt()),
          verified: $checkedConvert('verified', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {'coverUrl': 'cover_url', 'usdVolume': 'usd_volume'},
    );

const _$$CollectionModelImplFieldMap = <String, String>{
  'id': 'id',
  'slug': 'slug',
  'title': 'title',
  'supply': 'supply',
  'coverUrl': 'cover_url',
  'floor': 'floor',
  'usdVolume': 'usd_volume',
  'volume': 'volume',
  'verified': 'verified',
};

abstract final class _$$CollectionModelImplJsonKeys {
  static const String id = 'id';
  static const String slug = 'slug';
  static const String title = 'title';
  static const String supply = 'supply';
  static const String coverUrl = 'cover_url';
  static const String floor = 'floor';
  static const String usdVolume = 'usd_volume';
  static const String volume = 'volume';
  static const String verified = 'verified';
}

// ignore: unused_element
abstract class _$$CollectionModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? id(String? instance) => instance;
  // ignore: unused_element
  static Object? slug(String? instance) => instance;
  // ignore: unused_element
  static Object? title(String? instance) => instance;
  // ignore: unused_element
  static Object? supply(int? instance) => instance;
  // ignore: unused_element
  static Object? coverUrl(String? instance) => instance;
  // ignore: unused_element
  static Object? floor(int? instance) => instance;
  // ignore: unused_element
  static Object? usdVolume(double? instance) => instance;
  // ignore: unused_element
  static Object? volume(int? instance) => instance;
  // ignore: unused_element
  static Object? verified(bool? instance) => instance;
}

Map<String, dynamic> _$$CollectionModelImplToJson(
        _$CollectionModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.slug case final value?) 'slug': value,
      if (instance.title case final value?) 'title': value,
      if (instance.supply case final value?) 'supply': value,
      if (instance.coverUrl case final value?) 'cover_url': value,
      if (instance.floor case final value?) 'floor': value,
      if (instance.usdVolume case final value?) 'usd_volume': value,
      if (instance.volume case final value?) 'volume': value,
      if (instance.verified case final value?) 'verified': value,
    };
