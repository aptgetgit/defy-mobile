// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_blockchain_account_group_assignment_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBlockchainAccountGroupAssignmentRemoteModelImpl
    _$$UserBlockchainAccountGroupAssignmentRemoteModelImplFromJson(Map json) =>
        $checkedCreate(
          r'_$UserBlockchainAccountGroupAssignmentRemoteModelImpl',
          json,
          ($checkedConvert) {
            $checkKeys(
              json,
              allowedKeys: const [
                'blockchainAccountGroupId',
                'blockchainAccountId'
              ],
            );
            final val = _$UserBlockchainAccountGroupAssignmentRemoteModelImpl(
              blockchainAccountGroupId: $checkedConvert(
                  'blockchainAccountGroupId', (v) => v as String),
              blockchainAccountId:
                  $checkedConvert('blockchainAccountId', (v) => v as String),
            );
            return val;
          },
        );

const _$$UserBlockchainAccountGroupAssignmentRemoteModelImplFieldMap =
    <String, String>{
  'blockchainAccountGroupId': 'blockchainAccountGroupId',
  'blockchainAccountId': 'blockchainAccountId',
};

abstract final class _$$UserBlockchainAccountGroupAssignmentRemoteModelImplJsonKeys {
  static const String blockchainAccountGroupId = 'blockchainAccountGroupId';
  static const String blockchainAccountId = 'blockchainAccountId';
}

// ignore: unused_element
abstract class _$$UserBlockchainAccountGroupAssignmentRemoteModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? blockchainAccountGroupId(String instance) => instance;
  // ignore: unused_element
  static Object? blockchainAccountId(String instance) => instance;
}
