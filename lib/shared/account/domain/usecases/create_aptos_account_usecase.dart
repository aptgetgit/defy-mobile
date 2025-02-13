import 'dart:ui';

import '../entities/account_address.dart';
import '../entities/aptos_account_with_metadata.dart';
import '../repositories/aptos_account_repository_interface.dart';

class CreateAptosAccountUseCase {
  CreateAptosAccountUseCase({required IAptosAccountRepository repository})
      : _repository = repository;

  final IAptosAccountRepository _repository;

  Future<AptosAccountWithMetadata> call({
    required String label,
    required Uri iconUri,
    required Color backgroundColor,
    required AuthenticatorConfig authenticatorConfig,
    AccountAddress? accountAddress,
  }) async {
    if (label.trim().isEmpty) {
      throw StateError('Label cannot be empty');
    }

    try {
      return _repository.createAccount(
        label: label,
        iconUri: iconUri,
        backgroundColor: backgroundColor,
        config: authenticatorConfig,
        accountAddress: accountAddress,
      );
    } on Exception catch (e) {
      throw StateError('Failed to create account: $e');
    }
  }
}
