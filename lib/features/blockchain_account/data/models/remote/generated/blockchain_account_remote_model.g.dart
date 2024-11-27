// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../blockchain_account_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlockchainAccountRemoteModelImpl _$$BlockchainAccountRemoteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BlockchainAccountRemoteModelImpl(
      id: json['id'] as String,
      blockchainNetworkId: json['blockchainNetworkId'] as String,
      accountAddress: json['accountAddress'] as String,
    );

Map<String, dynamic> _$$BlockchainAccountRemoteModelImplToJson(
        _$BlockchainAccountRemoteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'blockchainNetworkId': instance.blockchainNetworkId,
      'accountAddress': instance.accountAddress,
    };

_$CreateBlockchainAccountRemoteRequestImpl
    _$$CreateBlockchainAccountRemoteRequestImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateBlockchainAccountRemoteRequestImpl(
          blockchainNetworkId: json['blockchainNetworkId'] as String,
          accountAddress: json['accountAddress'] as String,
        );

Map<String, dynamic> _$$CreateBlockchainAccountRemoteRequestImplToJson(
        _$CreateBlockchainAccountRemoteRequestImpl instance) =>
    <String, dynamic>{
      'blockchainNetworkId': instance.blockchainNetworkId,
      'accountAddress': instance.accountAddress,
    };
