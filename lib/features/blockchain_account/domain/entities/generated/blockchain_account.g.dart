// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../blockchain_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlockchainAccountImpl _$$BlockchainAccountImplFromJson(
        Map<String, dynamic> json) =>
    _$BlockchainAccountImpl(
      id: json['id'] as String,
      accountAddress: json['account_address'] as String,
      blockchainNetworkId: json['blockchain_network_id'] as String,
    );

Map<String, dynamic> _$$BlockchainAccountImplToJson(
        _$BlockchainAccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_address': instance.accountAddress,
      'blockchain_network_id': instance.blockchainNetworkId,
    };
