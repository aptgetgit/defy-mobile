import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../utils/comparison_utils.dart';
import '../entities/aptos_account_with_metadata.dart';
import '../entities/aptos_derivation_path.dart';
import '../entities/authentication_key.dart';
import '../entities/json_web_key.dart';
import '../repositories/aptos_account_repository_interface.dart';
import '../repositories/entropy_repository_interface.dart';
import '../repositories/jwk_repository_interface.dart';

// typedef DerivationPathToAccounts = Map<AptosDerivationPath, List<AptosAccountWithMetadata>>;

// class GetAccountsFromMnemonicUseCase {
//   GetAccountsFromMnemonicUseCase({
//     required IEntropyRepository entropyRepository,
//     required IJwkRepository jwkRepository,
//     required IAptosAccountRepository accountRepository,
//   })  : _entropyRepository = entropyRepository,
//         _jwkRepository = jwkRepository,
//         _accountRepository = accountRepository;

//   final IEntropyRepository _entropyRepository;
//   final IJwkRepository _jwkRepository;
//   final IAptosAccountRepository _accountRepository;

//   Future<DerivationPathToAccounts> call({
//     required Uint8List entropyHash,
//   }) async {
//     if (!await _entropyRepository.has(hash: entropyHash)) {
//       throw StateError('Entropy not found');
//     }

//     final Map<AptosDerivationPath, Set<Uint8List>> keyIdsWithPaths = _getKeyIdsWithPaths(entropyHash);
//     final Map<AptosDerivationPath, Set<AuthenticationKey>> authKeysWithPaths = _getAuthKeysWithPaths(keyIdsWithPaths);
    
//     final Map<AptosDerivationPath, List<AptosAccountWithMetadata>> pathToAccounts = <AptosDerivationPath, List<AptosAccountWithMetadata>>{};
    
//     for (final MapEntry<AptosDerivationPath, Set<AuthenticationKey>> entry in authKeysWithPaths.entries) {
//       final AptosDerivationPath path = entry.key;
//       final Set<AuthenticationKey> authKeys = entry.value;
      
//       final List<AptosAccountWithMetadata> accounts = authKeys
//           .expand((AuthenticationKey authKey) => _accountRepository.getByAuthKey(authKey: authKey))
//           .toList();
          
//       if (accounts.isNotEmpty) {
//         pathToAccounts[path] = accounts;
//       }
//     }

//     return pathToAccounts;
//   }

//   Map<AptosDerivationPath, Set<Uint8List>> _getKeyIdsWithPaths(Uint8List entropyHash) {
//     final Map<AptosDerivationPath, Set<Uint8List>> pathToKeyIds = <AptosDerivationPath, Set<Uint8List>>{};
    
//     for (final (Uint8List, HDKeySourceConfig) config in _jwkRepository.getAllHDKeySourceConfigs()) {
//       final (Uint8List keyId, HDKeySourceConfig hdConfig) = config;
      
//       if (hdConfig.entropyHash == entropyHash) {
//         final AptosDerivationPath path = hdConfig.derivationPath;
//         pathToKeyIds.putIfAbsent(path, () => <Uint8List>{}).add(keyId);
//       }
//     }
    
//     return pathToKeyIds;
//   }

//   Map<AptosDerivationPath, Set<AuthenticationKey>> _getAuthKeysWithPaths(
//     Map<AptosDerivationPath, Set<Uint8List>> keyIdsWithPaths,
//   ) {
//     final Map<AptosDerivationPath, Set<AuthenticationKey>> pathToAuthKeys = <AptosDerivationPath, Set<AuthenticationKey>>{};
    
//     for (final MapEntry<AptosDerivationPath, Set<Uint8List>> entry in keyIdsWithPaths.entries) {
//       final AptosDerivationPath path = entry.key;
//       final Set<Uint8List> keyIds = entry.value;
      
//       for (final Uint8List keyId in keyIds) {
//         final Jwk? jwk = _jwkRepository.get(keyId: keyId);
//         if (jwk == null) {
//           continue;
//         }
        
//         final AuthenticationKey authKey = AuthenticationKey.ed25519SchemeFromPublicKey(
//           publicKeyBytes: jwk.getPublicKeyBytes(),
//         );
        
//         pathToAuthKeys.putIfAbsent(path, () => <AuthenticationKey>{}).add(authKey);
//       }
//     }
    
//     return pathToAuthKeys;
//   }
// }

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

 Future<Either<ExceptionWithStackTrace, DerivationPathToAccounts>> call({
   required Uint8List entropyHash,
 }) => TaskEither<ExceptionWithStackTrace, DerivationPathToAccounts>(() async {
   try {
     final Either<ExceptionWithStackTrace, bool> hasEntropyResult = 
         await _entropyRepository.has(hash: entropyHash).run();
         
     if (hasEntropyResult.isLeft()) {
       return left(hasEntropyResult.getLeft().toNullable()!);
     }
     
     final bool hasEntropy = hasEntropyResult.getRight().toNullable()!;
     
     if (!hasEntropy) {
       throw StateError('Entropy not found');
     }

     final Either<ExceptionWithStackTrace, Map<AptosDerivationPath, Set<Uint8List>>> keyIdsWithPathsResult = 
         _getKeyIdsWithPaths(entropyHash).run();
         
     if (keyIdsWithPathsResult.isLeft()) {
       return left(keyIdsWithPathsResult.getLeft().toNullable()!);
     }
     
     final Map<AptosDerivationPath, Set<Uint8List>> keyIdsWithPaths = 
         keyIdsWithPathsResult.getRight().toNullable()!;
         
     final Either<ExceptionWithStackTrace, Map<AptosDerivationPath, Set<AuthenticationKey>>> authKeysWithPathsResult = 
         _getAuthKeysWithPaths(keyIdsWithPaths).run();
         
     if (authKeysWithPathsResult.isLeft()) {
       return left(authKeysWithPathsResult.getLeft().toNullable()!);
     }
     
     final Map<AptosDerivationPath, Set<AuthenticationKey>> authKeysWithPaths = 
         authKeysWithPathsResult.getRight().toNullable()!;
     
     final Map<AptosDerivationPath, List<AptosAccountWithMetadata>> pathToAccounts = 
         <AptosDerivationPath, List<AptosAccountWithMetadata>>{};
     
     for (final MapEntry<AptosDerivationPath, Set<AuthenticationKey>> entry in authKeysWithPaths.entries) {
       final AptosDerivationPath path = entry.key;
       final Set<AuthenticationKey> authKeys = entry.value;
       
       final List<AptosAccountWithMetadata> accounts = <AptosAccountWithMetadata>[];
       
       for (final AuthenticationKey authKey in authKeys) {
         final Either<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>> accountsResult = 
             await _accountRepository.getByAuthKey(authKey: authKey).run();
             
         if (accountsResult.isLeft()) {
           return left(accountsResult.getLeft().toNullable()!);
         }
         
         final Set<AptosAccountWithMetadata> authKeyAccounts = accountsResult.getRight().toNullable()!;
         accounts.addAll(authKeyAccounts);
       }
       
       if (accounts.isNotEmpty) {
         pathToAccounts[path] = accounts;
       }
     }

     return right(pathToAccounts);
   } on Exception catch (e, stackTrace) {
     return left(ExceptionWithStackTrace(e, stackTrace));
   }
 }).run();

 IOEither<ExceptionWithStackTrace, Map<AptosDerivationPath, Set<Uint8List>>> _getKeyIdsWithPaths(
   Uint8List entropyHash,
 ) => IOEither<ExceptionWithStackTrace, Map<AptosDerivationPath, Set<Uint8List>>>(() {
   try {
     final Either<ExceptionWithStackTrace, Set<(Uint8List, HDKeySourceConfig)>> configsResult = 
         _jwkRepository.getAllHDKeySourceConfigs().run();
         
     if (configsResult.isLeft()) {
       return left(configsResult.getLeft().toNullable()!);
     }
     
     final Set<(Uint8List, HDKeySourceConfig)> configs = configsResult.getRight().toNullable()!;
     
     final Map<AptosDerivationPath, Set<Uint8List>> pathToKeyIds = <AptosDerivationPath, Set<Uint8List>>{};
     
     for (final (Uint8List, HDKeySourceConfig) config in configs) {
       final (Uint8List keyId, HDKeySourceConfig hdConfig) = config;
       
       if (areByteListsEqual(hdConfig.entropyHash, entropyHash)) {
         final AptosDerivationPath path = hdConfig.derivationPath;
         pathToKeyIds.putIfAbsent(path, () => <Uint8List>{}).add(keyId);
       }
     }
     
     return right(pathToKeyIds);
   } on Exception catch (e, stackTrace) {
     return left(ExceptionWithStackTrace(e, stackTrace));
   }
 });

 IOEither<ExceptionWithStackTrace, Map<AptosDerivationPath, Set<AuthenticationKey>>> _getAuthKeysWithPaths(
   Map<AptosDerivationPath, Set<Uint8List>> keyIdsWithPaths,
 ) => IOEither<ExceptionWithStackTrace, Map<AptosDerivationPath, Set<AuthenticationKey>>>(() {
   try {
     final Map<AptosDerivationPath, Set<AuthenticationKey>> pathToAuthKeys = 
         <AptosDerivationPath, Set<AuthenticationKey>>{};
     
     for (final MapEntry<AptosDerivationPath, Set<Uint8List>> entry in keyIdsWithPaths.entries) {
       final AptosDerivationPath path = entry.key;
       final Set<Uint8List> keyIds = entry.value;
       
       for (final Uint8List keyId in keyIds) {
         final Either<ExceptionWithStackTrace, Option<Jwk>> jwkResult = 
             _jwkRepository.get(keyId: keyId).run();
             
         if (jwkResult.isLeft()) {
           return left(jwkResult.getLeft().toNullable()!);
         }
         
         final Option<Jwk> jwkOption = jwkResult.getRight().toNullable()!;
         
         if (jwkOption.isNone()) {
           continue;
         }
         
         final Jwk jwk = jwkOption.toNullable()!;
         
         final AuthenticationKey authKey = AuthenticationKey.ed25519SchemeFromPublicKey(
           publicKeyBytes: jwk.getPublicKeyBytes(),
         );
         
         pathToAuthKeys.putIfAbsent(path, () => <AuthenticationKey>{}).add(authKey);
       }
     }
     
     return right(pathToAuthKeys);
   } on Exception catch (e, stackTrace) {
     return left(ExceptionWithStackTrace(e, stackTrace));
   }
 });
}
