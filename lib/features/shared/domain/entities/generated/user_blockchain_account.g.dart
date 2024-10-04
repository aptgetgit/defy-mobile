// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_blockchain_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBlockchainAccountImpl _$$UserBlockchainAccountImplFromJson(
        Map<String, dynamic> json) =>
    _$UserBlockchainAccountImpl(
      id: json['id'] as String,
      accountAddress: json['account_address'] as String,
      blockchainNetworkId: json['blockchain_network_id'] as String,
    );

Map<String, dynamic> _$$UserBlockchainAccountImplToJson(
        _$UserBlockchainAccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_address': instance.accountAddress,
      'blockchain_network_id': instance.blockchainNetworkId,
    };
