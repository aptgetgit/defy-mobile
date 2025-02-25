// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../ledger_info_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LedgerInfoRemoteModelImpl _$$LedgerInfoRemoteModelImplFromJson(Map json) =>
    $checkedCreate(
      r'_$LedgerInfoRemoteModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'chain_id',
            'epoch',
            'ledger_version',
            'oldest_ledger_version',
            'ledger_timestamp',
            'oldest_block_height',
            'block_height',
            'git_hash'
          ],
        );
        final val = _$LedgerInfoRemoteModelImpl(
          chainId: $checkedConvert('chain_id', (v) => (v as num).toInt()),
          epoch: $checkedConvert('epoch', (v) => v as String),
          ledgerVersion: $checkedConvert('ledger_version', (v) => v as String),
          oldestLedgerVersion:
              $checkedConvert('oldest_ledger_version', (v) => v as String),
          ledgerTimestamp:
              $checkedConvert('ledger_timestamp', (v) => v as String),
          oldestBlockHeight:
              $checkedConvert('oldest_block_height', (v) => v as String),
          blockHeight: $checkedConvert('block_height', (v) => v as String),
          gitHash: $checkedConvert('git_hash', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'chainId': 'chain_id',
        'ledgerVersion': 'ledger_version',
        'oldestLedgerVersion': 'oldest_ledger_version',
        'ledgerTimestamp': 'ledger_timestamp',
        'oldestBlockHeight': 'oldest_block_height',
        'blockHeight': 'block_height',
        'gitHash': 'git_hash'
      },
    );

const _$$LedgerInfoRemoteModelImplFieldMap = <String, String>{
  'chainId': 'chain_id',
  'epoch': 'epoch',
  'ledgerVersion': 'ledger_version',
  'oldestLedgerVersion': 'oldest_ledger_version',
  'ledgerTimestamp': 'ledger_timestamp',
  'oldestBlockHeight': 'oldest_block_height',
  'blockHeight': 'block_height',
  'gitHash': 'git_hash',
};

abstract final class _$$LedgerInfoRemoteModelImplJsonKeys {
  static const String chainId = 'chain_id';
  static const String epoch = 'epoch';
  static const String ledgerVersion = 'ledger_version';
  static const String oldestLedgerVersion = 'oldest_ledger_version';
  static const String ledgerTimestamp = 'ledger_timestamp';
  static const String oldestBlockHeight = 'oldest_block_height';
  static const String blockHeight = 'block_height';
  static const String gitHash = 'git_hash';
}

// ignore: unused_element
abstract class _$$LedgerInfoRemoteModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? chainId(int instance) => instance;
  // ignore: unused_element
  static Object? epoch(String instance) => instance;
  // ignore: unused_element
  static Object? ledgerVersion(String instance) => instance;
  // ignore: unused_element
  static Object? oldestLedgerVersion(String instance) => instance;
  // ignore: unused_element
  static Object? ledgerTimestamp(String instance) => instance;
  // ignore: unused_element
  static Object? oldestBlockHeight(String instance) => instance;
  // ignore: unused_element
  static Object? blockHeight(String instance) => instance;
  // ignore: unused_element
  static Object? gitHash(String? instance) => instance;
}
