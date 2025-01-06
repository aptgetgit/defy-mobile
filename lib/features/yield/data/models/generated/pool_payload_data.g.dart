// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../pool_payload_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoolPayloadDataModel _$PoolPayloadDataModelFromJson(
        Map<String, dynamic> json) =>
    PoolPayloadDataModel(
      functionId: json['function_id'] as String? ?? '',
      typeArguments: PoolPayloadDataModel._parseList(json['type_arguments']),
      arguments: PoolPayloadDataModel._parseList(json['arguments']),
    );

Map<String, dynamic> _$PoolPayloadDataModelToJson(
        PoolPayloadDataModel instance) =>
    <String, dynamic>{
      'function_id': instance.functionId,
      'type_arguments':
          PoolPayloadDataModel._listToJson(instance.typeArguments),
      'arguments': PoolPayloadDataModel._listToJson(instance.arguments),
    };
