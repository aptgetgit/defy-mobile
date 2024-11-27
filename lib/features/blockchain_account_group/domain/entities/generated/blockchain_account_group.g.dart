// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../blockchain_account_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlockchainAccountGroupImpl _$$BlockchainAccountGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$BlockchainAccountGroupImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$$BlockchainAccountGroupImplToJson(
        _$BlockchainAccountGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'color': instance.color,
    };
