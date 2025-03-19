import 'dart:typed_data';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../entities/account_address.dart';
import '../entities/aptos_account_with_metadata.dart';
import '../entities/json_web_key.dart';
import '../repositories/aptos_account_repository_interface.dart';
import '../repositories/jwk_repository_interface.dart';

class GetAccountPublicKeyUseCase {
  const GetAccountPublicKeyUseCase({
    required IAptosAccountRepository accountRepository,
    required IJwkRepository jwkRepository,
  }) : _accountRepository = accountRepository,
       _jwkRepository = jwkRepository;

  final IAptosAccountRepository _accountRepository;
  final IJwkRepository _jwkRepository;

  Future<Either<ExceptionWithStackTrace, Uint8List>> call({
    required AccountAddress accountAddress,
  }) =>
      TaskEither<ExceptionWithStackTrace, Uint8List>(() async {
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

        final Either<ExceptionWithStackTrace, Option<Jwk>> jwkResult =
            _jwkRepository.get(keyId: authConfig.keyId).run();

        if (jwkResult.isLeft()) {
          return left(jwkResult.getLeft().toNullable()!);
        }

        final Option<Jwk> jwkOption = jwkResult.getRight().toNullable()!;

        if (jwkOption.isNone()) {
          throw StateError('Public key not found');
        }

        final Jwk jwk = jwkOption.toNullable()!;

        return right(jwk.getPublicKeyBytes());
      }).run();
}
