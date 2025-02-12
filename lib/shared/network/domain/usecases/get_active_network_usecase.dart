import '../entities/aptos_network.dart';
import '../repositories/active_network_repository_interface.dart';

class GetActiveNetworkUseCase {
  const GetActiveNetworkUseCase(this._repository);
  final IActiveNetworkRepository _repository;

  Future<AptosNetwork> call() => _repository.getActiveNetwork();
}
