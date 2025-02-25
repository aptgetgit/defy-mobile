import 'dart:typed_data';

import '../entities/aptos_account_with_metadata.dart';
import '../entities/aptos_derivation_path.dart';
import '../entities/authentication_key.dart';
import '../entities/json_web_key.dart';
import '../repositories/aptos_account_repository_interface.dart';
import '../repositories/entropy_repository_interface.dart';
import '../repositories/jwk_repository_interface.dart';

typedef DerivationPathToAccounts = Map<AptosDerivationPath, List<AptosAccountWithMetadata>>;

class GetAccountsFromMnemonicUseCase {
  GetAccountsFromMnemonicUseCase({
    required IEntropyRepository entropyRepository,
    required IJwkRepository jwkRepository,
    required IAptosAccountRepository accountRepository,
  })  : _entropyRepository = entropyRepository,
        _jwkRepository = jwkRepository,
        _accountRepository = accountRepository;

  final IEntropyRepository _entropyRepository;
  final IJwkRepository _jwkRepository;
  final IAptosAccountRepository _accountRepository;

  Future<DerivationPathToAccounts> call({
    required Uint8List entropyHash,
  }) async {
    if (!await _entropyRepository.has(hash: entropyHash)) {
      throw StateError('Entropy not found');
    }

    final Map<AptosDerivationPath, Set<Uint8List>> keyIdsWithPaths = _getKeyIdsWithPaths(entropyHash);
    final Map<AptosDerivationPath, Set<AuthenticationKey>> authKeysWithPaths = _getAuthKeysWithPaths(keyIdsWithPaths);
    
    final Map<AptosDerivationPath, List<AptosAccountWithMetadata>> pathToAccounts = <AptosDerivationPath, List<AptosAccountWithMetadata>>{};
    
    for (final MapEntry<AptosDerivationPath, Set<AuthenticationKey>> entry in authKeysWithPaths.entries) {
      final AptosDerivationPath path = entry.key;
      final Set<AuthenticationKey> authKeys = entry.value;
      
      final List<AptosAccountWithMetadata> accounts = authKeys
          .expand((AuthenticationKey authKey) => _accountRepository.getByAuthKey(authKey: authKey))
          .toList();
          
      if (accounts.isNotEmpty) {
        pathToAccounts[path] = accounts;
      }
    }

    return pathToAccounts;
  }

  Map<AptosDerivationPath, Set<Uint8List>> _getKeyIdsWithPaths(Uint8List entropyHash) {
    final Map<AptosDerivationPath, Set<Uint8List>> pathToKeyIds = <AptosDerivationPath, Set<Uint8List>>{};
    
    for (final (Uint8List, HDKeySourceConfig) config in _jwkRepository.getAllHDKeySourceConfigs()) {
      final (Uint8List keyId, HDKeySourceConfig hdConfig) = config;
      
      if (hdConfig.entropyHash == entropyHash) {
        final AptosDerivationPath path = hdConfig.derivationPath;
        pathToKeyIds.putIfAbsent(path, () => <Uint8List>{}).add(keyId);
      }
    }
    
    return pathToKeyIds;
  }

  Map<AptosDerivationPath, Set<AuthenticationKey>> _getAuthKeysWithPaths(
    Map<AptosDerivationPath, Set<Uint8List>> keyIdsWithPaths,
  ) {
    final Map<AptosDerivationPath, Set<AuthenticationKey>> pathToAuthKeys = <AptosDerivationPath, Set<AuthenticationKey>>{};
    
    for (final MapEntry<AptosDerivationPath, Set<Uint8List>> entry in keyIdsWithPaths.entries) {
      final AptosDerivationPath path = entry.key;
      final Set<Uint8List> keyIds = entry.value;
      
      for (final Uint8List keyId in keyIds) {
        final Jwk? jwk = _jwkRepository.get(keyId: keyId);
        if (jwk == null) {
          continue;
        }
        
        final AuthenticationKey authKey = AuthenticationKey.ed25519SchemeFromPublicKey(
          publicKeyBytes: jwk.getPublicKeyBytes(),
        );
        
        pathToAuthKeys.putIfAbsent(path, () => <AuthenticationKey>{}).add(authKey);
      }
    }
    
    return pathToAuthKeys;
  }
}
