// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_blockchain_account_group_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBlockchainAccountGroupRemoteModelImpl
    _$$UserBlockchainAccountGroupRemoteModelImplFromJson(
            Map<String, dynamic> json) =>
        _$UserBlockchainAccountGroupRemoteModelImpl(
          id: json['id'] as String,
          name: json['name'] as String,
          icon: json['icon'] as String,
          color: json['color'] as String,
        );

Map<String, dynamic> _$$UserBlockchainAccountGroupRemoteModelImplToJson(
        _$UserBlockchainAccountGroupRemoteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'color': instance.color,
    };

_$CreateUserBlockchainAccountGroupRemoteRequestImpl
    _$$CreateUserBlockchainAccountGroupRemoteRequestImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateUserBlockchainAccountGroupRemoteRequestImpl(
          name: json['name'] as String,
          icon: json['icon'] as String,
          color: json['color'] as String,
        );

Map<String, dynamic> _$$CreateUserBlockchainAccountGroupRemoteRequestImplToJson(
        _$CreateUserBlockchainAccountGroupRemoteRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'color': instance.color,
    };

_$UpdateUserBlockchainAccountGroupRemoteRequestImpl
    _$$UpdateUserBlockchainAccountGroupRemoteRequestImplFromJson(
            Map<String, dynamic> json) =>
        _$UpdateUserBlockchainAccountGroupRemoteRequestImpl(
          name: json['name'] as String,
          icon: json['icon'] as String,
          color: json['color'] as String,
        );

Map<String, dynamic> _$$UpdateUserBlockchainAccountGroupRemoteRequestImplToJson(
        _$UpdateUserBlockchainAccountGroupRemoteRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'color': instance.color,
    };
