import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../entities/aptos_network.dart';
import '../repositories/active_network_repository_interface.dart';

class SetActiveNetworkUseCase {
  const SetActiveNetworkUseCase({required IActiveNetworkRepository repository})
    : _repository = repository;

  final IActiveNetworkRepository _repository;

  Future<Either<ExceptionWithStackTrace, Unit>> call({
    required AptosNetwork network,
  }) => _repository.setActiveNetwork(network: network).run();
}
