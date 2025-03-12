import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../utils/hd_key_derivation_utils.dart';
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
  }) : _accountRepository = accountRepository,
       _jwkRepository = jwkRepository,
       _entropyRepository = entropyRepository,
       _privateJwkRepository = privateJwkRepository;

  final IAptosAccountRepository _accountRepository;
  final IPrivateJwkRepository _privateJwkRepository;
  final IJwkRepository _jwkRepository;
  final IEntropyRepository _entropyRepository;

  TaskEither<ExceptionWithStackTrace, Uint8List> call({
    required AccountAddress accountAddress,
  }) => TaskEither<ExceptionWithStackTrace, Uint8List>(() async {
    final Either<ExceptionWithStackTrace, Option<AptosAccountWithMetadata>>
    accountResult =
        await _accountRepository
            .getByAddress(accountAddress: accountAddress)
            .run();

    if (accountResult.isLeft()) {
      return left(accountResult.getLeft().toNullable()!);
    }

    final Option<AptosAccountWithMetadata> accountOption =
        accountResult.getRight().toNullable()!;

    if (accountOption.isNone()) {
      throw StateError('Account not found');
    }

    final AptosAccountWithMetadata account = accountOption.toNullable()!;

    final Either<ExceptionWithStackTrace, Option<AuthenticatorConfig>>
    authConfigResult =
        await _accountRepository
            .getAuthConfigByAuthKey(authKey: account.authenticationKey)
            .run();

    if (authConfigResult.isLeft()) {
      return left(authConfigResult.getLeft().toNullable()!);
    }

    final Option<AuthenticatorConfig> authConfigOption =
        authConfigResult.getRight().toNullable()!;

    if (authConfigOption.isNone()) {
      throw StateError('Auth configuration not found');
    }

    final AuthenticatorConfig authConfig = authConfigOption.toNullable()!;

    final Either<ExceptionWithStackTrace, Option<HDKeySourceConfig>>
    hdConfigResult =
        _jwkRepository.getHDKeySourceConfig(keyId: authConfig.keyId).run();

    if (hdConfigResult.isLeft()) {
      return left(hdConfigResult.getLeft().toNullable()!);
    }

    final Option<HDKeySourceConfig> hdConfigOption =
        hdConfigResult.getRight().toNullable()!;

    if (hdConfigOption.isSome()) {
      final HDKeySourceConfig hdConfig = hdConfigOption.toNullable()!;

      final Either<ExceptionWithStackTrace, Option<Uint8List>> entropyResult =
          await _entropyRepository.get(hash: hdConfig.entropyHash).run();

      if (entropyResult.isLeft()) {
        return left(entropyResult.getLeft().toNullable()!);
      }

      final Option<Uint8List> entropyOption =
          entropyResult.getRight().toNullable()!;

      if (entropyOption.isNone()) {
        throw StateError('Entropy not found');
      }

      final Uint8List entropy = entropyOption.toNullable()!;

      return right(
        deriveHDKeyFromEntropy(
          entropy: entropy,
          derivationPath: hdConfig.derivationPath.toBytes(),
        ),
      );
    }

    final Either<ExceptionWithStackTrace, Option<Jwk>> privateJwkResult =
        await _privateJwkRepository.get(keyId: authConfig.keyId).run();

    if (privateJwkResult.isLeft()) {
      return left(privateJwkResult.getLeft().toNullable()!);
    }

    final Option<Jwk> privateJwkOption =
        privateJwkResult.getRight().toNullable()!;

    if (privateJwkOption.isNone()) {
      throw StateError('Private key not found');
    }

    final Jwk privateJwk = privateJwkOption.toNullable()!;

    return right(privateJwk.getPrivateKeyBytes());
  });
}
