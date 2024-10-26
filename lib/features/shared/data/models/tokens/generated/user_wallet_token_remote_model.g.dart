// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_wallet_token_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserWalletTokenRemoteModelImpl _$$UserWalletTokenRemoteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserWalletTokenRemoteModelImpl(
      metaData: json['metadata'] == null
          ? null
          : MetaDataModel.fromJson(json['metadata'] as Map<String, dynamic>),
      ownerAddress: json['owner_address'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      assetType: json['asset_type'] as String?,
      isFrozen: json['is_frozen'] as bool?,
    );

Map<String, dynamic> _$$UserWalletTokenRemoteModelImplToJson(
        _$UserWalletTokenRemoteModelImpl instance) =>
    <String, dynamic>{
      'metadata': instance.metaData,
      'owner_address': instance.ownerAddress,
      'amount': instance.amount,
      'asset_type': instance.assetType,
      'is_frozen': instance.isFrozen,
    };

_$MetaDataModelImpl _$$MetaDataModelImplFromJson(Map<String, dynamic> json) =>
    _$MetaDataModelImpl(
      decimals: (json['decimals'] as num?)?.toInt(),
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
    );

Map<String, dynamic> _$$MetaDataModelImplToJson(_$MetaDataModelImpl instance) =>
    <String, dynamic>{
      'decimals': instance.decimals,
      'name': instance.name,
      'symbol': instance.symbol,
    };
