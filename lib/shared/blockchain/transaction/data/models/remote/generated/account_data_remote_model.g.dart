// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../account_data_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountDataRemoteModelImpl _$$AccountDataRemoteModelImplFromJson(Map json) =>
    $checkedCreate(
      r'_$AccountDataRemoteModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['sequence_number', 'authentication_key'],
        );
        final val = _$AccountDataRemoteModelImpl(
          sequenceNumber:
              $checkedConvert('sequence_number', (v) => v as String),
          authenticationKey:
              $checkedConvert('authentication_key', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'sequenceNumber': 'sequence_number',
        'authenticationKey': 'authentication_key'
      },
    );

const _$$AccountDataRemoteModelImplFieldMap = <String, String>{
  'sequenceNumber': 'sequence_number',
  'authenticationKey': 'authentication_key',
};

abstract final class _$$AccountDataRemoteModelImplJsonKeys {
  static const String sequenceNumber = 'sequence_number';
  static const String authenticationKey = 'authentication_key';
}

// ignore: unused_element
abstract class _$$AccountDataRemoteModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? sequenceNumber(String instance) => instance;
  // ignore: unused_element
  static Object? authenticationKey(String instance) => instance;
}
