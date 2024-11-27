import 'package:defy/features/blockchain_account/data/models/local/blockchain_account_local_model.dart';
import 'package:defy/features/blockchain_account_group/data/models/local/blockchain_account_group_local_model.dart';
import 'package:defy/features/blockchain_network/data/models/local/blockchain_network_local_model.dart';
import 'package:objectbox/objectbox.dart';
import '../../../domain/entities/blockchain_account_group_assignment.dart';

@Entity()
class BlockchainAccountGroupAssignmentLocalModel {
  @Id()
  int localId = 0;

  @Index()
  ToOne<BlockchainAccountGroupLocalModel> blockchainAccountGroup;

  @Unique(onConflict: ConflictStrategy.fail)
  ToOne<BlockchainAccountLocalModel> blockchainAccount;

  BlockchainAccountGroupAssignmentLocalModel(
      {required this.blockchainAccountGroup, required this.blockchainAccount});

  BlockchainNetworkLocalModel get blockchainNetwork =>
      blockchainAccount.target!.blockchainNetwork.target!;

  BlockchainAccountGroupAssignment toDomain() =>
      BlockchainAccountGroupAssignment(
        blockchainAccountGroupId: blockchainAccountGroup.target!.remoteId,
        blockchainAccountId: blockchainAccount.target!.remoteId,
      );

  static BlockchainAccountGroupAssignmentLocalModel fromDomain(
    int localBlockchainAccountGroupId,
    int localBlockchainAccountId,
  ) =>
      BlockchainAccountGroupAssignmentLocalModel(
          blockchainAccount: ToOne(targetId: localBlockchainAccountId),
          blockchainAccountGroup:
              ToOne(targetId: localBlockchainAccountGroupId));
}
