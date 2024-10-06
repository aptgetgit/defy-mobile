import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user_blockchain_account_group_assignment.dart';

part 'generated/user_blockchain_account_group_assignment_remote_model.freezed.dart';
part 'generated/user_blockchain_account_group_assignment_remote_model.g.dart';


@freezed
class UserBlockchainAccountGroupAssignmentRemoteModel with _$UserBlockchainAccountGroupAssignmentRemoteModel {
  const UserBlockchainAccountGroupAssignmentRemoteModel._();

  const factory UserBlockchainAccountGroupAssignmentRemoteModel({
    @JsonKey(name: 'blockchainAccountGroupId') required String blockchainAccountGroupId,
    @JsonKey(name: 'blockchainAccountId') required String blockchainAccountId,
  }) = _UserBlockchainAccountGroupAssignmentRemoteModel;

  factory UserBlockchainAccountGroupAssignmentRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$UserBlockchainAccountGroupAssignmentRemoteModelFromJson(json);

  UserBlockchainAccountGroupAssignment toDomain() => UserBlockchainAccountGroupAssignment(
        blockchainAccountGroupId: blockchainAccountGroupId,
        blockchainAccountId: blockchainAccountId,
      );

  static UserBlockchainAccountGroupAssignmentRemoteModel fromDomain(UserBlockchainAccountGroupAssignment assignment) =>
      UserBlockchainAccountGroupAssignmentRemoteModel(
        blockchainAccountGroupId: assignment.blockchainAccountGroupId,
        blockchainAccountId: assignment.blockchainAccountId,
      );
}