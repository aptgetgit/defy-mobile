// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../currency_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyRateImpl _$$CurrencyRateImplFromJson(Map json) => $checkedCreate(
      r'_$CurrencyRateImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['id', 'code', 'rate', 'last_update'],
        );
        final val = _$CurrencyRateImpl(
          id: $checkedConvert('id', (v) => v as String),
          code: $checkedConvert('code', (v) => v as String),
          rate: $checkedConvert('rate', (v) => (v as num).toDouble()),
          lastUpdate: $checkedConvert(
              'last_update', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {'lastUpdate': 'last_update'},
    );

const _$$CurrencyRateImplFieldMap = <String, String>{
  'id': 'id',
  'code': 'code',
  'rate': 'rate',
  'lastUpdate': 'last_update',
};

abstract final class _$$CurrencyRateImplJsonKeys {
  static const String id = 'id';
  static const String code = 'code';
  static const String rate = 'rate';
  static const String lastUpdate = 'last_update';
}

// ignore: unused_element
abstract class _$$CurrencyRateImplPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? code(String instance) => instance;
  // ignore: unused_element
  static Object? rate(double instance) => instance;
  // ignore: unused_element
  static Object? lastUpdate(DateTime instance) => instance.toIso8601String();
}
