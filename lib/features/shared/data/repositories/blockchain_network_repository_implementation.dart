import 'package:defy/features/shared/data/models/blockchain_network/blockchain_network_local_model.dart';
import 'package:defy/features/shared/data/sources/local/blockchain_network_local_source.dart';
import 'package:defy/features/shared/data/sources/remote/blockchain_network_remote_source.dart';
import 'package:defy/features/shared/domain/entities/blockchain_network.dart';
import 'package:defy/features/shared/domain/repositories/blockchain_network_repository.dart';

class BlockchainNetworkRepositoryImplementation
    implements BlockchainNetworkRepository {
  final BlockchainNetworkLocalDataSource _localDataSource;
  final BlockchainNetworkRemoteDataSource _remoteDataSource;

  BlockchainNetworkRepositoryImplementation(
      this._localDataSource, this._remoteDataSource);

  // Local CRUD operations
  @override
  List<BlockchainNetwork> listLocalBlockchainNetworks() {
    return _localDataSource
        .listBlockchainNetworks()
        .map((model) => model.toDomain())
        .toList();
  }

  @override
  BlockchainNetwork? getLocalBlockchainNetwork(String blockchainNetworkId) {
    final model = _localDataSource.getBlockchainNetwork(blockchainNetworkId);
    return model?.toDomain();
  }

  @override
  void saveLocalBlockchainNetwork(BlockchainNetwork blockchainNetwork) {
    final existingBlockchainNetwork =
        _localDataSource.getBlockchainNetwork(blockchainNetwork.id);
    if (existingBlockchainNetwork == null) {
      _localDataSource.saveBlockchainNetwork(
          BlockchainNetworkLocalModel.fromDomain(blockchainNetwork));
    }
  }

  @override
  void deleteLocalBlockchainNetwork(String blockchainNetworkId) {
    _localDataSource.deleteBlockchainNetwork(blockchainNetworkId);
  }

  // Remote CRUD operations
  @override
  Future<List<BlockchainNetwork>> listRemoteBlockchainNetworks() async {
    final response = await _remoteDataSource.listBlockchainNetworks();
    return response.data?.map((model) => model.toDomain()).toList() ?? [];
  }

  @override
  Future<BlockchainNetwork?> getRemoteBlockchainNetwork(
      String blockchainNetworkId) async {
    final response =
        await _remoteDataSource.getBlockchainNetwork(blockchainNetworkId);
    return response.data?.toDomain();
  }

  // Sync operation: Fetch from remote and update local
  @override
  Future<void> syncBlockchainNetworks() async {
    final remoteNetworks = await listRemoteBlockchainNetworks();
    for (final network in remoteNetworks) {
      saveLocalBlockchainNetwork(network);
    }
  }
}
