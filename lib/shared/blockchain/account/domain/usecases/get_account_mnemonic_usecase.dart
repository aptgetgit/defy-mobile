import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../utils/mnemonic_utils.dart';
import '../entities/account_address.dart';
import '../entities/aptos_account_with_metadata.dart';
import '../entities/aptos_derivation_path.dart';
import '../repositories/aptos_account_repository_interface.dart';
import '../repositories/entropy_repository_interface.dart';
import '../repositories/jwk_repository_interface.dart';

// class GetAccountMnemonicUseCase {
  // const GetAccountMnemonicUseCase({
  //   required IAptosAccountRepository accountRepository,
  //   required IJwkRepository jwkRepository,
  //   required IEntropyRepository entropyRepository,
  // })  : _accountRepository = accountRepository,
  //       _jwkRepository = jwkRepository,
  //       _entropyRepository = entropyRepository;

  // final IAptosAccountRepository _accountRepository;
  // final IJwkRepository _jwkRepository;
  // final IEntropyRepository _entropyRepository;

  // Future<(String, AptosDerivationPath)> call({
  //   required AccountAddress accountAddress,
  // }) async {
  //   final AptosAccountWithMetadata? account = _accountRepository.getByAddress(
  //     accountAddress: accountAddress,
  //   );
  //   if (account == null) {
  //     throw StateError('Account not found');
  //   }

  //   final AuthenticatorConfig? authConfig =
  //       _accountRepository.getAuthConfigByAuthKey(
  //     authKey: account.authenticationKey,
  //   );
  //   if (authConfig == null) {
  //     throw StateError('Auth configuration not found');
  //   }

  //   final HDKeySourceConfig? hdConfig = _jwkRepository.getHDKeySourceConfig(
  //     keyId: authConfig.keyId,
  //   );
  //   if (hdConfig == null) {
  //     throw StateError('Account was not generated from a mnemonic');
  //   }

  //   final Uint8List? entropy =
  //       await _entropyRepository.get(hash: hdConfig.entropyHash);
  //   if (entropy == null) {
  //     throw StateError('Entropy not found');
  //   }

  //   return (entropyToMnemonic(entropy), hdConfig.derivationPath);
  // }
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

 Future<Either<ExceptionWithStackTrace, (String, AptosDerivationPath)>> call({
   required AccountAddress accountAddress,
 }) => TaskEither<ExceptionWithStackTrace, (String, AptosDerivationPath)>(() async {
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

   final Either<ExceptionWithStackTrace, Option<HDKeySourceConfig>> hdConfigResult = 
        _jwkRepository.getHDKeySourceConfig(keyId: authConfig.keyId).run();
       
   if (hdConfigResult.isLeft()) {
     return left(hdConfigResult.getLeft().toNullable()!);
   }
   
   final Option<HDKeySourceConfig> hdConfigOption = hdConfigResult.getRight().toNullable()!;
   
   if (hdConfigOption.isNone()) {
     throw StateError('Account was not generated from a mnemonic');
   }
   
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

   return right((entropyToMnemonic(entropy), hdConfig.derivationPath));
 }).run();
}
