// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_blockchain_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBlockchainAccountImpl _$$UserBlockchainAccountImplFromJson(Map json) =>
    $checkedCreate(
      r'_$UserBlockchainAccountImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['id', 'account_address', 'blockchain_network_id'],
        );
        final val = _$UserBlockchainAccountImpl(
          id: $checkedConvert('id', (v) => v as String),
          accountAddress:
              $checkedConvert('account_address', (v) => v as String),
          blockchainNetworkId:
              $checkedConvert('blockchain_network_id', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'accountAddress': 'account_address',
        'blockchainNetworkId': 'blockchain_network_id'
      },
    );

const _$$UserBlockchainAccountImplFieldMap = <String, String>{
  'id': 'id',
  'accountAddress': 'account_address',
  'blockchainNetworkId': 'blockchain_network_id',
};

abstract final class _$$UserBlockchainAccountImplJsonKeys {
  static const String id = 'id';
  static const String accountAddress = 'account_address';
  static const String blockchainNetworkId = 'blockchain_network_id';
}

// ignore: unused_element
abstract class _$$UserBlockchainAccountImplPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? accountAddress(String instance) => instance;
  // ignore: unused_element
  static Object? blockchainNetworkId(String instance) => instance;
}
