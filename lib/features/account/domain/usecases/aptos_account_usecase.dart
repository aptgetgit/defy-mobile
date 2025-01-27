import 'dart:typed_data';

import 'package:aptos_dart/aptos.dart' as aptos;
import 'package:bip39/bip39.dart' as bip39;

import '../../../../shared/utils/hex_utils.dart';
import '../../data/repositories/aptos_account_repository_implementation.dart';
import '../../data/repositories/entropy_repository_implementation.dart';
import '../../data/repositories/jwk_repository_implementation.dart';
import '../../data/repositories/private_jwk_repository_implementation.dart';
import '../entities/account_address.dart';
import '../entities/aptos_account.dart';
import '../entities/aptos_derivation_path.dart';
import '../entities/json_web_key.dart';
import '../repositories/aptos_account_repository.dart';
import '../repositories/jwk_repository.dart';

class CreateAptosAccountUseCase {
  CreateAptosAccountUseCase({required AptosAccountRepository repository})
      : _repository = repository;

  final AptosAccountRepository _repository;

  Future<AptosAccount> call({
    required AuthenticatorConfig authenticatorConfig,
    AccountAddress? accountAddress,
  }) async {
    try {
      return _repository.createAccount(
        config: authenticatorConfig,
        accountAddress: accountAddress,
      );
    } catch (e) {
      throw StateError('Failed to create account: $e');
    }
  }
}

class DeleteAptosAccountUseCase {
  DeleteAptosAccountUseCase({required AptosAccountRepository repository})
      : _repository = repository;

  final AptosAccountRepository _repository;

  Future<void> call(AccountAddress accountAddress) async {
    try {
      _repository.deleteByAddress(accountAddress: accountAddress);
    } catch (e) {
      throw StateError('Failed to delete account: $e');
    }
  }
}

class GetAptosAccountUseCase {
  GetAptosAccountUseCase({required AptosAccountRepository repository})
      : _repository = repository;

  final AptosAccountRepository _repository;

  Future<AptosAccount?> call(AccountAddress accountAddress) async {
    try {
      final AptosAccount? account =
          _repository.getByAddress(accountAddress: accountAddress);
      return account;
    } catch (e) {
      throw StateError('Failed to get account: $e');
    }
  }
}

class ListAptosAccountsUseCase {
  ListAptosAccountsUseCase({required AptosAccountRepository repository})
      : _repository = repository;

  final AptosAccountRepository _repository;

  Future<List<AptosAccount>> call() async {
    try {
      return _repository.getAll();
    } catch (e) {
      throw StateError('Failed to list accounts: $e');
    }
  }

  Future<int> getCount() async {
    try {
      return _repository.count();
    } catch (e) {
      throw StateError('Failed to get account count: $e');
    }
  }
}

class RevealAccountPublicKeyUseCase {
  RevealAccountPublicKeyUseCase({
    required AptosAccountRepository accountRepository,
    required JwkRepository jwkRepository,
  })  : _accountRepository = accountRepository,
        _jwkRepository = jwkRepository;

  final AptosAccountRepository _accountRepository;
  final JwkRepository _jwkRepository;

  Future<Uint8List> call({required AccountAddress accountAddress}) async {
    final AptosAccount? account =
        _accountRepository.getByAddress(accountAddress: accountAddress);
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

    final Jwk? jwk = _jwkRepository.get(keyId: authConfig.keyId);
    if (jwk == null) {
      throw StateError('Public key not found');
    }

    return jwk.x;
  }
}

class RevealAccountPrivateKeyUseCase {
  RevealAccountPrivateKeyUseCase({
    required AptosAccountRepository accountRepository,
    required JwkRepository jwkRepository,
    required EntropyRepository entropyRepository,
    required PrivateJwkRepository privateJwkRepository,
  })  : _accountRepository = accountRepository,
        _jwkRepository = jwkRepository,
        _entropyRepository = entropyRepository,
        _privateJwkRepository = privateJwkRepository;

  final AptosAccountRepository _accountRepository;
  final PrivateJwkRepository _privateJwkRepository;
  final JwkRepository _jwkRepository;
  final EntropyRepository _entropyRepository;

  Future<Uint8List> call({required AccountAddress accountAddress}) async {
    final AptosAccount? account =
        _accountRepository.getByAddress(accountAddress: accountAddress);
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

    final HDKeySourceConfig? hdConfig =
        _jwkRepository.getHDKeySourceConfig(keyId: authConfig.keyId);
    if (hdConfig != null) {
      final Uint8List? entropy =
          await _entropyRepository.get(hash: hdConfig.entropyHash);
      if (entropy == null) {
        throw StateError('Entropy not found');
      }
      return _derivePrivateKey(
        entropy,
        hdConfig.derivationPath.toBytes(),
      );
    }

    final Jwk? privateJwk =
        await _privateJwkRepository.get(keyId: authConfig.keyId);
    if (privateJwk == null) {
      throw StateError('Private key not found');
    }

    final Uint8List d = switch (privateJwk) {
      Ed25519Jwk(:final Uint8List d?) => d,
      Secp256k1Jwk(:final Uint8List d?) => d,
      Secp256r1Jwk(:final Uint8List d?) => d,
      _ => throw StateError('Invalid private key format'),
    };

    return d;
  }

  Uint8List _derivePrivateKey(Uint8List entropy, Uint8List derivationPath) {
    try {
      final String mnemonic = bip39.entropyToMnemonic(
        bytesToHex(entropy),
      );

      final String seed = bip39.mnemonicToSeedHex(mnemonic);
      final aptos.Keys keys = aptos.derivePath(
        AptosDerivationPath.fromBytes(derivationPath).toString(),
        seed,
      );

      if (keys.key == null) {
        throw StateError('Key derivation failed: null key generated');
      }

      if (keys.key!.isEmpty) {
        throw StateError('Key derivation failed: empty key generated');
      }

      return keys.key!;
    } catch (e) {
      throw StateError('Key derivation failed: $e');
    }
  }
}

class RevealAccountMnemonicUseCase {
  RevealAccountMnemonicUseCase({
    required AptosAccountRepository accountRepository,
    required JwkRepository jwkRepository,
    required EntropyRepository entropyRepository,
  })  : _accountRepository = accountRepository,
        _jwkRepository = jwkRepository,
        _entropyRepository = entropyRepository;

  final AptosAccountRepository _accountRepository;
  final JwkRepository _jwkRepository;
  final EntropyRepository _entropyRepository;

  Future<String> call({required AccountAddress accountAddress}) async {
    final AptosAccount? account =
        _accountRepository.getByAddress(accountAddress: accountAddress);
    if (account == null) {
      throw StateError('Account not found');
    }

    final AuthenticatorConfig? authConfig = _accountRepository
        .getAuthConfigByAuthKey(authKey: account.authenticationKey);
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

    return bip39.entropyToMnemonic(bytesToHex(entropy));
  }
}

class CanRevealMnemonicUseCase {
  CanRevealMnemonicUseCase({
    required AptosAccountRepository accountRepository,
    required JwkRepository jwkRepository,
  })  : _accountRepository = accountRepository,
        _jwkRepository = jwkRepository;

  final AptosAccountRepository _accountRepository;
  final JwkRepository _jwkRepository;

  bool call({required AccountAddress accountAddress}) {
    final AptosAccount? account =
        _accountRepository.getByAddress(accountAddress: accountAddress);
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

    final HDKeySourceConfig? hdConfig =
        _jwkRepository.getHDKeySourceConfig(keyId: authConfig.keyId);
    return hdConfig != null;
  }
}
