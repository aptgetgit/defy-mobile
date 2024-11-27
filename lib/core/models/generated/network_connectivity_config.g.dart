// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../network_connectivity_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkConnectivityConfigImpl _$$NetworkConnectivityConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$NetworkConnectivityConfigImpl(
      checkUrls: (json['check_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['https://8.8.8.8', 'https://1.1.1.1', 'https://google.com'],
      timeout: json['timeout'] == null
          ? const Duration(seconds: 5)
          : Duration(microseconds: (json['timeout'] as num).toInt()),
      lookupAddress: json['lookup_address'] as String? ?? 'google.com',
    );

Map<String, dynamic> _$$NetworkConnectivityConfigImplToJson(
        _$NetworkConnectivityConfigImpl instance) =>
    <String, dynamic>{
      'check_urls': instance.checkUrls,
      'timeout': instance.timeout.inMicroseconds,
      'lookup_address': instance.lookupAddress,
    };
