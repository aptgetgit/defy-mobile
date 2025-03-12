import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../entities/account_address.dart';
import '../entities/aptos_account_with_metadata.dart';
import '../repositories/aptos_account_repository_interface.dart';
import '../repositories/jwk_repository_interface.dart';

class CheckMnemonicAvailabilityUseCase {
  const CheckMnemonicAvailabilityUseCase({
    required IAptosAccountRepository accountRepository,
    required IJwkRepository jwkRepository,
  }) : _accountRepository = accountRepository,
       _jwkRepository = jwkRepository;

  final IAptosAccountRepository _accountRepository;
  final IJwkRepository _jwkRepository;

  TaskEither<ExceptionWithStackTrace, bool> call({
    required AccountAddress accountAddress,
  }) => TaskEither<ExceptionWithStackTrace, bool>(() async {
    final Either<ExceptionWithStackTrace, Option<AptosAccountWithMetadata>>
    account =
        await _accountRepository
            .getByAddress(accountAddress: accountAddress)
            .run();
    if (account.isLeft()) {
      return left(account.getLeft().toNullable()!);
    }

    if (account.isRight() && account.getRight().isNone()) {
      return right(false);
    }

    final AptosAccountWithMetadata accountWithMetadata =
        account.getRight().toNullable()!.toNullable()!;

    final Either<ExceptionWithStackTrace, Option<AuthenticatorConfig>>
    authConfig =
        await _accountRepository
            .getAuthConfigByAuthKey(
              authKey: accountWithMetadata.authenticationKey,
            )
            .run();

    if (authConfig.isLeft()) {
      return left(authConfig.getLeft().toNullable()!);
    }

    if (authConfig.isRight() && authConfig.getRight().isNone()) {
      return right(false);
    }

    final AuthenticatorConfig config =
        authConfig.getRight().toNullable()!.toNullable()!;

    return _jwkRepository
        .getHDKeySourceConfig(keyId: config.keyId)
        .map((Option<HDKeySourceConfig> data) => data.isSome())
        .run();
  });
}
