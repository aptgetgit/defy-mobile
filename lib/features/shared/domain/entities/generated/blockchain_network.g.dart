// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../blockchain_network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlockchainNetworkImpl _$$BlockchainNetworkImplFromJson(Map json) =>
    $checkedCreate(
      r'_$BlockchainNetworkImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['id', 'namespace', 'reference'],
        );
        final val = _$BlockchainNetworkImpl(
          id: $checkedConvert('id', (v) => v as String),
          namespace: $checkedConvert('namespace', (v) => v as String),
          reference: $checkedConvert('reference', (v) => v as String),
        );
        return val;
      },
    );

const _$$BlockchainNetworkImplFieldMap = <String, String>{
  'id': 'id',
  'namespace': 'namespace',
  'reference': 'reference',
};

abstract final class _$$BlockchainNetworkImplJsonKeys {
  static const String id = 'id';
  static const String namespace = 'namespace';
  static const String reference = 'reference';
}

// ignore: unused_element
abstract class _$$BlockchainNetworkImplPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? namespace(String instance) => instance;
  // ignore: unused_element
  static Object? reference(String instance) => instance;
}
