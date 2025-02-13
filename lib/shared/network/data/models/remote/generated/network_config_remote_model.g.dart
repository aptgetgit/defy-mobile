// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../network_config_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkConfigRemoteModelImpl _$$NetworkConfigRemoteModelImplFromJson(
        Map json) =>
    $checkedCreate(
      r'_$NetworkConfigRemoteModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['namespace', 'reference', 'rpcUrl'],
        );
        final val = _$NetworkConfigRemoteModelImpl(
          namespace: $checkedConvert('namespace', (v) => v as String),
          reference: $checkedConvert('reference', (v) => v as String),
          rpcUrl: $checkedConvert('rpcUrl', (v) => v as String),
        );
        return val;
      },
    );

const _$$NetworkConfigRemoteModelImplFieldMap = <String, String>{
  'namespace': 'namespace',
  'reference': 'reference',
  'rpcUrl': 'rpcUrl',
};

abstract final class _$$NetworkConfigRemoteModelImplJsonKeys {
  static const String namespace = 'namespace';
  static const String reference = 'reference';
  static const String rpcUrl = 'rpcUrl';
}

// ignore: unused_element
abstract class _$$NetworkConfigRemoteModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? namespace(String instance) => instance;
  // ignore: unused_element
  static Object? reference(String instance) => instance;
  // ignore: unused_element
  static Object? rpcUrl(String instance) => instance;
}

Map<String, dynamic> _$$NetworkConfigRemoteModelImplToJson(
        _$NetworkConfigRemoteModelImpl instance) =>
    <String, dynamic>{
      'namespace': instance.namespace,
      'reference': instance.reference,
      'rpcUrl': instance.rpcUrl,
    };
