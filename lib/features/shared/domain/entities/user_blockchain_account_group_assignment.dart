import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_blockchain_account_group_assignment.freezed.dart';
part 'generated/user_blockchain_account_group_assignment.g.dart';

@Freezed(fromJson: true)
class UserBlockchainAccountGroupAssignment with _$UserBlockchainAccountGroupAssignment {
  const UserBlockchainAccountGroupAssignment._();

  const factory UserBlockchainAccountGroupAssignment({
    required String blockchainAccountGroupId,
    required String blockchainAccountId
  }) = _UserBlockchainAccountGroupAssignment;

  factory UserBlockchainAccountGroupAssignment.fromJson(Map<String, dynamic> json) =>
      _$UserBlockchainAccountGroupAssignmentFromJson(json);
}