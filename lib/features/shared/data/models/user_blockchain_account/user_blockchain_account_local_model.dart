import 'package:defy/features/shared/data/models/user_blockchain_account_group_assignment/user_blockchain_account_group_assignment_local_model.dart';
import 'package:objectbox/objectbox.dart';
import '../../../domain/entities/user_blockchain_account.dart';
import '../blockchain_network/blockchain_network_local_model.dart';

@Entity()
class UserBlockchainAccountLocalModel {
  @Id()
  int localId = 0;

  @Unique(onConflict: ConflictStrategy.fail)
  String remoteId;

  @Index(type: IndexType.value)
  String accountAddress;

  @Index()
  ToOne<BlockchainNetworkLocalModel> blockchainNetwork;

  final blockchainAccountGroupAssignment =
      ToOne<UserBlockchainAccountGroupAssignmentLocalModel>();

  UserBlockchainAccountLocalModel(
      {required this.remoteId,
      required this.accountAddress,
      required this.blockchainNetwork});

  @Unique(onConflict: ConflictStrategy.fail)
  String get caipBlockchainAccountId =>
      '${blockchainNetwork.target!.caipBlockchainId}:$accountAddress';

  UserBlockchainAccount toDomain() => UserBlockchainAccount(
        id: remoteId,
        accountAddress: accountAddress,
        blockchainNetworkId: blockchainNetwork.target!.remoteId,
      );

  static UserBlockchainAccountLocalModel fromDomain(
          UserBlockchainAccount account, int localBlockchainNetworkId) =>
      UserBlockchainAccountLocalModel(
        remoteId: account.id,
        accountAddress: account.accountAddress,
        blockchainNetwork: ToOne(targetId: localBlockchainNetworkId),
      );
}
