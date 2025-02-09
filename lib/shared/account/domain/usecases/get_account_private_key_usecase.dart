import 'dart:typed_data';

import '../../../utils/hd_key_derivation_utils.dart';
import '../entities/account_address.dart';
import '../entities/aptos_account_with_metadata.dart';
import '../entities/json_web_key.dart';
import '../repositories/aptos_account_repository_interface.dart';
import '../repositories/entropy_repository_interface.dart';
import '../repositories/jwk_repository_interface.dart';
import '../repositories/private_jwk_repository_interface.dart';

class GetAccountPrivateKeyUseCase {
  const GetAccountPrivateKeyUseCase({
    required IAptosAccountRepository accountRepository,
    required IJwkRepository jwkRepository,
    required IEntropyRepository entropyRepository,
    required IPrivateJwkRepository privateJwkRepository,
  })  : _accountRepository = accountRepository,
        _jwkRepository = jwkRepository,
        _entropyRepository = entropyRepository,
        _privateJwkRepository = privateJwkRepository;

  final IAptosAccountRepository _accountRepository;
  final IPrivateJwkRepository _privateJwkRepository;
  final IJwkRepository _jwkRepository;
  final IEntropyRepository _entropyRepository;

  Future<Uint8List> call({required AccountAddress accountAddress}) async {
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
    if (hdConfig != null) {
      final Uint8List? entropy =
          await _entropyRepository.get(hash: hdConfig.entropyHash);
      if (entropy == null) {
        throw StateError('Entropy not found');
      }

      return deriveHDKeyFromEntropy(
        entropy: entropy,
        derivationPath: hdConfig.derivationPath.toBytes(),
      );
    }

    final Jwk? privateJwk =
        await _privateJwkRepository.get(keyId: authConfig.keyId);
    if (privateJwk == null) {
      throw StateError('Private key not found');
    }

    return privateJwk.getPrivateKeyBytes();
  }
}
