import '../entities/network_config.dart';
import '../repositories/network_config_repository_interface.dart';

class StoreNetworkConfigUseCase {
  const StoreNetworkConfigUseCase(this._repository);
  final INetworkConfigRepository _repository;

  NetworkConfig call({required NetworkConfig networkConfig}) =>
      _repository.store(networkConfig: networkConfig);
}
