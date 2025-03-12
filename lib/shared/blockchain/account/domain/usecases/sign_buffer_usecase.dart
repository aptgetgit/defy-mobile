// import 'dart:typed_data';

// import '../../../../utils/ed25519_utils.dart';
// import '../../../../utils/hd_key_derivation_utils.dart';
// import '../entities/account_address.dart';
// import '../entities/aptos_account_with_metadata.dart';
// import '../entities/json_web_key.dart';
// import '../repositories/aptos_account_repository_interface.dart';
// import '../repositories/entropy_repository_interface.dart';
// import '../repositories/jwk_repository_interface.dart';
// import '../repositories/private_jwk_repository_interface.dart';

// class SignBufferUseCase {
//   const SignBufferUseCase({
//     required IAptosAccountRepository accountRepository,
//     required IJwkRepository jwkRepository,
//     required IEntropyRepository entropyRepository,
//     required IPrivateJwkRepository privateJwkRepository,
//   })  : _accountRepository = accountRepository,
//         _jwkRepository = jwkRepository,
//         _entropyRepository = entropyRepository,
//         _privateJwkRepository = privateJwkRepository;

//   final IAptosAccountRepository _accountRepository;
//   final IJwkRepository _jwkRepository;
//   final IEntropyRepository _entropyRepository;
//   final IPrivateJwkRepository _privateJwkRepository;

//   Future<(Uint8List signature, Uint8List publicKey)> call({
//     required AccountAddress accountAddress,
//     required Uint8List buffer,
//   }) async {
//     final AptosAccountWithMetadata? account = _accountRepository.getByAddress(
//       accountAddress: accountAddress,
//     );
//     if (account == null) {
//       throw StateError('Account not found');
//     }

//     final AuthenticatorConfig? authConfig =
//         _accountRepository.getAuthConfigByAuthKey(
//       authKey: account.authenticationKey,
//     );
//     if (authConfig == null) {
//       throw StateError('Auth configuration not found');
//     }

//     try {
//       final Uint8List privateKeyBytes = await _getPrivateKeyBytes(authConfig);

//       final Uint8List signature = sign(buffer, privateKeyBytes);
//       final Uint8List publicKey = derivePublicKey(privateKeyBytes);

//       return (signature, publicKey);
//     } catch (e) {
//       throw StateError('Failed to sign buffer: $e');
//     }
//   }

//   Future<Uint8List> _getPrivateKeyBytes(AuthenticatorConfig authConfig) async {
//     final HDKeySourceConfig? hdConfig = _jwkRepository.getHDKeySourceConfig(
//       keyId: authConfig.keyId,
//     );
//     if (hdConfig != null) {
//       final Uint8List? entropy =
//           await _entropyRepository.get(hash: hdConfig.entropyHash);
//       if (entropy == null) {
//         throw StateError('Entropy not found');
//       }
//       return deriveHDKeyFromEntropy(
//         entropy: entropy,
//         derivationPath: hdConfig.derivationPath.toBytes(),
//       );
//     }

//     final Jwk? privateJwk =
//         await _privateJwkRepository.get(keyId: authConfig.keyId);
//     if (privateJwk == null) {
//       throw StateError('Private key not found');
//     }
//     return privateJwk.getPrivateKeyBytes();
//   }
// }

import 'dart:typed_data';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../utils/ed25519_utils.dart';
import '../../../../utils/hd_key_derivation_utils.dart';
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

 TaskEither<ExceptionWithStackTrace, (Uint8List, Uint8List)> call({
   required AccountAddress accountAddress,
   required Uint8List buffer,
 }) => TaskEither<ExceptionWithStackTrace, (Uint8List, Uint8List)>(() async {
   final Either<ExceptionWithStackTrace, Option<AptosAccountWithMetadata>> accountResult = 
       await _accountRepository.getByAddress(accountAddress: accountAddress).run();
       
   if (accountResult.isLeft()) {
     return left(accountResult.getLeft().toNullable()!);
   }
   
   final Option<AptosAccountWithMetadata> accountOption = accountResult.getRight().toNullable()!;
   
   if (accountOption.isNone()) {
     throw StateError('Account not found');
   }
   
   final AptosAccountWithMetadata account = accountOption.toNullable()!;

   final Either<ExceptionWithStackTrace, Option<AuthenticatorConfig>> authConfigResult =
       await _accountRepository.getAuthConfigByAuthKey(
     authKey: account.authenticationKey,
   ).run();
   
   if (authConfigResult.isLeft()) {
     return left(authConfigResult.getLeft().toNullable()!);
   }
   
   final Option<AuthenticatorConfig> authConfigOption = authConfigResult.getRight().toNullable()!;
   
   if (authConfigOption.isNone()) {
     throw StateError('Auth configuration not found');
   }
   
   final AuthenticatorConfig authConfig = authConfigOption.toNullable()!;

   final Either<ExceptionWithStackTrace, Uint8List> privateKeyBytesResult = 
       await _getPrivateKeyBytes(authConfig).run();
       
   if (privateKeyBytesResult.isLeft()) {
     return left(privateKeyBytesResult.getLeft().toNullable()!);
   }
   
   final Uint8List privateKeyBytes = privateKeyBytesResult.getRight().toNullable()!;

   final Uint8List signature = sign(buffer, privateKeyBytes);
   final Uint8List publicKey = derivePublicKey(privateKeyBytes);

   return right((signature, publicKey));
 });

 TaskEither<ExceptionWithStackTrace, Uint8List> _getPrivateKeyBytes(
   AuthenticatorConfig authConfig,
 ) => TaskEither<ExceptionWithStackTrace, Uint8List>(() async {
   final Either<ExceptionWithStackTrace, Option<HDKeySourceConfig>> hdConfigResult = 
       _jwkRepository.getHDKeySourceConfig(keyId: authConfig.keyId).run();
       
   if (hdConfigResult.isLeft()) {
     return left(hdConfigResult.getLeft().toNullable()!);
   }
   
   final Option<HDKeySourceConfig> hdConfigOption = hdConfigResult.getRight().toNullable()!;
   
   if (hdConfigOption.isSome()) {
     final HDKeySourceConfig hdConfig = hdConfigOption.toNullable()!;
     
     final Either<ExceptionWithStackTrace, Option<Uint8List>> entropyResult =
         await _entropyRepository.get(hash: hdConfig.entropyHash).run();
         
     if (entropyResult.isLeft()) {
       return left(entropyResult.getLeft().toNullable()!);
     }
     
     final Option<Uint8List> entropyOption = entropyResult.getRight().toNullable()!;
     
     if (entropyOption.isNone()) {
       throw StateError('Entropy not found');
     }
     
     final Uint8List entropy = entropyOption.toNullable()!;
     
     return right(deriveHDKeyFromEntropy(
       entropy: entropy,
       derivationPath: hdConfig.derivationPath.toBytes(),
     ),);
   }

   final Either<ExceptionWithStackTrace, Option<Jwk>> privateJwkResult =
       await _privateJwkRepository.get(keyId: authConfig.keyId).run();
       
   if (privateJwkResult.isLeft()) {
     return left(privateJwkResult.getLeft().toNullable()!);
   }
   
   final Option<Jwk> privateJwkOption = privateJwkResult.getRight().toNullable()!;
   
   if (privateJwkOption.isNone()) {
     throw StateError('Private key not found');
   }
   
   final Jwk privateJwk = privateJwkOption.toNullable()!;
   
   return right(privateJwk.getPrivateKeyBytes());
 });
}
