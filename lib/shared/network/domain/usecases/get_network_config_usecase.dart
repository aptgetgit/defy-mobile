import '../entities/network_config.dart';
import '../repositories/network_config_repository_interface.dart';

class GetNetworkConfigUseCase {
  const GetNetworkConfigUseCase(this._repository);
  final INetworkConfigRepository _repository;

  NetworkConfig? call({required String caipChainId}) =>
      _repository.getByCaipChainId(caipChainId: caipChainId);
}
