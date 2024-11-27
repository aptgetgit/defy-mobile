import 'package:defy/features/blockchain_network/data/repositories/blockchain_network_repository_implementation.dart';
import 'package:defy/features/blockchain_network/domain/entities/blockchain_network.dart';

class ListLocalBlockchainNetworksUseCase {
  final BlockchainNetworkRepository _repository;

  ListLocalBlockchainNetworksUseCase(this._repository);

  List<BlockchainNetwork> call() {
    return _repository.listLocalBlockchainNetworks();
  }
}

class GetLocalBlockchainNetworkUseCase {
  final BlockchainNetworkRepository _repository;

  GetLocalBlockchainNetworkUseCase(this._repository);

  BlockchainNetwork? call(String blockchainNetworkId) {
    return _repository.getLocalBlockchainNetwork(blockchainNetworkId);
  }
}

class SaveLocalBlockchainNetworkUseCase {
  final BlockchainNetworkRepository _repository;

  SaveLocalBlockchainNetworkUseCase(this._repository);

  void call(BlockchainNetwork blockchainNetwork) {
    return _repository.saveLocalBlockchainNetwork(blockchainNetwork);
  }
}

class DeleteLocalBlockchainNetworkUseCase {
  final BlockchainNetworkRepository _repository;

  DeleteLocalBlockchainNetworkUseCase(this._repository);

  void call(String blockchainNetworkId) {
    return _repository.deleteLocalBlockchainNetwork(blockchainNetworkId);
  }
}

class ListRemoteBlockchainNetworksUseCase {
  final BlockchainNetworkRepository _repository;

  ListRemoteBlockchainNetworksUseCase(this._repository);

  Future<List<BlockchainNetwork>> call() {
    return _repository.listRemoteBlockchainNetworks();
  }
}

class GetRemoteBlockchainNetworkUseCase {
  final BlockchainNetworkRepository _repository;

  GetRemoteBlockchainNetworkUseCase(this._repository);

  Future<BlockchainNetwork?> call(String blockchainNetworkId) {
    return _repository.getRemoteBlockchainNetwork(blockchainNetworkId);
  }
}

class SyncBlockchainNetworksUseCase {
  final BlockchainNetworkRepository _repository;

  SyncBlockchainNetworksUseCase(this._repository);

  Future<void> call() {
    return _repository.syncBlockchainNetworks();
  }
}
