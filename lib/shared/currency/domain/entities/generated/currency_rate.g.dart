// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../currency_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyRateImpl _$$CurrencyRateImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyRateImpl(
      id: json['id'] as String,
      code: json['code'] as String,
      rate: (json['rate'] as num).toDouble(),
      lastUpdate: DateTime.parse(json['last_update'] as String),
    );

Map<String, dynamic> _$$CurrencyRateImplToJson(_$CurrencyRateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'rate': instance.rate,
      'last_update': instance.lastUpdate.toIso8601String(),
    };
