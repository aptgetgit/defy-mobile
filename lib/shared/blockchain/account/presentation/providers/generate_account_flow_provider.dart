import 'dart:typed_data';
import 'dart:ui';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../../core/logging/app_logger.dart';
import '../../../../utils/crypto_utils.dart';
import '../../../../utils/ed25519_utils.dart';
import '../../../../utils/mnemonic_utils.dart';
import '../../domain/entities/aptos_account_with_metadata.dart';
import '../../domain/entities/json_web_key.dart';
import '../../domain/repositories/aptos_account_repository_interface.dart';
import '../states/generate_account_flow_state.dart';
import 'usecase_provider.dart';

part 'generated/generate_account_flow_provider.g.dart';

@Riverpod()
class GenerateAccountFlow extends _$GenerateAccountFlow {
  @override
  GenerateAccountFlowState build() => const GenerateAccountFlowState.idle();

  Future<void> generateAccount(AccountGenerationParams params) async {
    state = const GenerateAccountFlowState.importing();

    final TaskEither<ExceptionWithStackTrace, KeySource> task =
        switch (params) {
          AccountGenerationParamsGenerateMnemonic(:final int strength) =>
            _generateMnemonic(
              strength: strength,
            ).map((KeySourceMnemonic keySource) => keySource),

          AccountGenerationParamsImportMnemonic(:final String mnemonic) =>
            _importMnemonic(
              mnemonic: mnemonic,
            ).map((KeySourceMnemonic keySource) => keySource),

          AccountGenerationParamsGenerateFromEntropy(
            :final Uint8List entropyHash,
            :final Option<int> accountIndex,
          ) =>
            _generateFromEntropy(
              entropyHash: entropyHash,
              accountIndex: accountIndex,
            ).map((KeySourceMnemonic keySource) => keySource),

          AccountGenerationParamsImportPrivateKey(
            :final Uint8List privateKey,
          ) =>
            _importPrivateKey(
              privateKey: privateKey,
            ).map((KeySourcePrivateKey keySource) => keySource),

          AccountGenerationParamsGenerateFromPrivateKey(
            :final Uint8List jwkThumbprint,
          ) =>
            TaskEither<ExceptionWithStackTrace, KeySource>.right(
              KeySourcePrivateKey(jwkThumbprint: jwkThumbprint),
            ),
        };

    final Either<ExceptionWithStackTrace, KeySource> result = await task.run();

    result.fold(
      (ExceptionWithStackTrace error) {
        AppLogger.error(
          'Account generation failed',
          error: error.exception,
          stackTrace: error.stackTrace,
        );
        state = const GenerateAccountFlowState.error('Account generation failed');
      },
      (KeySource keySource) {
        state = GenerateAccountFlowState.waitingForMetadata(
          keySource: keySource,
        );
      },
    );
  }

  TaskEither<ExceptionWithStackTrace, KeySourceMnemonic> _generateMnemonic({
    required int strength,
  }) => TaskEither<ExceptionWithStackTrace, KeySourceMnemonic>(() async {
    try {
      final Either<ExceptionWithStackTrace, Uint8List> entropyEither = await ref
          .read(generateMnemonicUseCaseProvider)
          .call(strength: strength);

      if (entropyEither.isLeft()) {
        final ExceptionWithStackTrace exceptionWithStackTrace =
            entropyEither.getLeft().toNullable()!;
        AppLogger.error(
          'Failed to generate mnemonic',
          error: exceptionWithStackTrace.exception,
          stackTrace: exceptionWithStackTrace.stackTrace,
        );

        return left(exceptionWithStackTrace);
      }
      return right(
        KeySourceMnemonic(
          entropyHash: entropyEither.getRight().toNullable()!,
          accountIndex: const Option<int>.of(0),
        ),
      );
    } on Exception catch (error, stackTrace) {
      return left(ExceptionWithStackTrace(error, stackTrace));
    }
  });

  TaskEither<ExceptionWithStackTrace, KeySourceMnemonic> _importMnemonic({
    required String mnemonic,
  }) => TaskEither<ExceptionWithStackTrace, KeySourceMnemonic>(() async {
    try {
      final Uint8List entropy = mnemonicToEntropy(mnemonic);
      final Uint8List entropyHash = computeSha256Hash(entropy);

      final Either<ExceptionWithStackTrace, Option<String>>
      mnemonicExistEither = await ref
          .read(getMnemonicUseCaseProvider)
          .call(entropyHash: entropyHash);

      if (mnemonicExistEither.isLeft()) {
        final ExceptionWithStackTrace exceptionWithStackTrace =
            mnemonicExistEither.getLeft().toNullable()!;
        AppLogger.error(
          'Failed to check if mnemonic exists',
          error: exceptionWithStackTrace.exception,
          stackTrace: exceptionWithStackTrace.stackTrace,
        );

        return left(exceptionWithStackTrace);
      }

      if (mnemonicExistEither.getRight().toNullable()!.isNone()) {
        final Either<ExceptionWithStackTrace, Uint8List> entropyHashEither =
            await ref
                .read(importMnemonicUseCaseProvider)
                .call(mnemonic: mnemonic);
        if (entropyHashEither.isLeft()) {
          final ExceptionWithStackTrace exceptionWithStackTrace =
              entropyHashEither.getLeft().toNullable()!;
          AppLogger.error(
            'Failed to import mnemonic',
            error: exceptionWithStackTrace.exception,
            stackTrace: exceptionWithStackTrace.stackTrace,
          );
          return left(exceptionWithStackTrace);
        }
      }
      return right(
        KeySourceMnemonic(
          entropyHash: entropyHash,
          accountIndex: const Option<int>.none(),
        ),
      );
    } on Exception catch (error, stackTrace) {
      return left(ExceptionWithStackTrace(error, stackTrace));
    }
  });

  TaskEither<ExceptionWithStackTrace, KeySourceMnemonic> _generateFromEntropy({
    required Uint8List entropyHash,
    required Option<int> accountIndex,
  }) => TaskEither<ExceptionWithStackTrace, KeySourceMnemonic>(() async {
    try {
      final Either<ExceptionWithStackTrace, Option<String>>
      mnemonicExistEither = await ref
          .read(getMnemonicUseCaseProvider)
          .call(entropyHash: entropyHash);

      if (mnemonicExistEither.isLeft()) {
        final ExceptionWithStackTrace exceptionWithStackTrace =
            mnemonicExistEither.getLeft().toNullable()!;
        AppLogger.error(
          'Failed to check if mnemonic exists',
          error: exceptionWithStackTrace.exception,
          stackTrace: exceptionWithStackTrace.stackTrace,
        );
        return left(exceptionWithStackTrace);
      }

      if (mnemonicExistEither.getRight().toNullable()!.isNone()) {
        throw StateError('Mnemonic not found');
      }

      return right(
        KeySourceMnemonic(entropyHash: entropyHash, accountIndex: accountIndex),
      );
    } on Exception catch (error, stackTrace) {
      return left(ExceptionWithStackTrace(error, stackTrace));
    }
  });

  TaskEither<ExceptionWithStackTrace, KeySourcePrivateKey> _importPrivateKey({
    required Uint8List privateKey,
  }) => TaskEither<ExceptionWithStackTrace, KeySourcePrivateKey>(() async {
    try {
      final Uint8List privateKeyBytes = expandSecretKey(privateKey);

      final Jwk jwk = Jwk.fromEd25519PrivateKey(
        privateKey: Uint8List.fromList(privateKeyBytes.sublist(0, 32)),
      );

      final Uint8List jwkKeyId = jwk.keyId;

      final Either<ExceptionWithStackTrace, Option<Jwk>> privateKeyExistEither =
          await ref.read(getPrivateKeyUseCaseProvider).call(keyId: jwkKeyId);

      if (privateKeyExistEither.isLeft()) {
        final ExceptionWithStackTrace exceptionWithStackTrace =
            privateKeyExistEither.getLeft().toNullable()!;
        AppLogger.error(
          'Failed to check if private key exists',
          error: exceptionWithStackTrace.exception,
          stackTrace: exceptionWithStackTrace.stackTrace,
        );

        return left(exceptionWithStackTrace);
      }

      if (privateKeyExistEither.getRight().toNullable()!.isNone()) {
        final Either<ExceptionWithStackTrace, Uint8List>
        importPrivateKeyEither = await ref
            .read(importPrivateKeyUseCaseProvider)
            .call(privateKeyBytes: privateKey);

        if (importPrivateKeyEither.isLeft()) {
          final ExceptionWithStackTrace exceptionWithStackTrace =
              importPrivateKeyEither.getLeft().toNullable()!;
          AppLogger.error(
            'Failed to import private key',
            error: exceptionWithStackTrace.exception,
            stackTrace: exceptionWithStackTrace.stackTrace,
          );
          return left(exceptionWithStackTrace);
        }
      }

      return right(KeySourcePrivateKey(jwkThumbprint: jwkKeyId));
    } on Exception catch (error, stackTrace) {
      return left(ExceptionWithStackTrace(error, stackTrace));
    }
  });

  Future<void> completeWithMetadata({
    required String label,
    required Uri iconUri,
    required Color backgroundColor,
  }) async {
    final GenerateAccountFlowState currentState = state;
    if (currentState is! GenerateAccountFlowStateWaitingForMetadata) {
      state = const GenerateAccountFlowState.error(
        'Cannot add metadata: account source not prepared',
      );
      return;
    }

    state = GenerateAccountFlowState.generating(
      keySource: currentState.keySource,
      label: label,
      iconUri: iconUri,
      backgroundColor: backgroundColor,
    );

    try {
      final AptosAccountWithMetadata account = await switch (currentState
          .keySource) {
        KeySourceMnemonic(
          :final Uint8List entropyHash,
          :final Option<int> accountIndex,
        ) =>
          _generateFromMnemonic(
            label,
            iconUri,
            backgroundColor,
            entropyHash,
            accountIndex,
          ),
        KeySourcePrivateKey(:final Uint8List jwkThumbprint) =>
          _generateFromPrivateKey(
            label,
            iconUri,
            backgroundColor,
            jwkThumbprint,
          ),
      };

      state = GenerateAccountFlowState.generated(account: account);

      final Either<ExceptionWithStackTrace, Unit> setActiveResult = await ref
          .read(setActiveAccountUseCaseProvider)
          .call(accountAddress: account.accountAddress);

      if (setActiveResult.isLeft()) {
        AppLogger.warning(
          'Account created but could not be set as active',
          error: setActiveResult.getLeft().toNullable()!.exception,
        );
      }
    } on Exception catch (e) {
      AppLogger.error('Failed to complete account creation', error: e);
      state = GenerateAccountFlowState.error(e.toString());
    }
  }

  Future<AptosAccountWithMetadata> _generateFromMnemonic(
    String label,
    Uri iconUri,
    Color backgroundColor,
    Uint8List entropyHash,
    Option<int> accountIndex,
  ) async {
    final Either<ExceptionWithStackTrace, Uint8List> keyIdEither = await ref
        .read(generatePrivateKeyFromMnemonicUseCaseProvider)
        .call(entropyHash: entropyHash, accountIndex: accountIndex);

    if (keyIdEither.isLeft()) {
      final ExceptionWithStackTrace exceptionWithStackTrace =
          keyIdEither.getLeft().toNullable()!;
      AppLogger.error(
        'Failed to generate private key',
        error: exceptionWithStackTrace.exception,
        stackTrace: exceptionWithStackTrace.stackTrace,
      );
      throw exceptionWithStackTrace.exception;
    }

    final Uint8List keyId = keyIdEither.getRight().toNullable()!;
    return _generateFromPrivateKey(label, iconUri, backgroundColor, keyId);
  }

  Future<AptosAccountWithMetadata> _generateFromPrivateKey(
    String label,
    Uri iconUri,
    Color backgroundColor,
    Uint8List jwkThumbprint,
  ) async {
    final Either<ExceptionWithStackTrace, AptosAccountWithMetadata>
    accountCreationEither = await ref
        .read(createAptosAccountUseCaseProvider)
        .call(
          label: label,
          iconUri: iconUri,
          backgroundColor: backgroundColor,
          authenticatorConfig: AuthenticatorConfig.ed25519(
            keyId: jwkThumbprint,
          ),
        );

    if (accountCreationEither.isLeft()) {
      final ExceptionWithStackTrace exceptionWithStackTrace =
          accountCreationEither.getLeft().toNullable()!;
      AppLogger.error(
        'Failed to create account',
        error: exceptionWithStackTrace.exception,
        stackTrace: exceptionWithStackTrace.stackTrace,
      );
      throw exceptionWithStackTrace.exception;
    }

    return accountCreationEither.getRight().toNullable()!;
  }
}