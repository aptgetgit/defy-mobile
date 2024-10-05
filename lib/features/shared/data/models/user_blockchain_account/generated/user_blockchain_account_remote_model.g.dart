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
          blockchainNetworkId: json['blockchain_network_id'] as String,
          accountAddress: json['account_address'] as String,
        );

Map<String, dynamic> _$$UserBlockchainAccountRemoteModelImplToJson(
        _$UserBlockchainAccountRemoteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'blockchain_network_id': instance.blockchainNetworkId,
      'account_address': instance.accountAddress,
    };

_$CreateUserBlockchainAccountRemoteRequestImpl
    _$$CreateUserBlockchainAccountRemoteRequestImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateUserBlockchainAccountRemoteRequestImpl(
          blockchainNetworkId: json['blockchain_network_id'] as String,
          accountAddress: json['account_address'] as String,
        );

Map<String, dynamic> _$$CreateUserBlockchainAccountRemoteRequestImplToJson(
        _$CreateUserBlockchainAccountRemoteRequestImpl instance) =>
    <String, dynamic>{
      'blockchain_network_id': instance.blockchainNetworkId,
      'account_address': instance.accountAddress,
    };
