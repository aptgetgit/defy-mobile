// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../blockchain_account_group_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlockchainAccountGroupRemoteModelImpl
    _$$BlockchainAccountGroupRemoteModelImplFromJson(
            Map<String, dynamic> json) =>
        _$BlockchainAccountGroupRemoteModelImpl(
          id: json['id'] as String,
          name: json['name'] as String,
          icon: json['icon'] as String,
          color: json['color'] as String,
        );

Map<String, dynamic> _$$BlockchainAccountGroupRemoteModelImplToJson(
        _$BlockchainAccountGroupRemoteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'color': instance.color,
    };

_$CreateBlockchainAccountGroupRemoteRequestImpl
    _$$CreateBlockchainAccountGroupRemoteRequestImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateBlockchainAccountGroupRemoteRequestImpl(
          name: json['name'] as String,
          icon: json['icon'] as String,
          color: json['color'] as String,
        );

Map<String, dynamic> _$$CreateBlockchainAccountGroupRemoteRequestImplToJson(
        _$CreateBlockchainAccountGroupRemoteRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'color': instance.color,
    };

_$UpdateBlockchainAccountGroupRemoteRequestImpl
    _$$UpdateBlockchainAccountGroupRemoteRequestImplFromJson(
            Map<String, dynamic> json) =>
        _$UpdateBlockchainAccountGroupRemoteRequestImpl(
          name: json['name'] as String,
          icon: json['icon'] as String,
          color: json['color'] as String,
        );

Map<String, dynamic> _$$UpdateBlockchainAccountGroupRemoteRequestImplToJson(
        _$UpdateBlockchainAccountGroupRemoteRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'color': instance.color,
    };
