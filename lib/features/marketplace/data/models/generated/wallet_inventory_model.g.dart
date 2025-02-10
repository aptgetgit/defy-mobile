// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../wallet_inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletInventoryModelImpl _$$WalletInventoryModelImplFromJson(Map json) =>
    $checkedCreate(
      r'_$WalletInventoryModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['aptos'],
        );
        final val = _$WalletInventoryModelImpl(
          aptos: $checkedConvert('aptos',
              (v) => AptosModel.fromJson(Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
    );

const _$$WalletInventoryModelImplFieldMap = <String, String>{
  'aptos': 'aptos',
};

abstract final class _$$WalletInventoryModelImplJsonKeys {
  static const String aptos = 'aptos';
}

// ignore: unused_element
abstract class _$$WalletInventoryModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? aptos(AptosModel instance) => instance.toJson();
}

Map<String, dynamic> _$$WalletInventoryModelImplToJson(
        _$WalletInventoryModelImpl instance) =>
    <String, dynamic>{
      'aptos': instance.aptos.toJson(),
    };

_$AptosModelImpl _$$AptosModelImplFromJson(Map json) => $checkedCreate(
      r'_$AptosModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['collections'],
        );
        final val = _$AptosModelImpl(
          collections: $checkedConvert(
              'collections',
              (v) => (v as List<dynamic>)
                  .map((e) => CollectionModel.fromJson(
                      Map<String, dynamic>.from(e as Map)))
                  .toList()),
        );
        return val;
      },
    );

const _$$AptosModelImplFieldMap = <String, String>{
  'collections': 'collections',
};

abstract final class _$$AptosModelImplJsonKeys {
  static const String collections = 'collections';
}

// ignore: unused_element
abstract class _$$AptosModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? collections(List<CollectionModel> instance) =>
      instance.map((e) => e.toJson()).toList();
}

Map<String, dynamic> _$$AptosModelImplToJson(_$AptosModelImpl instance) =>
    <String, dynamic>{
      'collections': instance.collections.map((e) => e.toJson()).toList(),
    };

_$CollectionModelImpl _$$CollectionModelImplFromJson(Map json) =>
    $checkedCreate(
      r'_$CollectionModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'title',
            'description',
            'floor',
            'usd_volume',
            'verified',
            'cover_url',
            'nfts'
          ],
        );
        final val = _$CollectionModelImpl(
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String?),
          floor: $checkedConvert('floor', (v) => (v as num?)?.toDouble()),
          usdVolume:
              $checkedConvert('usd_volume', (v) => (v as num?)?.toDouble()),
          verified: $checkedConvert('verified', (v) => v as bool),
          coverUrl: $checkedConvert('cover_url', (v) => v as String?),
          nfts: $checkedConvert(
              'nfts',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      NFTModel.fromJson(Map<String, dynamic>.from(e as Map)))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'usdVolume': 'usd_volume', 'coverUrl': 'cover_url'},
    );

const _$$CollectionModelImplFieldMap = <String, String>{
  'title': 'title',
  'description': 'description',
  'floor': 'floor',
  'usdVolume': 'usd_volume',
  'verified': 'verified',
  'coverUrl': 'cover_url',
  'nfts': 'nfts',
};

abstract final class _$$CollectionModelImplJsonKeys {
  static const String title = 'title';
  static const String description = 'description';
  static const String floor = 'floor';
  static const String usdVolume = 'usd_volume';
  static const String verified = 'verified';
  static const String coverUrl = 'cover_url';
  static const String nfts = 'nfts';
}

// ignore: unused_element
abstract class _$$CollectionModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? title(String instance) => instance;
  // ignore: unused_element
  static Object? description(String? instance) => instance;
  // ignore: unused_element
  static Object? floor(double? instance) => instance;
  // ignore: unused_element
  static Object? usdVolume(double? instance) => instance;
  // ignore: unused_element
  static Object? verified(bool instance) => instance;
  // ignore: unused_element
  static Object? coverUrl(String? instance) => instance;
  // ignore: unused_element
  static Object? nfts(List<NFTModel> instance) =>
      instance.map((e) => e.toJson()).toList();
}

Map<String, dynamic> _$$CollectionModelImplToJson(
        _$CollectionModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      if (instance.description case final value?) 'description': value,
      if (instance.floor case final value?) 'floor': value,
      if (instance.usdVolume case final value?) 'usd_volume': value,
      'verified': instance.verified,
      if (instance.coverUrl case final value?) 'cover_url': value,
      'nfts': instance.nfts.map((e) => e.toJson()).toList(),
    };

_$NFTModelImpl _$$NFTModelImplFromJson(Map json) => $checkedCreate(
      r'_$NFTModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['media_url', 'name', 'owner', 'collection'],
        );
        final val = _$NFTModelImpl(
          mediaUrl: $checkedConvert('media_url', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          owner: $checkedConvert('owner', (v) => v as String),
          collection: $checkedConvert(
              'collection',
              (v) => CollectionTitleModel.fromJson(
                  Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
      fieldKeyMap: const {'mediaUrl': 'media_url'},
    );

const _$$NFTModelImplFieldMap = <String, String>{
  'mediaUrl': 'media_url',
  'name': 'name',
  'owner': 'owner',
  'collection': 'collection',
};

abstract final class _$$NFTModelImplJsonKeys {
  static const String mediaUrl = 'media_url';
  static const String name = 'name';
  static const String owner = 'owner';
  static const String collection = 'collection';
}

// ignore: unused_element
abstract class _$$NFTModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? mediaUrl(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? owner(String instance) => instance;
  // ignore: unused_element
  static Object? collection(CollectionTitleModel instance) => instance.toJson();
}

Map<String, dynamic> _$$NFTModelImplToJson(_$NFTModelImpl instance) =>
    <String, dynamic>{
      'media_url': instance.mediaUrl,
      'name': instance.name,
      'owner': instance.owner,
      'collection': instance.collection.toJson(),
    };

_$CollectionTitleModelImpl _$$CollectionTitleModelImplFromJson(Map json) =>
    $checkedCreate(
      r'_$CollectionTitleModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['title'],
        );
        final val = _$CollectionTitleModelImpl(
          title: $checkedConvert('title', (v) => v as String),
        );
        return val;
      },
    );

const _$$CollectionTitleModelImplFieldMap = <String, String>{
  'title': 'title',
};

abstract final class _$$CollectionTitleModelImplJsonKeys {
  static const String title = 'title';
}

// ignore: unused_element
abstract class _$$CollectionTitleModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? title(String instance) => instance;
}

Map<String, dynamic> _$$CollectionTitleModelImplToJson(
        _$CollectionTitleModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
