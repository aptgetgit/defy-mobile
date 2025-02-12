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
          allowedKeys: const ['namespace', 'reference', 'rpc_url'],
        );
        final val = _$NetworkConfigRemoteModelImpl(
          namespace: $checkedConvert('namespace', (v) => v as String),
          reference: $checkedConvert('reference', (v) => v as String),
          rpcUrl: $checkedConvert('rpc_url', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'rpcUrl': 'rpc_url'},
    );

const _$$NetworkConfigRemoteModelImplFieldMap = <String, String>{
  'namespace': 'namespace',
  'reference': 'reference',
  'rpcUrl': 'rpc_url',
};

abstract final class _$$NetworkConfigRemoteModelImplJsonKeys {
  static const String namespace = 'namespace';
  static const String reference = 'reference';
  static const String rpcUrl = 'rpc_url';
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
      'rpc_url': instance.rpcUrl,
    };

_$NetworkConfigResponseModelImpl _$$NetworkConfigResponseModelImplFromJson(
        Map json) =>
    $checkedCreate(
      r'_$NetworkConfigResponseModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['data'],
        );
        final val = _$NetworkConfigResponseModelImpl(
          data: $checkedConvert(
              'data',
              (v) => (v as List<dynamic>)
                  .map((e) => NetworkConfigRemoteModel.fromJson(
                      Map<String, dynamic>.from(e as Map)))
                  .toList()),
        );
        return val;
      },
    );

const _$$NetworkConfigResponseModelImplFieldMap = <String, String>{
  'data': 'data',
};

abstract final class _$$NetworkConfigResponseModelImplJsonKeys {
  static const String data = 'data';
}

// ignore: unused_element
abstract class _$$NetworkConfigResponseModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? data(List<NetworkConfigRemoteModel> instance) =>
      instance.map((e) => e.toJson()).toList();
}

Map<String, dynamic> _$$NetworkConfigResponseModelImplToJson(
        _$NetworkConfigResponseModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
