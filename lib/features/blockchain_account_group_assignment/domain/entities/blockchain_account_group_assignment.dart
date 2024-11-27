import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/blockchain_account_group_assignment.freezed.dart';
part 'generated/blockchain_account_group_assignment.g.dart';

@freezed
class BlockchainAccountGroupAssignment with _$BlockchainAccountGroupAssignment {
  const BlockchainAccountGroupAssignment._();

  const factory BlockchainAccountGroupAssignment(
      {required String blockchainAccountGroupId,
      required String blockchainAccountId}) = _BlockchainAccountGroupAssignment;

  factory BlockchainAccountGroupAssignment.fromJson(
          Map<String, dynamic> json) =>
      _$BlockchainAccountGroupAssignmentFromJson(json);
}
