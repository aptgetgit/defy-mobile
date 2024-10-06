// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_blockchain_account_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBlockchainAccountRemoteModelImpl
    _$$UserBlockchainAccountRemoteModelImplFromJson(
            Map<String, dynamic> json) =>
        _$UserBlockchainAccountRemoteModelImpl(
          id: json['id'] as String,
          blockchainNetworkId: json['blockchainNetworkId'] as String,
          accountAddress: json['accountAddress'] as String,
        );

Map<String, dynamic> _$$UserBlockchainAccountRemoteModelImplToJson(
        _$UserBlockchainAccountRemoteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'blockchainNetworkId': instance.blockchainNetworkId,
      'accountAddress': instance.accountAddress,
    };

_$CreateUserBlockchainAccountRemoteRequestImpl
    _$$CreateUserBlockchainAccountRemoteRequestImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateUserBlockchainAccountRemoteRequestImpl(
          blockchainNetworkId: json['blockchainNetworkId'] as String,
          accountAddress: json['accountAddress'] as String,
        );

Map<String, dynamic> _$$CreateUserBlockchainAccountRemoteRequestImplToJson(
        _$CreateUserBlockchainAccountRemoteRequestImpl instance) =>
    <String, dynamic>{
      'blockchainNetworkId': instance.blockchainNetworkId,
      'accountAddress': instance.accountAddress,
    };
