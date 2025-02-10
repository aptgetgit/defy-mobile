// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_blockchain_account_group_assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBlockchainAccountGroupAssignmentImpl
    _$$UserBlockchainAccountGroupAssignmentImplFromJson(Map json) =>
        $checkedCreate(
          r'_$UserBlockchainAccountGroupAssignmentImpl',
          json,
          ($checkedConvert) {
            $checkKeys(
              json,
              allowedKeys: const [
                'blockchain_account_group_id',
                'blockchain_account_id'
              ],
            );
            final val = _$UserBlockchainAccountGroupAssignmentImpl(
              blockchainAccountGroupId: $checkedConvert(
                  'blockchain_account_group_id', (v) => v as String),
              blockchainAccountId:
                  $checkedConvert('blockchain_account_id', (v) => v as String),
            );
            return val;
          },
          fieldKeyMap: const {
            'blockchainAccountGroupId': 'blockchain_account_group_id',
            'blockchainAccountId': 'blockchain_account_id'
          },
        );

const _$$UserBlockchainAccountGroupAssignmentImplFieldMap = <String, String>{
  'blockchainAccountGroupId': 'blockchain_account_group_id',
  'blockchainAccountId': 'blockchain_account_id',
};

abstract final class _$$UserBlockchainAccountGroupAssignmentImplJsonKeys {
  static const String blockchainAccountGroupId = 'blockchain_account_group_id';
  static const String blockchainAccountId = 'blockchain_account_id';
}

// ignore: unused_element
abstract class _$$UserBlockchainAccountGroupAssignmentImplPerFieldToJson {
  // ignore: unused_element
  static Object? blockchainAccountGroupId(String instance) => instance;
  // ignore: unused_element
  static Object? blockchainAccountId(String instance) => instance;
}
