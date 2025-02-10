// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_blockchain_account_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBlockchainAccountRemoteModelImpl
    _$$UserBlockchainAccountRemoteModelImplFromJson(Map json) => $checkedCreate(
          r'_$UserBlockchainAccountRemoteModelImpl',
          json,
          ($checkedConvert) {
            $checkKeys(
              json,
              allowedKeys: const [
                'id',
                'blockchainNetworkId',
                'accountAddress'
              ],
            );
            final val = _$UserBlockchainAccountRemoteModelImpl(
              id: $checkedConvert('id', (v) => v as String),
              blockchainNetworkId:
                  $checkedConvert('blockchainNetworkId', (v) => v as String),
              accountAddress:
                  $checkedConvert('accountAddress', (v) => v as String),
            );
            return val;
          },
        );

const _$$UserBlockchainAccountRemoteModelImplFieldMap = <String, String>{
  'id': 'id',
  'blockchainNetworkId': 'blockchainNetworkId',
  'accountAddress': 'accountAddress',
};

abstract final class _$$UserBlockchainAccountRemoteModelImplJsonKeys {
  static const String id = 'id';
  static const String blockchainNetworkId = 'blockchainNetworkId';
  static const String accountAddress = 'accountAddress';
}

// ignore: unused_element
abstract class _$$UserBlockchainAccountRemoteModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? blockchainNetworkId(String instance) => instance;
  // ignore: unused_element
  static Object? accountAddress(String instance) => instance;
}

Map<String, dynamic> _$$UserBlockchainAccountRemoteModelImplToJson(
        _$UserBlockchainAccountRemoteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'blockchainNetworkId': instance.blockchainNetworkId,
      'accountAddress': instance.accountAddress,
    };

_$CreateUserBlockchainAccountRemoteRequestImpl
    _$$CreateUserBlockchainAccountRemoteRequestImplFromJson(Map json) =>
        $checkedCreate(
          r'_$CreateUserBlockchainAccountRemoteRequestImpl',
          json,
          ($checkedConvert) {
            $checkKeys(
              json,
              allowedKeys: const ['blockchainNetworkId', 'accountAddress'],
            );
            final val = _$CreateUserBlockchainAccountRemoteRequestImpl(
              blockchainNetworkId:
                  $checkedConvert('blockchainNetworkId', (v) => v as String),
              accountAddress:
                  $checkedConvert('accountAddress', (v) => v as String),
            );
            return val;
          },
        );

const _$$CreateUserBlockchainAccountRemoteRequestImplFieldMap =
    <String, String>{
  'blockchainNetworkId': 'blockchainNetworkId',
  'accountAddress': 'accountAddress',
};

abstract final class _$$CreateUserBlockchainAccountRemoteRequestImplJsonKeys {
  static const String blockchainNetworkId = 'blockchainNetworkId';
  static const String accountAddress = 'accountAddress';
}

// ignore: unused_element
abstract class _$$CreateUserBlockchainAccountRemoteRequestImplPerFieldToJson {
  // ignore: unused_element
  static Object? blockchainNetworkId(String instance) => instance;
  // ignore: unused_element
  static Object? accountAddress(String instance) => instance;
}

Map<String, dynamic> _$$CreateUserBlockchainAccountRemoteRequestImplToJson(
        _$CreateUserBlockchainAccountRemoteRequestImpl instance) =>
    <String, dynamic>{
      'blockchainNetworkId': instance.blockchainNetworkId,
      'accountAddress': instance.accountAddress,
    };
