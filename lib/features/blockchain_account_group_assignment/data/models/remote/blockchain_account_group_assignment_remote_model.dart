import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/blockchain_account_group_assignment.dart';

part 'generated/blockchain_account_group_assignment_remote_model.freezed.dart';
part 'generated/blockchain_account_group_assignment_remote_model.g.dart';

@freezed
class BlockchainAccountGroupAssignmentRemoteModel
    with _$BlockchainAccountGroupAssignmentRemoteModel {
  const BlockchainAccountGroupAssignmentRemoteModel._();

  const factory BlockchainAccountGroupAssignmentRemoteModel({
    @JsonKey(name: 'blockchainAccountGroupId')
    required String blockchainAccountGroupId,
    @JsonKey(name: 'blockchainAccountId') required String blockchainAccountId,
  }) = _BlockchainAccountGroupAssignmentRemoteModel;

  factory BlockchainAccountGroupAssignmentRemoteModel.fromJson(
          Map<String, dynamic> json) =>
      _$BlockchainAccountGroupAssignmentRemoteModelFromJson(json);

  BlockchainAccountGroupAssignment toDomain() =>
      BlockchainAccountGroupAssignment(
        blockchainAccountGroupId: blockchainAccountGroupId,
        blockchainAccountId: blockchainAccountId,
      );

  static BlockchainAccountGroupAssignmentRemoteModel fromDomain(
          BlockchainAccountGroupAssignment assignment) =>
      BlockchainAccountGroupAssignmentRemoteModel(
        blockchainAccountGroupId: assignment.blockchainAccountGroupId,
        blockchainAccountId: assignment.blockchainAccountId,
      );
}
