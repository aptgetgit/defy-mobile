// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_wallet_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserWalletTokenImpl _$$UserWalletTokenImplFromJson(
        Map<String, dynamic> json) =>
    _$UserWalletTokenImpl(
      metaData: json['meta_data'] == null
          ? null
          : MetaDataEntity.fromJson(json['meta_data'] as Map<String, dynamic>),
      ownerAddress: json['owner_address'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      assetType: json['asset_type'] as String?,
      isFrozen: json['is_frozen'] as bool?,
    );

Map<String, dynamic> _$$UserWalletTokenImplToJson(
        _$UserWalletTokenImpl instance) =>
    <String, dynamic>{
      'meta_data': instance.metaData,
      'owner_address': instance.ownerAddress,
      'amount': instance.amount,
      'asset_type': instance.assetType,
      'is_frozen': instance.isFrozen,
    };

_$MetaDataEntityImpl _$$MetaDataEntityImplFromJson(Map<String, dynamic> json) =>
    _$MetaDataEntityImpl(
      decimals: (json['decimals'] as num?)?.toInt(),
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
    );

Map<String, dynamic> _$$MetaDataEntityImplToJson(
        _$MetaDataEntityImpl instance) =>
    <String, dynamic>{
      'decimals': instance.decimals,
      'name': instance.name,
      'symbol': instance.symbol,
    };
