import 'dart:typed_data';
import 'dart:ui';
import 'package:riverpod_annotation/riverpod_annotation.dart';


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
      final Uint8List entropyHash = await ref
          .read(importMnemonicUseCaseProvider)
          .call(mnemonic: mnemonic);

      state = GenerateAccountFlowState.waitingForMetadata(
        keySource: KeySource.mnemonic(entropyHash: entropyHash),
      );
    } on Exception catch (e) {
      
      if (e.toString().contains('Entropy already exists')) {
        state = const GenerateAccountFlowState.error('Entropy already exists');
      } else {
        state = GenerateAccountFlowState.error(e.toString());
      }
    }
  }

  Future<void> importPrivateKey(Uint8List privateKey) async {
    state = const GenerateAccountFlowState.importing();

    try {
      final Uint8List jwkThumbprint =
          await ref.read(importPrivateKeyUseCaseProvider).call(privateKey);

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
      final AptosAccountWithMetadata account =
          await switch (currentState.keySource) {
        KeySourceMnemonic(
          :final Uint8List entropyHash,
          :final int? accountIndex
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
    int? accountIndex,
  ) async {
    final Uint8List keyId = await ref
        .read(generatePrivateKeyFromMnemonicUseCaseProvider)
        .call(entropyHash: entropyHash, accountIndex: accountIndex);
    return _generateFromPrivateKey(label, iconUri, backgroundColor, keyId);
  }

  Future<AptosAccountWithMetadata> _generateFromPrivateKey(
    String label,
    Uri iconUri,
    Color backgroundColor,
    Uint8List jwkThumbprint,
  ) async =>
      ref.read(createAptosAccountUseCaseProvider).call(
            label: label,
            iconUri: iconUri,
            backgroundColor: backgroundColor,
            authenticatorConfig: AuthenticatorConfig.ed25519(
              keyId: jwkThumbprint,
            ),
          );
}
