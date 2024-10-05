// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_blockchain_account_group_assignment_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBlockchainAccountGroupAssignmentRemoteModelImpl
    _$$UserBlockchainAccountGroupAssignmentRemoteModelImplFromJson(
            Map<String, dynamic> json) =>
        _$UserBlockchainAccountGroupAssignmentRemoteModelImpl(
          blockchainAccountGroupId:
              json['blockchain_account_group_id'] as String,
          blockchainAccountId: json['blockchain_account_id'] as String,
        );

Map<String, dynamic>
    _$$UserBlockchainAccountGroupAssignmentRemoteModelImplToJson(
            _$UserBlockchainAccountGroupAssignmentRemoteModelImpl instance) =>
        <String, dynamic>{
          'blockchain_account_group_id': instance.blockchainAccountGroupId,
          'blockchain_account_id': instance.blockchainAccountId,
        };
