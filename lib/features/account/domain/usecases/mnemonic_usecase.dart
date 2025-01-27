import 'dart:typed_data';

import 'package:bip39/bip39.dart' as bip39;
import '../../../../shared/utils/hex_utils.dart';
import '../../data/repositories/aptos_account_repository_implementation.dart';
import '../../data/repositories/entropy_repository_implementation.dart';
import '../../data/repositories/jwk_repository_implementation.dart';
import '../entities/aptos_account.dart';
import '../entities/authentication_key.dart';
import '../entities/json_web_key.dart';
import '../repositories/jwk_repository.dart';

class GenerateMnemonicUseCase {
  GenerateMnemonicUseCase({required EntropyRepository repository})
      : _repository = repository;

  final EntropyRepository _repository;

  static const List<int> _validStrengths = <int>[128, 160, 192, 224, 256];

  Future<Uint8List> call({int strength = 128}) async {
    _validateStrength(strength);

    final Uint8List entropy = _generateEntropy(strength);
    return _repository.store(entropy: entropy);
  }

  void _validateStrength(int strength) {
    if (!_validStrengths.contains(strength)) {
      throw ArgumentError(
        'Invalid strength: $strength. Must be one of ${_validStrengths.join(", ")} bits',
      );
    }
  }

  Uint8List _generateEntropy(int strength) {
    try {
      final String mnemonic = bip39.generateMnemonic(strength: strength);
      return hexToBytes(bip39.mnemonicToEntropy(mnemonic));
    } catch (e) {
      throw StateError('Failed to generate mnemonic: $e');
    }
  }
}

class ImportMnemonicUseCase {
  ImportMnemonicUseCase({required EntropyRepository repository})
      : _repository = repository;
  final EntropyRepository _repository;

  Future<Uint8List> call({required String mnemonic}) async {
    _validateMnemonic(mnemonic);

    final Uint8List entropy = _mnemonicToEntropy(mnemonic);
    return _repository.store(entropy: entropy);
  }

  void _validateMnemonic(String mnemonic) {
    if (mnemonic.trim().isEmpty) {
      throw ArgumentError('Mnemonic cannot be empty');
    }

    if (!bip39.validateMnemonic(mnemonic)) {
      throw StateError('Invalid mnemonic phrase');
    }
  }

  Uint8List _mnemonicToEntropy(String mnemonic) {
    try {
      return hexToBytes(bip39.mnemonicToEntropy(mnemonic));
    } catch (e) {
      throw StateError(
        'Failed to convert mnemonic to entropy: $e',
      );
    }
  }
}

class ReadMnemonicUseCase {
  ReadMnemonicUseCase({required EntropyRepository repository})
      : _repository = repository;
  final EntropyRepository _repository;

  Future<String> call({required Uint8List entropyHash}) async {
    _validateEntropyHash(entropyHash);

    final Uint8List? entropy = await _repository.get(hash: entropyHash);
    if (entropy == null) {
      throw StateError('Mnemonic not found');
    }

    return _entropyToMnemonic(entropy);
  }

  void _validateEntropyHash(Uint8List hash) {
    if (hash.isEmpty) {
      throw ArgumentError('Entropy hash cannot be empty');
    }
  }

  String _entropyToMnemonic(Uint8List entropy) {
    try {
      return bip39.entropyToMnemonic(bytesToHex(entropy));
    } catch (e) {
      throw StateError(
        'Failed to convert entropy to mnemonic: $e',
      );
    }
  }
}

class GetMnemonicAccountsUseCase {
  GetMnemonicAccountsUseCase({
    required EntropyRepository entropyRepository,
    required JwkRepository jwkRepository,
    required AptosAccountRepository accountRepository,
  })  : _entropyRepository = entropyRepository,
        _jwkRepository = jwkRepository,
        _accountRepository = accountRepository;

  final EntropyRepository _entropyRepository;
  final JwkRepository _jwkRepository;
  final AptosAccountRepository _accountRepository;

  Future<List<AptosAccount>> call({required Uint8List entropyHash}) async {
    if (!await _entropyRepository.has(hash: entropyHash)) {
      throw StateError('Entropy not found');
    }

    final Set<Uint8List> jwkKeyIds = _jwkRepository
        .getAllHDKeySourceConfigs()
        .where(
          ((Uint8List, HDKeySourceConfig) data) =>
              data.$2.entropyHash == entropyHash,
        )
        .map(((Uint8List, HDKeySourceConfig) data) => data.$1)
        .toSet();

    final Set<AuthenticationKey> authKeys = <AuthenticationKey>{};
    for (final Uint8List keyId in jwkKeyIds) {
      final Jwk? jwk = _jwkRepository.get(keyId: keyId);
      if (jwk == null) {
        continue;
      }

      authKeys.add(
        AuthenticationKey.ed25519SchemeFromPublicKey(publicKeyBytes: jwk.x),
      );
    }

    final Set<AptosAccount> accounts = <AptosAccount>{};
    for (final AuthenticationKey authKey in authKeys) {
      accounts.addAll(_accountRepository.getByAuthKey(authKey: authKey));
    }

    return accounts.toList();
  }
}
