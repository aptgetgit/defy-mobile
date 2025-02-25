import '../entities/account_address.dart';
import '../repositories/aptos_account_repository_interface.dart';

class UpdateAccountIconUriUseCase {
  const UpdateAccountIconUriUseCase({
    required IAptosAccountRepository repository,
  }) : _repository = repository;

  final IAptosAccountRepository _repository;

  void call({
    required AccountAddress accountAddress,
    required Uri newIconUri,
  }) =>
      _repository.updateIconUri(
        accountAddress: accountAddress,
        newIconUri: newIconUri,
      );
}
