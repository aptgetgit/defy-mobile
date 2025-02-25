import 'dart:typed_data';

import '../../../../utils/mnemonic_utils.dart';
import '../entities/account_address.dart';
import '../entities/aptos_account_with_metadata.dart';
import '../entities/aptos_derivation_path.dart';
import '../repositories/aptos_account_repository_interface.dart';
import '../repositories/entropy_repository_interface.dart';
import '../repositories/jwk_repository_interface.dart';

class GetAccountMnemonicUseCase {
  const GetAccountMnemonicUseCase({
    required IAptosAccountRepository accountRepository,
    required IJwkRepository jwkRepository,
    required IEntropyRepository entropyRepository,
  })  : _accountRepository = accountRepository,
        _jwkRepository = jwkRepository,
        _entropyRepository = entropyRepository;

  final IAptosAccountRepository _accountRepository;
  final IJwkRepository _jwkRepository;
  final IEntropyRepository _entropyRepository;

  Future<(String, AptosDerivationPath)> call({
    required AccountAddress accountAddress,
  }) async {
    final AptosAccountWithMetadata? account = _accountRepository.getByAddress(
      accountAddress: accountAddress,
    );
    if (account == null) {
      throw StateError('Account not found');
    }

    final AuthenticatorConfig? authConfig =
        _accountRepository.getAuthConfigByAuthKey(
      authKey: account.authenticationKey,
    );
    if (authConfig == null) {
      throw StateError('Auth configuration not found');
    }

    final HDKeySourceConfig? hdConfig = _jwkRepository.getHDKeySourceConfig(
      keyId: authConfig.keyId,
    );
    if (hdConfig == null) {
      throw StateError('Account was not generated from a mnemonic');
    }

    final Uint8List? entropy =
        await _entropyRepository.get(hash: hdConfig.entropyHash);
    if (entropy == null) {
      throw StateError('Entropy not found');
    }

    return (entropyToMnemonic(entropy), hdConfig.derivationPath);
  }
}
