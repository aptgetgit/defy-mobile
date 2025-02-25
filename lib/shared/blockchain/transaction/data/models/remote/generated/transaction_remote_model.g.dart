// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../transaction_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PendingTransactionRemoteModelImpl
    _$$PendingTransactionRemoteModelImplFromJson(Map json) => $checkedCreate(
          r'_$PendingTransactionRemoteModelImpl',
          json,
          ($checkedConvert) {
            $checkKeys(
              json,
              allowedKeys: const [
                'hash',
                'sender',
                'sequence_number',
                'max_gas_amount',
                'gas_unit_price',
                'expiration_timestamp_secs',
                'type'
              ],
            );
            final val = _$PendingTransactionRemoteModelImpl(
              hash: $checkedConvert('hash', (v) => v as String),
              sender: $checkedConvert('sender', (v) => v as String),
              sequenceNumber:
                  $checkedConvert('sequence_number', (v) => v as String),
              maxGasAmount:
                  $checkedConvert('max_gas_amount', (v) => v as String),
              gasUnitPrice:
                  $checkedConvert('gas_unit_price', (v) => v as String),
              expirationTimestampSecs: $checkedConvert(
                  'expiration_timestamp_secs', (v) => v as String),
              $type: $checkedConvert('type', (v) => v as String?),
            );
            return val;
          },
          fieldKeyMap: const {
            'sequenceNumber': 'sequence_number',
            'maxGasAmount': 'max_gas_amount',
            'gasUnitPrice': 'gas_unit_price',
            'expirationTimestampSecs': 'expiration_timestamp_secs',
            r'$type': 'type'
          },
        );

const _$$PendingTransactionRemoteModelImplFieldMap = <String, String>{
  'hash': 'hash',
  'sender': 'sender',
  'sequenceNumber': 'sequence_number',
  'maxGasAmount': 'max_gas_amount',
  'gasUnitPrice': 'gas_unit_price',
  'expirationTimestampSecs': 'expiration_timestamp_secs',
  r'$type': 'type',
};

abstract final class _$$PendingTransactionRemoteModelImplJsonKeys {
  static const String hash = 'hash';
  static const String sender = 'sender';
  static const String sequenceNumber = 'sequence_number';
  static const String maxGasAmount = 'max_gas_amount';
  static const String gasUnitPrice = 'gas_unit_price';
  static const String expirationTimestampSecs = 'expiration_timestamp_secs';
  static const String $type = 'type';
}

// ignore: unused_element
abstract class _$$PendingTransactionRemoteModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? hash(String instance) => instance;
  // ignore: unused_element
  static Object? sender(String instance) => instance;
  // ignore: unused_element
  static Object? sequenceNumber(String instance) => instance;
  // ignore: unused_element
  static Object? maxGasAmount(String instance) => instance;
  // ignore: unused_element
  static Object? gasUnitPrice(String instance) => instance;
  // ignore: unused_element
  static Object? expirationTimestampSecs(String instance) => instance;
  // ignore: unused_element
  static Object? $type(String instance) => instance;
}

_$UserTransactionRemoteModelImpl _$$UserTransactionRemoteModelImplFromJson(
        Map json) =>
    $checkedCreate(
      r'_$UserTransactionRemoteModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'hash',
            'success',
            'gas_used',
            'vm_status',
            'max_gas_amount',
            'gas_unit_price',
            'type'
          ],
        );
        final val = _$UserTransactionRemoteModelImpl(
          hash: $checkedConvert('hash', (v) => v as String),
          success: $checkedConvert('success', (v) => v as bool),
          gasUsed: $checkedConvert('gas_used', (v) => v as String),
          vmStatus: $checkedConvert('vm_status', (v) => v as String),
          maxGasAmount: $checkedConvert('max_gas_amount', (v) => v as String),
          gasUnitPrice: $checkedConvert('gas_unit_price', (v) => v as String),
          $type: $checkedConvert('type', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'gasUsed': 'gas_used',
        'vmStatus': 'vm_status',
        'maxGasAmount': 'max_gas_amount',
        'gasUnitPrice': 'gas_unit_price',
        r'$type': 'type'
      },
    );

const _$$UserTransactionRemoteModelImplFieldMap = <String, String>{
  'hash': 'hash',
  'success': 'success',
  'gasUsed': 'gas_used',
  'vmStatus': 'vm_status',
  'maxGasAmount': 'max_gas_amount',
  'gasUnitPrice': 'gas_unit_price',
  r'$type': 'type',
};

abstract final class _$$UserTransactionRemoteModelImplJsonKeys {
  static const String hash = 'hash';
  static const String success = 'success';
  static const String gasUsed = 'gas_used';
  static const String vmStatus = 'vm_status';
  static const String maxGasAmount = 'max_gas_amount';
  static const String gasUnitPrice = 'gas_unit_price';
  static const String $type = 'type';
}

// ignore: unused_element
abstract class _$$UserTransactionRemoteModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? hash(String instance) => instance;
  // ignore: unused_element
  static Object? success(bool instance) => instance;
  // ignore: unused_element
  static Object? gasUsed(String instance) => instance;
  // ignore: unused_element
  static Object? vmStatus(String instance) => instance;
  // ignore: unused_element
  static Object? maxGasAmount(String instance) => instance;
  // ignore: unused_element
  static Object? gasUnitPrice(String instance) => instance;
  // ignore: unused_element
  static Object? $type(String instance) => instance;
}
