import 'dart:typed_data';
import 'dart:ui';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../../core/logging/app_logger.dart';
import '../../domain/entities/aptos_account_with_metadata.dart';
import '../../domain/repositories/aptos_account_repository_interface.dart';
import '../states/generate_account_flow_state.dart';
import 'usecase_provider.dart';

part 'generated/generate_account_flow_provider.g.dart';

@Riverpod()
class GenerateAccountFlow extends _$GenerateAccountFlow {
  @override
  GenerateAccountFlowState build() => const GenerateAccountFlowState.idle();

  Future<void> importMnemonic(String mnemonic) async {
    state = const GenerateAccountFlowState.importing();

    try {
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

        state = const GenerateAccountFlowState.error(
          'Failed to import mnemonic',
        );
      }
      final Uint8List entropyHash = entropyHashEither.getRight().toNullable()!;

      state = GenerateAccountFlowState.waitingForMetadata(
        keySource: KeySource.mnemonic(
          entropyHash: entropyHash,
          accountIndex: const Option<int>.none(),
        ),
      );
    } on Exception catch (e) {
      state = GenerateAccountFlowState.error(e.toString());
    }
  }

  Future<void> importPrivateKey(Uint8List privateKey) async {
    state = const GenerateAccountFlowState.importing();

    try {
      final Either<ExceptionWithStackTrace, Uint8List> jwkThumbprintEither =
          await ref.read(importPrivateKeyUseCaseProvider).call(privateKey);

      if (jwkThumbprintEither.isLeft()) {
        final ExceptionWithStackTrace exceptionWithStackTrace =
            jwkThumbprintEither.getLeft().toNullable()!;
        AppLogger.error(
          'Failed to import private key',
          error: exceptionWithStackTrace.exception,
          stackTrace: exceptionWithStackTrace.stackTrace,
        );

        state = const GenerateAccountFlowState.error(
          'Failed to import private key',
        );
      }

      final Uint8List jwkThumbprint =
          jwkThumbprintEither.getRight().toNullable()!;

      state = GenerateAccountFlowState.waitingForMetadata(
        keySource: KeySource.privateKey(jwkThumbprint: jwkThumbprint),
      );
    } on Exception catch (e) {
      state = GenerateAccountFlowState.error(e.toString());
    }
  }

  Future<void> completeWithMetadata({
    required String label,
    required Uri iconUri,
    required Color backgroundColor,
  }) async {
    final GenerateAccountFlowState currentState = state;
    if (currentState is! GenerateAccountFlowStateWaitingForMetadata) {
      throw StateError(
        'Cannot add metadata: wrong state ${currentState.runtimeType}',
      );
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
      await ref
          .read(setActiveAccountUseCaseProvider)
          .call(accountAddress: account.accountAddress);
    } on Exception catch (e) {
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
      state = const GenerateAccountFlowState.error(
        'Failed to generate private key',
      );
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
      state = const GenerateAccountFlowState.error('Failed to create account');
    }

    return accountCreationEither.getRight().toNullable()!;
  }
}
