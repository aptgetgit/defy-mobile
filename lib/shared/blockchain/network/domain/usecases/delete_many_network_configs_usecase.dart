import '../repositories/network_config_repository_interface.dart';

class DeleteManyNetworkConfigsUseCase {
  const DeleteManyNetworkConfigsUseCase(this._repository);
  final INetworkConfigRepository _repository;

  void call({required List<String> caipChainIds}) =>
      _repository.deleteMany(caipChainIds: caipChainIds);
}
