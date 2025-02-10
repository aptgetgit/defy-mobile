// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../blockchain_network_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlockchainNetworkRemoteModelImpl _$$BlockchainNetworkRemoteModelImplFromJson(
        Map json) =>
    $checkedCreate(
      r'_$BlockchainNetworkRemoteModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['id', 'namespace', 'reference'],
        );
        final val = _$BlockchainNetworkRemoteModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          namespace: $checkedConvert('namespace', (v) => v as String),
          reference: $checkedConvert('reference', (v) => v as String),
        );
        return val;
      },
    );

const _$$BlockchainNetworkRemoteModelImplFieldMap = <String, String>{
  'id': 'id',
  'namespace': 'namespace',
  'reference': 'reference',
};

abstract final class _$$BlockchainNetworkRemoteModelImplJsonKeys {
  static const String id = 'id';
  static const String namespace = 'namespace';
  static const String reference = 'reference';
}

// ignore: unused_element
abstract class _$$BlockchainNetworkRemoteModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? namespace(String instance) => instance;
  // ignore: unused_element
  static Object? reference(String instance) => instance;
}
