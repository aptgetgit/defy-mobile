// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyImpl _$$CurrencyImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyImpl(
      code: json['code'] as String,
      symbol: json['symbol'] as String,
      decimals: (json['decimals'] as num?)?.toInt() ?? 2,
    );

Map<String, dynamic> _$$CurrencyImplToJson(_$CurrencyImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'symbol': instance.symbol,
      'decimals': instance.decimals,
    };
