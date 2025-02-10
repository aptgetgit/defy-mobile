import 'package:defy/features/shared/data/models/blockchain_network/blockchain_network_local_model.dart';
import 'package:defy/features/shared/data/models/user_blockchain_account/user_blockchain_account_local_model.dart';
import 'package:defy/features/shared/data/models/user_blockchain_account_group/user_blockchain_account_group_local_model.dart';
import 'package:objectbox/objectbox.dart';
import '../../../domain/entities/user_blockchain_account_group_assignment.dart';

@Entity()
class UserBlockchainAccountGroupAssignmentLocalModel {
  @Id()
  int localId = 0;

  @Index()
  ToOne<UserBlockchainAccountGroupLocalModel> blockchainAccountGroup;

  @Unique(onConflict: ConflictStrategy.fail)
  ToOne<UserBlockchainAccountLocalModel> blockchainAccount;

  UserBlockchainAccountGroupAssignmentLocalModel(
      {required this.blockchainAccountGroup, required this.blockchainAccount});

  BlockchainNetworkLocalModel get blockchainNetwork =>
      blockchainAccount.target!.blockchainNetwork.target!;

  UserBlockchainAccountGroupAssignment toDomain() =>
      UserBlockchainAccountGroupAssignment(
        blockchainAccountGroupId: blockchainAccountGroup.target!.remoteId,
        blockchainAccountId: blockchainAccount.target!.remoteId,
      );

  static UserBlockchainAccountGroupAssignmentLocalModel fromDomain(
    int localBlockchainAccountGroupId,
    int localBlockchainAccountId,
  ) =>
      UserBlockchainAccountGroupAssignmentLocalModel(
          blockchainAccount: ToOne(targetId: localBlockchainAccountId),
          blockchainAccountGroup:
              ToOne(targetId: localBlockchainAccountGroupId));
}
