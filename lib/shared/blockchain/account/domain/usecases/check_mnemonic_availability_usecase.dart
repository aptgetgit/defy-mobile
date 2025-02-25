import '../entities/account_address.dart';
import '../entities/aptos_account_with_metadata.dart';
import '../repositories/aptos_account_repository_interface.dart';
import '../repositories/jwk_repository_interface.dart';

class CheckMnemonicAvailabilityUseCase {
  const CheckMnemonicAvailabilityUseCase({
    required IAptosAccountRepository accountRepository,
    required IJwkRepository jwkRepository,
  })  : _accountRepository = accountRepository,
        _jwkRepository = jwkRepository;

  final IAptosAccountRepository _accountRepository;
  final IJwkRepository _jwkRepository;

  bool call({required AccountAddress accountAddress}) {
    final AptosAccountWithMetadata? account = _accountRepository.getByAddress(
      accountAddress: accountAddress,
    );
    if (account == null) {
      return false;
    }

    final AuthenticatorConfig? authConfig =
        _accountRepository.getAuthConfigByAuthKey(
      authKey: account.authenticationKey,
    );
    if (authConfig == null) {
      return false;
    }

    return _jwkRepository.getHDKeySourceConfig(
          keyId: authConfig.keyId,
        ) !=
        null;
  }
}
