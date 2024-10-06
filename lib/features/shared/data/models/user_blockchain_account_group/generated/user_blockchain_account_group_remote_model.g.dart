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
          animatedIconUrl: json['animatedIconUrl'] as String,
          backgroundColor: json['backgroundColor'] as String,
        );

Map<String, dynamic> _$$UserBlockchainAccountGroupRemoteModelImplToJson(
        _$UserBlockchainAccountGroupRemoteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'animatedIconUrl': instance.animatedIconUrl,
      'backgroundColor': instance.backgroundColor,
    };

_$CreateUserBlockchainAccountGroupRemoteRequestImpl
    _$$CreateUserBlockchainAccountGroupRemoteRequestImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateUserBlockchainAccountGroupRemoteRequestImpl(
          name: json['name'] as String,
          animatedIconUrl: json['animatedIconUrl'] as String,
          backgroundColor: json['backgroundColor'] as String,
        );

Map<String, dynamic> _$$CreateUserBlockchainAccountGroupRemoteRequestImplToJson(
        _$CreateUserBlockchainAccountGroupRemoteRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'animatedIconUrl': instance.animatedIconUrl,
      'backgroundColor': instance.backgroundColor,
    };

_$UpdateUserBlockchainAccountGroupRemoteRequestImpl
    _$$UpdateUserBlockchainAccountGroupRemoteRequestImplFromJson(
            Map<String, dynamic> json) =>
        _$UpdateUserBlockchainAccountGroupRemoteRequestImpl(
          name: json['name'] as String,
          animatedIconUrl: json['animatedIconUrl'] as String,
          backgroundColor: json['backgroundColor'] as String,
        );

Map<String, dynamic> _$$UpdateUserBlockchainAccountGroupRemoteRequestImplToJson(
        _$UpdateUserBlockchainAccountGroupRemoteRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'animatedIconUrl': instance.animatedIconUrl,
      'backgroundColor': instance.backgroundColor,
    };
