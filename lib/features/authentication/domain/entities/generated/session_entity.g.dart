// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../session_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionEntityImpl _$$SessionEntityImplFromJson(Map<String, dynamic> json) =>
    _$SessionEntityImpl(
      active: json['active'] as bool,
      identity:
          IdentityEntity.fromJson(json['identity'] as Map<String, dynamic>),
      id: json['id'] as String,
      issuedAt: DateTime.parse(json['issued_at'] as String),
      expiresAt: DateTime.parse(json['expires_at'] as String),
      authenticatedAt: DateTime.parse(json['authenticated_at'] as String),
      authenticatorAssuranceLevel: $enumDecode(
          _$AssuranceLevelEnumMap, json['authenticator_assurance_level']),
    );

Map<String, dynamic> _$$SessionEntityImplToJson(_$SessionEntityImpl instance) =>
    <String, dynamic>{
      'active': instance.active,
      'identity': instance.identity,
      'id': instance.id,
      'issued_at': instance.issuedAt.toIso8601String(),
      'expires_at': instance.expiresAt.toIso8601String(),
      'authenticated_at': instance.authenticatedAt.toIso8601String(),
      'authenticator_assurance_level':
          _$AssuranceLevelEnumMap[instance.authenticatorAssuranceLevel]!,
    };

const _$AssuranceLevelEnumMap = {
  AssuranceLevel.aal1: 'aal1',
  AssuranceLevel.aal2: 'aal2',
  AssuranceLevel.aal3: 'aal3',
};

_$IdentityEntityImpl _$$IdentityEntityImplFromJson(Map<String, dynamic> json) =>
    _$IdentityEntityImpl(
      id: json['id'] as String,
      traits: TraitsEntity.fromJson(json['traits'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$IdentityEntityImplToJson(
        _$IdentityEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'traits': instance.traits,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$TraitsEntityImpl _$$TraitsEntityImplFromJson(Map<String, dynamic> json) =>
    _$TraitsEntityImpl(
      email: json['email'] as String,
      username: json['username'] as String,
      displayName: json['display_name'] as String,
    );

Map<String, dynamic> _$$TraitsEntityImplToJson(_$TraitsEntityImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'display_name': instance.displayName,
    };
