// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../currency_rate_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyRateRemoteModelImpl _$$CurrencyRateRemoteModelImplFromJson(
        Map json) =>
    $checkedCreate(
      r'_$CurrencyRateRemoteModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['date', 'usd'],
        );
        final val = _$CurrencyRateRemoteModelImpl(
          date: $checkedConvert('date', (v) => v as String),
          rates: $checkedConvert(
              'usd',
              (v) => (v as Map).map(
                    (k, e) => MapEntry(k as String, (e as num).toDouble()),
                  )),
        );
        return val;
      },
      fieldKeyMap: const {'rates': 'usd'},
    );

const _$$CurrencyRateRemoteModelImplFieldMap = <String, String>{
  'date': 'date',
  'rates': 'usd',
};

abstract final class _$$CurrencyRateRemoteModelImplJsonKeys {
  static const String date = 'date';
  static const String rates = 'usd';
}

// ignore: unused_element
abstract class _$$CurrencyRateRemoteModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? date(String instance) => instance;
  // ignore: unused_element
  static Object? rates(Map<String, double> instance) => instance;
}

Map<String, dynamic> _$$CurrencyRateRemoteModelImplToJson(
        _$CurrencyRateRemoteModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'usd': instance.rates,
    };
