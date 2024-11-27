// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../currency_rate_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyRateRemoteModelImpl _$$CurrencyRateRemoteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrencyRateRemoteModelImpl(
      date: json['date'] as String,
      rates: (json['usd'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$CurrencyRateRemoteModelImplToJson(
        _$CurrencyRateRemoteModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'usd': instance.rates,
    };
