import '../repositories/active_network_repository_interface.dart';

class ClearActiveNetworkUseCase {
  const ClearActiveNetworkUseCase({
    required IActiveNetworkRepository repository,
  }) : _repository = repository;

  final IActiveNetworkRepository _repository;

  Future<void> call() => _repository.clearActiveNetwork();
}
