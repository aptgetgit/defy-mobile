// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../pool_payload_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoolPayloadDataImpl _$$PoolPayloadDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PoolPayloadDataImpl(
      function_id: json['function_id'] as String,
      type_arguments: parseTypeArguments(json['type_arguments']),
      arguments: parseArguments(json['arguments']),
    );

Map<String, dynamic> _$$PoolPayloadDataImplToJson(
        _$PoolPayloadDataImpl instance) =>
    <String, dynamic>{
      'function_id': instance.function_id,
      'type_arguments': instance.type_arguments,
      'arguments': instance.arguments,
    };
