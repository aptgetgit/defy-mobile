import 'package:defy/features/shared/data/models/user_blockchain_account/user_blockchain_account_local_model.dart';
import 'package:objectbox/objectbox.dart';
import '../../../domain/entities/blockchain_network.dart';

@Entity()
class BlockchainNetworkLocalModel {
  @Id()
  int localId = 0;

  @Unique(onConflict: ConflictStrategy.fail)
  String remoteId;

  @Index(type: IndexType.value)
  String namespace;

  @Index(type: IndexType.value)
  String reference;

  @Backlink('blockchainNetwork')
  final blockchainAccounts = ToMany<UserBlockchainAccountLocalModel>();

  BlockchainNetworkLocalModel({
    required this.remoteId,
    required this.namespace,
    required this.reference,
  });

  @Unique(onConflict: ConflictStrategy.fail)
  String get caipBlockchainId => '$namespace:$reference';

  BlockchainNetwork toDomain() => BlockchainNetwork(
        id: remoteId,
        namespace: namespace,
        reference: reference,
      );

  static BlockchainNetworkLocalModel fromDomain(BlockchainNetwork network) =>
      BlockchainNetworkLocalModel(
        remoteId: network.id,
        namespace: network.namespace,
        reference: network.reference,
      );
}
