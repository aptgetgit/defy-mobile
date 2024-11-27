import 'package:defy/features/blockchain_account_group_assignment/data/models/local/blockchain_account_group_assignment_local_model.dart';
import 'package:objectbox/objectbox.dart';
import '../../../domain/entities/blockchain_account.dart';
import '../../../../blockchain_network/data/models/local/blockchain_network_local_model.dart';

@Entity()
class BlockchainAccountLocalModel {
  @Id()
  int localId = 0;

  @Unique(onConflict: ConflictStrategy.fail)
  String remoteId;

  @Index(type: IndexType.value)
  String accountAddress;

  @Index()
  ToOne<BlockchainNetworkLocalModel> blockchainNetwork;

  final blockchainAccountGroupAssignment =
      ToOne<BlockchainAccountGroupAssignmentLocalModel>();

  BlockchainAccountLocalModel(
      {required this.remoteId,
      required this.accountAddress,
      required this.blockchainNetwork});

  @Unique(onConflict: ConflictStrategy.fail)
  String get caipBlockchainAccountId =>
      '${blockchainNetwork.target!.caipBlockchainId}:$accountAddress';

  BlockchainAccount toDomain() => BlockchainAccount(
        id: remoteId,
        accountAddress: accountAddress,
        blockchainNetworkId: blockchainNetwork.target!.remoteId,
      );

  static BlockchainAccountLocalModel fromDomain(
          BlockchainAccount account, int localBlockchainNetworkId) =>
      BlockchainAccountLocalModel(
        remoteId: account.id,
        accountAddress: account.accountAddress,
        blockchainNetwork: ToOne(targetId: localBlockchainNetworkId),
      );
}
