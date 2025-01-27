import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/aptos_account.dart';
import '../../domain/repositories/aptos_account_repository.dart';
import '../states/account_generation_flow_state.dart';
import 'account_usecase_provider.dart';

part 'generated/account_generation_flow_manager.g.dart';

@Riverpod()
class AccountGenerationFlowManager extends _$AccountGenerationFlowManager {
  @override
  AccountGenerationFlowState build() => const AccountGenerationFlowState.idle();

  Future<void> generateAccount(KeySource keySource) async {
    state = AccountGenerationFlowState.inProgress(source: keySource);

    try {
      final AptosAccount account = await switch (keySource) {
        KeySourceMnemonic(
          :final Uint8List entropyHash,
          :final int? accountIndex
        ) =>
          _generateFromMnemonic(entropyHash, accountIndex),
        KeySourcePrivateKey(:final Uint8List jwkThumbprint) =>
          _generateFromPrivateKey(jwkThumbprint),
      };

      state = AccountGenerationFlowState.ready(account: account);
    } on Exception catch (e) {
      state = AccountGenerationFlowState.error(e.toString());
    }
  }

  Future<AptosAccount> _generateFromMnemonic(
    Uint8List entropyHash,
    int? accountIndex,
  ) async {
    final Uint8List keyId = await ref
        .read(generatePrivateKeyUseCaseProvider)
        .call(entropyHash: entropyHash, accountIndex: accountIndex);
    return _generateFromPrivateKey(keyId);
  }

  Future<AptosAccount> _generateFromPrivateKey(Uint8List jwkThumbprint) async {
    final AptosAccount account =
        await ref.read(createAptosAccountUseCaseProvider).call(
              authenticatorConfig: AuthenticatorConfig.ed25519(
                keyId: jwkThumbprint,
              ),
            );
    return account;
  }

  Future<void> importMnemonic(String mnemonic) async {
    try {
      final Uint8List entropyHash = await ref
          .read(importMnemonicUseCaseProvider)
          .call(mnemonic: mnemonic);
      await generateAccount(KeySource.mnemonic(entropyHash: entropyHash));
    } on Exception catch (e) {
      state = AccountGenerationFlowState.error(e.toString());
    }
  }

  Future<void> importPrivateKey(Uint8List privateKey) async {
    try {
      final Uint8List jwkThumbprint =
          await ref.read(importPrivateKeyUseCaseProvider).call(privateKey);

      await generateAccount(KeySource.privateKey(jwkThumbprint: jwkThumbprint));
    } on Exception catch (e) {
      state = AccountGenerationFlowState.error(e.toString());
    }
  }
}
