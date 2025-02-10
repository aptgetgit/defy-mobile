// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../collection_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CollectionDetailsModelImpl _$$CollectionDetailsModelImplFromJson(Map json) =>
    $checkedCreate(
      r'_$CollectionDetailsModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'collections',
            'listings',
            'collection_stats',
            'actions'
          ],
        );
        final val = _$CollectionDetailsModelImpl(
          collectionInfo: $checkedConvert(
              'collections',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => CollectionInfoModel.fromJson(
                      Map<String, dynamic>.from(e as Map)))
                  .toList()),
          listings: $checkedConvert(
              'listings',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => CollectionListingsModel.fromJson(
                      Map<String, dynamic>.from(e as Map)))
                  .toList()),
          stats: $checkedConvert(
              'collection_stats',
              (v) => v == null
                  ? null
                  : CollectionStatsModel.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          activity: $checkedConvert(
              'actions',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => CollectionActivityModel.fromJson(
                      Map<String, dynamic>.from(e as Map)))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'collectionInfo': 'collections',
        'stats': 'collection_stats',
        'activity': 'actions'
      },
    );

const _$$CollectionDetailsModelImplFieldMap = <String, String>{
  'collectionInfo': 'collections',
  'listings': 'listings',
  'stats': 'collection_stats',
  'activity': 'actions',
};

abstract final class _$$CollectionDetailsModelImplJsonKeys {
  static const String collectionInfo = 'collections';
  static const String listings = 'listings';
  static const String stats = 'collection_stats';
  static const String activity = 'actions';
}

// ignore: unused_element
abstract class _$$CollectionDetailsModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? collectionInfo(List<CollectionInfoModel>? instance) =>
      instance?.map((e) => e.toJson()).toList();
  // ignore: unused_element
  static Object? listings(List<CollectionListingsModel>? instance) =>
      instance?.map((e) => e.toJson()).toList();
  // ignore: unused_element
  static Object? stats(CollectionStatsModel? instance) => instance?.toJson();
  // ignore: unused_element
  static Object? activity(List<CollectionActivityModel>? instance) =>
      instance?.map((e) => e.toJson()).toList();
}

Map<String, dynamic> _$$CollectionDetailsModelImplToJson(
        _$CollectionDetailsModelImpl instance) =>
    <String, dynamic>{
      if (instance.collectionInfo?.map((e) => e.toJson()).toList()
          case final value?)
        'collections': value,
      if (instance.listings?.map((e) => e.toJson()).toList() case final value?)
        'listings': value,
      if (instance.stats?.toJson() case final value?) 'collection_stats': value,
      if (instance.activity?.map((e) => e.toJson()).toList() case final value?)
        'actions': value,
    };

_$CollectionInfoModelImpl _$$CollectionInfoModelImplFromJson(Map json) =>
    $checkedCreate(
      r'_$CollectionInfoModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'title',
            'slug',
            'semantic_slug',
            'description',
            'floor',
            'volume',
            'usd_volume',
            'cover_url',
            'supply',
            'verified',
            'discord',
            'twitter',
            'website'
          ],
        );
        final val = _$CollectionInfoModelImpl(
          id: $checkedConvert('id', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
          slug: $checkedConvert('slug', (v) => v as String?),
          semanticSlug: $checkedConvert('semantic_slug', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          floor: $checkedConvert('floor', (v) => (v as num?)?.toInt()),
          volume: $checkedConvert('volume', (v) => (v as num?)?.toInt()),
          usdVolume:
              $checkedConvert('usd_volume', (v) => (v as num?)?.toDouble()),
          coverUrl: $checkedConvert('cover_url', (v) => v as String?),
          supply: $checkedConvert('supply', (v) => (v as num?)?.toInt()),
          verified: $checkedConvert('verified', (v) => v as bool?),
          discord: $checkedConvert('discord', (v) => v as String?),
          twitter: $checkedConvert('twitter', (v) => v as String?),
          website: $checkedConvert('website', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'semanticSlug': 'semantic_slug',
        'usdVolume': 'usd_volume',
        'coverUrl': 'cover_url'
      },
    );

const _$$CollectionInfoModelImplFieldMap = <String, String>{
  'id': 'id',
  'title': 'title',
  'slug': 'slug',
  'semanticSlug': 'semantic_slug',
  'description': 'description',
  'floor': 'floor',
  'volume': 'volume',
  'usdVolume': 'usd_volume',
  'coverUrl': 'cover_url',
  'supply': 'supply',
  'verified': 'verified',
  'discord': 'discord',
  'twitter': 'twitter',
  'website': 'website',
};

abstract final class _$$CollectionInfoModelImplJsonKeys {
  static const String id = 'id';
  static const String title = 'title';
  static const String slug = 'slug';
  static const String semanticSlug = 'semantic_slug';
  static const String description = 'description';
  static const String floor = 'floor';
  static const String volume = 'volume';
  static const String usdVolume = 'usd_volume';
  static const String coverUrl = 'cover_url';
  static const String supply = 'supply';
  static const String verified = 'verified';
  static const String discord = 'discord';
  static const String twitter = 'twitter';
  static const String website = 'website';
}

// ignore: unused_element
abstract class _$$CollectionInfoModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? id(String? instance) => instance;
  // ignore: unused_element
  static Object? title(String? instance) => instance;
  // ignore: unused_element
  static Object? slug(String? instance) => instance;
  // ignore: unused_element
  static Object? semanticSlug(String? instance) => instance;
  // ignore: unused_element
  static Object? description(String? instance) => instance;
  // ignore: unused_element
  static Object? floor(int? instance) => instance;
  // ignore: unused_element
  static Object? volume(int? instance) => instance;
  // ignore: unused_element
  static Object? usdVolume(double? instance) => instance;
  // ignore: unused_element
  static Object? coverUrl(String? instance) => instance;
  // ignore: unused_element
  static Object? supply(int? instance) => instance;
  // ignore: unused_element
  static Object? verified(bool? instance) => instance;
  // ignore: unused_element
  static Object? discord(String? instance) => instance;
  // ignore: unused_element
  static Object? twitter(String? instance) => instance;
  // ignore: unused_element
  static Object? website(String? instance) => instance;
}

Map<String, dynamic> _$$CollectionInfoModelImplToJson(
        _$CollectionInfoModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.title case final value?) 'title': value,
      if (instance.slug case final value?) 'slug': value,
      if (instance.semanticSlug case final value?) 'semantic_slug': value,
      if (instance.description case final value?) 'description': value,
      if (instance.floor case final value?) 'floor': value,
      if (instance.volume case final value?) 'volume': value,
      if (instance.usdVolume case final value?) 'usd_volume': value,
      if (instance.coverUrl case final value?) 'cover_url': value,
      if (instance.supply case final value?) 'supply': value,
      if (instance.verified case final value?) 'verified': value,
      if (instance.discord case final value?) 'discord': value,
      if (instance.twitter case final value?) 'twitter': value,
      if (instance.website case final value?) 'website': value,
    };

_$CollectionListingsModelImpl _$$CollectionListingsModelImplFromJson(
        Map json) =>
    $checkedCreate(
      r'_$CollectionListingsModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'price',
            'block_time',
            'seller',
            'nft',
            'contract'
          ],
        );
        final val = _$CollectionListingsModelImpl(
          id: $checkedConvert('id', (v) => v as String?),
          price: $checkedConvert('price', (v) => (v as num?)?.toInt()),
          blockTime: $checkedConvert('block_time', (v) => v as String?),
          seller: $checkedConvert('seller', (v) => v as String?),
          nft: $checkedConvert(
              'nft',
              (v) => v == null
                  ? null
                  : CollectionListingsNFTModel.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          contract: $checkedConvert(
              'contract',
              (v) => v == null
                  ? null
                  : CollectionListingsContractModel.fromJson(
                      Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
      fieldKeyMap: const {'blockTime': 'block_time'},
    );

const _$$CollectionListingsModelImplFieldMap = <String, String>{
  'id': 'id',
  'price': 'price',
  'blockTime': 'block_time',
  'seller': 'seller',
  'nft': 'nft',
  'contract': 'contract',
};

abstract final class _$$CollectionListingsModelImplJsonKeys {
  static const String id = 'id';
  static const String price = 'price';
  static const String blockTime = 'block_time';
  static const String seller = 'seller';
  static const String nft = 'nft';
  static const String contract = 'contract';
}

// ignore: unused_element
abstract class _$$CollectionListingsModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? id(String? instance) => instance;
  // ignore: unused_element
  static Object? price(int? instance) => instance;
  // ignore: unused_element
  static Object? blockTime(String? instance) => instance;
  // ignore: unused_element
  static Object? seller(String? instance) => instance;
  // ignore: unused_element
  static Object? nft(CollectionListingsNFTModel? instance) =>
      instance?.toJson();
  // ignore: unused_element
  static Object? contract(CollectionListingsContractModel? instance) =>
      instance?.toJson();
}

Map<String, dynamic> _$$CollectionListingsModelImplToJson(
        _$CollectionListingsModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.price case final value?) 'price': value,
      if (instance.blockTime case final value?) 'block_time': value,
      if (instance.seller case final value?) 'seller': value,
      if (instance.nft?.toJson() case final value?) 'nft': value,
      if (instance.contract?.toJson() case final value?) 'contract': value,
    };

_$CollectionListingsNFTModelImpl _$$CollectionListingsNFTModelImplFromJson(
        Map json) =>
    $checkedCreate(
      r'_$CollectionListingsNFTModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'name',
            'media_url',
            'media_type',
            'ranking'
          ],
        );
        final val = _$CollectionListingsNFTModelImpl(
          id: $checkedConvert('id', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          mediaUrl: $checkedConvert('media_url', (v) => v as String?),
          mediaType: $checkedConvert('media_type', (v) => v as String?),
          ranking: $checkedConvert('ranking', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'mediaUrl': 'media_url', 'mediaType': 'media_type'},
    );

const _$$CollectionListingsNFTModelImplFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'mediaUrl': 'media_url',
  'mediaType': 'media_type',
  'ranking': 'ranking',
};

abstract final class _$$CollectionListingsNFTModelImplJsonKeys {
  static const String id = 'id';
  static const String name = 'name';
  static const String mediaUrl = 'media_url';
  static const String mediaType = 'media_type';
  static const String ranking = 'ranking';
}

// ignore: unused_element
abstract class _$$CollectionListingsNFTModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? id(String? instance) => instance;
  // ignore: unused_element
  static Object? name(String? instance) => instance;
  // ignore: unused_element
  static Object? mediaUrl(String? instance) => instance;
  // ignore: unused_element
  static Object? mediaType(String? instance) => instance;
  // ignore: unused_element
  static Object? ranking(int? instance) => instance;
}

Map<String, dynamic> _$$CollectionListingsNFTModelImplToJson(
        _$CollectionListingsNFTModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.mediaUrl case final value?) 'media_url': value,
      if (instance.mediaType case final value?) 'media_type': value,
      if (instance.ranking case final value?) 'ranking': value,
    };

_$CollectionListingsContractModelImpl
    _$$CollectionListingsContractModelImplFromJson(Map json) => $checkedCreate(
          r'_$CollectionListingsContractModelImpl',
          json,
          ($checkedConvert) {
            $checkKeys(
              json,
              allowedKeys: const ['key'],
            );
            final val = _$CollectionListingsContractModelImpl(
              key: $checkedConvert('key', (v) => v as String?),
            );
            return val;
          },
        );

const _$$CollectionListingsContractModelImplFieldMap = <String, String>{
  'key': 'key',
};

abstract final class _$$CollectionListingsContractModelImplJsonKeys {
  static const String key = 'key';
}

// ignore: unused_element
abstract class _$$CollectionListingsContractModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? key(String? instance) => instance;
}

Map<String, dynamic> _$$CollectionListingsContractModelImplToJson(
        _$CollectionListingsContractModelImpl instance) =>
    <String, dynamic>{
      if (instance.key case final value?) 'key': value,
    };

_$CollectionStatsModelImpl _$$CollectionStatsModelImplFromJson(Map json) =>
    $checkedCreate(
      r'_$CollectionStatsModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'total_mint_volume',
            'total_mint_usd_volume',
            'total_sales',
            'total_usd_volume',
            'total_volume',
            'day_volume',
            'day_sales',
            'day_usd_volume'
          ],
        );
        final val = _$CollectionStatsModelImpl(
          totalMintVolume:
              $checkedConvert('total_mint_volume', (v) => v as String?),
          totalMintUsdVolume:
              $checkedConvert('total_mint_usd_volume', (v) => v as String?),
          totalSales:
              $checkedConvert('total_sales', (v) => (v as num?)?.toInt()),
          totalUsdVolume:
              $checkedConvert('total_usd_volume', (v) => v as String?),
          totalVolume: $checkedConvert('total_volume', (v) => v as String?),
          dayVolume: $checkedConvert('day_volume', (v) => v as String?),
          daySales: $checkedConvert('day_sales', (v) => (v as num?)?.toInt()),
          dayUsdVolume: $checkedConvert('day_usd_volume', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'totalMintVolume': 'total_mint_volume',
        'totalMintUsdVolume': 'total_mint_usd_volume',
        'totalSales': 'total_sales',
        'totalUsdVolume': 'total_usd_volume',
        'totalVolume': 'total_volume',
        'dayVolume': 'day_volume',
        'daySales': 'day_sales',
        'dayUsdVolume': 'day_usd_volume'
      },
    );

const _$$CollectionStatsModelImplFieldMap = <String, String>{
  'totalMintVolume': 'total_mint_volume',
  'totalMintUsdVolume': 'total_mint_usd_volume',
  'totalSales': 'total_sales',
  'totalUsdVolume': 'total_usd_volume',
  'totalVolume': 'total_volume',
  'dayVolume': 'day_volume',
  'daySales': 'day_sales',
  'dayUsdVolume': 'day_usd_volume',
};

abstract final class _$$CollectionStatsModelImplJsonKeys {
  static const String totalMintVolume = 'total_mint_volume';
  static const String totalMintUsdVolume = 'total_mint_usd_volume';
  static const String totalSales = 'total_sales';
  static const String totalUsdVolume = 'total_usd_volume';
  static const String totalVolume = 'total_volume';
  static const String dayVolume = 'day_volume';
  static const String daySales = 'day_sales';
  static const String dayUsdVolume = 'day_usd_volume';
}

// ignore: unused_element
abstract class _$$CollectionStatsModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? totalMintVolume(String? instance) => instance;
  // ignore: unused_element
  static Object? totalMintUsdVolume(String? instance) => instance;
  // ignore: unused_element
  static Object? totalSales(int? instance) => instance;
  // ignore: unused_element
  static Object? totalUsdVolume(String? instance) => instance;
  // ignore: unused_element
  static Object? totalVolume(String? instance) => instance;
  // ignore: unused_element
  static Object? dayVolume(String? instance) => instance;
  // ignore: unused_element
  static Object? daySales(int? instance) => instance;
  // ignore: unused_element
  static Object? dayUsdVolume(String? instance) => instance;
}

Map<String, dynamic> _$$CollectionStatsModelImplToJson(
        _$CollectionStatsModelImpl instance) =>
    <String, dynamic>{
      if (instance.totalMintVolume case final value?)
        'total_mint_volume': value,
      if (instance.totalMintUsdVolume case final value?)
        'total_mint_usd_volume': value,
      if (instance.totalSales case final value?) 'total_sales': value,
      if (instance.totalUsdVolume case final value?) 'total_usd_volume': value,
      if (instance.totalVolume case final value?) 'total_volume': value,
      if (instance.dayVolume case final value?) 'day_volume': value,
      if (instance.daySales case final value?) 'day_sales': value,
      if (instance.dayUsdVolume case final value?) 'day_usd_volume': value,
    };

_$CollectionActivityModelImpl _$$CollectionActivityModelImplFromJson(
        Map json) =>
    $checkedCreate(
      r'_$CollectionActivityModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'type',
            'price',
            'usd_price',
            'sender',
            'receiver',
            'block_time',
            'nft'
          ],
        );
        final val = _$CollectionActivityModelImpl(
          id: $checkedConvert('id', (v) => v as String?),
          type: $checkedConvert('type', (v) => v as String?),
          price: $checkedConvert('price', (v) => (v as num?)?.toInt()),
          usdPrice:
              $checkedConvert('usd_price', (v) => (v as num?)?.toDouble()),
          sender: $checkedConvert('sender', (v) => v as String?),
          receiver: $checkedConvert('receiver', (v) => v as String?),
          blockTime: $checkedConvert('block_time', (v) => v as String?),
          nft: $checkedConvert(
              'nft',
              (v) => v == null
                  ? null
                  : CollectionActivityNFTModel.fromJson(
                      Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
      fieldKeyMap: const {'usdPrice': 'usd_price', 'blockTime': 'block_time'},
    );

const _$$CollectionActivityModelImplFieldMap = <String, String>{
  'id': 'id',
  'type': 'type',
  'price': 'price',
  'usdPrice': 'usd_price',
  'sender': 'sender',
  'receiver': 'receiver',
  'blockTime': 'block_time',
  'nft': 'nft',
};

abstract final class _$$CollectionActivityModelImplJsonKeys {
  static const String id = 'id';
  static const String type = 'type';
  static const String price = 'price';
  static const String usdPrice = 'usd_price';
  static const String sender = 'sender';
  static const String receiver = 'receiver';
  static const String blockTime = 'block_time';
  static const String nft = 'nft';
}

// ignore: unused_element
abstract class _$$CollectionActivityModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? id(String? instance) => instance;
  // ignore: unused_element
  static Object? type(String? instance) => instance;
  // ignore: unused_element
  static Object? price(int? instance) => instance;
  // ignore: unused_element
  static Object? usdPrice(double? instance) => instance;
  // ignore: unused_element
  static Object? sender(String? instance) => instance;
  // ignore: unused_element
  static Object? receiver(String? instance) => instance;
  // ignore: unused_element
  static Object? blockTime(String? instance) => instance;
  // ignore: unused_element
  static Object? nft(CollectionActivityNFTModel? instance) =>
      instance?.toJson();
}

Map<String, dynamic> _$$CollectionActivityModelImplToJson(
        _$CollectionActivityModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.type case final value?) 'type': value,
      if (instance.price case final value?) 'price': value,
      if (instance.usdPrice case final value?) 'usd_price': value,
      if (instance.sender case final value?) 'sender': value,
      if (instance.receiver case final value?) 'receiver': value,
      if (instance.blockTime case final value?) 'block_time': value,
      if (instance.nft?.toJson() case final value?) 'nft': value,
    };

_$CollectionActivityNFTModelImpl _$$CollectionActivityNFTModelImplFromJson(
        Map json) =>
    $checkedCreate(
      r'_$CollectionActivityNFTModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['id', 'name', 'media_url', 'ranking'],
        );
        final val = _$CollectionActivityNFTModelImpl(
          id: $checkedConvert('id', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          mediaUrl: $checkedConvert('media_url', (v) => v as String?),
          ranking: $checkedConvert('ranking', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'mediaUrl': 'media_url'},
    );

const _$$CollectionActivityNFTModelImplFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'mediaUrl': 'media_url',
  'ranking': 'ranking',
};

abstract final class _$$CollectionActivityNFTModelImplJsonKeys {
  static const String id = 'id';
  static const String name = 'name';
  static const String mediaUrl = 'media_url';
  static const String ranking = 'ranking';
}

// ignore: unused_element
abstract class _$$CollectionActivityNFTModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? id(String? instance) => instance;
  // ignore: unused_element
  static Object? name(String? instance) => instance;
  // ignore: unused_element
  static Object? mediaUrl(String? instance) => instance;
  // ignore: unused_element
  static Object? ranking(int? instance) => instance;
}

Map<String, dynamic> _$$CollectionActivityNFTModelImplToJson(
        _$CollectionActivityNFTModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.mediaUrl case final value?) 'media_url': value,
      if (instance.ranking case final value?) 'ranking': value,
    };
