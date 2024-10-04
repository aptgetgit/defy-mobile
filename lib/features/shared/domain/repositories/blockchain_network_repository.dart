import 'package:defy/features/shared/domain/entities/blockchain_network.dart';

abstract class BlockchainNetworkRepository {
  // Local operations
  List<BlockchainNetwork> listLocalBlockchainNetworks();
  BlockchainNetwork? getLocalBlockchainNetwork(String blockchainNetworkId);
  void saveLocalBlockchainNetwork(BlockchainNetwork blockchainNetwork);
  void deleteLocalBlockchainNetwork(String blockchainNetworkId);

  // Remote operations
  Future<List<BlockchainNetwork>> listRemoteBlockchainNetworks();
  Future<BlockchainNetwork?> getRemoteBlockchainNetwork(
      String blockchainNetworkId);

  // Sync operation
  Future<void> syncBlockchainNetworks();
}
