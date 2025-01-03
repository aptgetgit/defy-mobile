// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../wallet_inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletInventoryModelImpl _$$WalletInventoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletInventoryModelImpl(
      aptos: AptosModel.fromJson(json['aptos'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WalletInventoryModelImplToJson(
        _$WalletInventoryModelImpl instance) =>
    <String, dynamic>{
      'aptos': instance.aptos,
    };

_$AptosModelImpl _$$AptosModelImplFromJson(Map<String, dynamic> json) =>
    _$AptosModelImpl(
      collections: (json['collections'] as List<dynamic>)
          .map((e) => CollectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AptosModelImplToJson(_$AptosModelImpl instance) =>
    <String, dynamic>{
      'collections': instance.collections,
    };

_$CollectionModelImpl _$$CollectionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CollectionModelImpl(
      title: json['title'] as String,
      description: json['description'] as String?,
      floor: (json['floor'] as num?)?.toDouble(),
      usdVolume: (json['usd_volume'] as num?)?.toDouble(),
      verified: json['verified'] as bool,
      coverUrl: json['cover_url'] as String?,
      nfts: (json['nfts'] as List<dynamic>)
          .map((e) => NFTModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CollectionModelImplToJson(
        _$CollectionModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'floor': instance.floor,
      'usd_volume': instance.usdVolume,
      'verified': instance.verified,
      'cover_url': instance.coverUrl,
      'nfts': instance.nfts,
    };

_$NFTModelImpl _$$NFTModelImplFromJson(Map<String, dynamic> json) =>
    _$NFTModelImpl(
      mediaUrl: json['media_url'] as String,
      name: json['name'] as String,
      owner: json['owner'] as String,
      collection: CollectionTitleModel.fromJson(
          json['collection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NFTModelImplToJson(_$NFTModelImpl instance) =>
    <String, dynamic>{
      'media_url': instance.mediaUrl,
      'name': instance.name,
      'owner': instance.owner,
      'collection': instance.collection,
    };

_$CollectionTitleModelImpl _$$CollectionTitleModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CollectionTitleModelImpl(
      title: json['title'] as String,
    );

Map<String, dynamic> _$$CollectionTitleModelImplToJson(
        _$CollectionTitleModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
