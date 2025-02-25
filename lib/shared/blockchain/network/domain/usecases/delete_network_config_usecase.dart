import '../repositories/network_config_repository_interface.dart';

class DeleteNetworkConfigUseCase {
  const DeleteNetworkConfigUseCase(this._repository);
  final INetworkConfigRepository _repository;

  void call({required String caipChainId}) =>
      _repository.delete(caipChainId: caipChainId);
}
