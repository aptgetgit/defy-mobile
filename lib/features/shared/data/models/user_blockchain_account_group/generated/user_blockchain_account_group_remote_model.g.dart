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
          animatedIconUrl: json['animated_icon_url'] as String,
          backgroundColor: json['background_color'] as String,
        );

Map<String, dynamic> _$$UserBlockchainAccountGroupRemoteModelImplToJson(
        _$UserBlockchainAccountGroupRemoteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'animated_icon_url': instance.animatedIconUrl,
      'background_color': instance.backgroundColor,
    };

_$CreateUserBlockchainAccountGroupRemoteRequestImpl
    _$$CreateUserBlockchainAccountGroupRemoteRequestImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateUserBlockchainAccountGroupRemoteRequestImpl(
          name: json['name'] as String,
          animatedIconUrl: json['animated_icon_url'] as String,
          backgroundColor: json['background_color'] as String,
        );

Map<String, dynamic> _$$CreateUserBlockchainAccountGroupRemoteRequestImplToJson(
        _$CreateUserBlockchainAccountGroupRemoteRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'animated_icon_url': instance.animatedIconUrl,
      'background_color': instance.backgroundColor,
    };

_$UpdateUserBlockchainAccountGroupRemoteRequestImpl
    _$$UpdateUserBlockchainAccountGroupRemoteRequestImplFromJson(
            Map<String, dynamic> json) =>
        _$UpdateUserBlockchainAccountGroupRemoteRequestImpl(
          name: json['name'] as String,
          animatedIconUrl: json['animated_icon_url'] as String,
          backgroundColor: json['background_color'] as String,
        );

Map<String, dynamic> _$$UpdateUserBlockchainAccountGroupRemoteRequestImplToJson(
        _$UpdateUserBlockchainAccountGroupRemoteRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'animated_icon_url': instance.animatedIconUrl,
      'background_color': instance.backgroundColor,
    };
