import 'dart:typed_data';

import '../../../utils/ed25519_utils.dart';
import '../../../utils/hd_key_derivation_utils.dart';
import '../entities/account_address.dart';
import '../entities/aptos_account_with_metadata.dart';
import '../entities/json_web_key.dart';
import '../repositories/aptos_account_repository_interface.dart';
import '../repositories/entropy_repository_interface.dart';
import '../repositories/jwk_repository_interface.dart';
import '../repositories/private_jwk_repository_interface.dart';

class SignBufferUseCase {
  const SignBufferUseCase({
    required IAptosAccountRepository accountRepository,
    required IJwkRepository jwkRepository,
    required IEntropyRepository entropyRepository,
    required IPrivateJwkRepository privateJwkRepository,
  })  : _accountRepository = accountRepository,
        _jwkRepository = jwkRepository,
        _entropyRepository = entropyRepository,
        _privateJwkRepository = privateJwkRepository;

  final IAptosAccountRepository _accountRepository;
  final IJwkRepository _jwkRepository;
  final IEntropyRepository _entropyRepository;
  final IPrivateJwkRepository _privateJwkRepository;

  Future<(Uint8List signature, Uint8List publicKey)> call({
    required AccountAddress accountAddress,
    required Uint8List buffer,
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

    try {
      final Uint8List privateKeyBytes = await _getPrivateKeyBytes(authConfig);

      final Uint8List signature = sign(buffer, privateKeyBytes);
      final Uint8List publicKey = derivePublicKey(privateKeyBytes);

      return (signature, publicKey);
    } catch (e) {
      throw StateError('Failed to sign buffer: $e');
    }
  }

  Future<Uint8List> _getPrivateKeyBytes(AuthenticatorConfig authConfig) async {
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
