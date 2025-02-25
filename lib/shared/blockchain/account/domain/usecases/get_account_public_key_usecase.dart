import 'dart:typed_data';

import '../entities/account_address.dart';
import '../entities/aptos_account_with_metadata.dart';
import '../entities/json_web_key.dart';
import '../repositories/aptos_account_repository_interface.dart';
import '../repositories/jwk_repository_interface.dart';

class GetAccountPublicKeyUseCase {
  const GetAccountPublicKeyUseCase({
    required IAptosAccountRepository accountRepository,
    required IJwkRepository jwkRepository,
  })  : _accountRepository = accountRepository,
        _jwkRepository = jwkRepository;

  final IAptosAccountRepository _accountRepository;
  final IJwkRepository _jwkRepository;

  Future<Uint8List> call({
    required AccountAddress accountAddress,
  }) async {
    final AptosAccountWithMetadata? account = _accountRepository.getByAddress(
      accountAddress: accountAddress,
    );
    if (account == null) {
      throw StateError('Account not found');
    }

    final AuthenticatorConfig? authConfig = _accountRepository.getAuthConfigByAuthKey(
      authKey: account.authenticationKey,
    );
    if (authConfig == null) {
      throw StateError('Auth configuration not found');
    }

    final Jwk? jwk = _jwkRepository.get(keyId: authConfig.keyId);
    if (jwk == null) {
      throw StateError('Public key not found');
    }

    return jwk.getPublicKeyBytes();
  }
}
