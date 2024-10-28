// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_wallet_nft_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserWalletNFTRemoteModelImpl _$$UserWalletNFTRemoteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserWalletNFTRemoteModelImpl(
      nftId: json['nft_id'] as String?,
      acquiredUsdPrice: json['acquired_usd_price'] as String?,
      acquiredPrice: json['acquired_price'] as String?,
      collection: json['collection'] == null
          ? null
          : NFTCollectionRemoteModel.fromJson(
              json['collection'] as Map<String, dynamic>),
      nft: json['nft'] == null
          ? null
          : NFTRemoteModel.fromJson(json['nft'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserWalletNFTRemoteModelImplToJson(
        _$UserWalletNFTRemoteModelImpl instance) =>
    <String, dynamic>{
      'nft_id': instance.nftId,
      'acquired_usd_price': instance.acquiredUsdPrice,
      'acquired_price': instance.acquiredPrice,
      'collection': instance.collection,
      'nft': instance.nft,
    };

_$NFTCollectionRemoteModelImpl _$$NFTCollectionRemoteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NFTCollectionRemoteModelImpl(
      coverUrl: json['cover_url'] as String?,
      title: json['title'] as String?,
      verified: json['verified'] as bool?,
      id: json['id'] as String?,
      floor: (json['floor'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NFTCollectionRemoteModelImplToJson(
        _$NFTCollectionRemoteModelImpl instance) =>
    <String, dynamic>{
      'cover_url': instance.coverUrl,
      'title': instance.title,
      'verified': instance.verified,
      'id': instance.id,
      'floor': instance.floor,
    };

_$NFTRemoteModelImpl _$$NFTRemoteModelImplFromJson(Map<String, dynamic> json) =>
    _$NFTRemoteModelImpl(
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      staked: json['staked'] as bool?,
      tokenId: json['token_id'] as String?,
      burned: json['burned'] as bool?,
      mediaType: json['media_type'] as String?,
      mediaUrl: json['media_url'] as String?,
      contractId: json['contract_id'] as String?,
      version: (json['version'] as num?)?.toInt(),
      listings: (json['listings'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NFTListingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NFTRemoteModelImplToJson(
        _$NFTRemoteModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'staked': instance.staked,
      'token_id': instance.tokenId,
      'burned': instance.burned,
      'media_type': instance.mediaType,
      'media_url': instance.mediaUrl,
      'contract_id': instance.contractId,
      'version': instance.version,
      'listings': instance.listings,
    };

_$NFTListingModelImpl _$$NFTListingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NFTListingModelImpl(
      listed: json['listed'] as bool?,
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NFTListingModelImplToJson(
        _$NFTListingModelImpl instance) =>
    <String, dynamic>{
      'listed': instance.listed,
      'price': instance.price,
    };
