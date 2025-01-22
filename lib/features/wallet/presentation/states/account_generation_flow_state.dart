import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/aptos_account.dart';

part 'generated/account_generation_flow_state.freezed.dart';

@freezed
sealed class AccountGenerationFlowState with _$AccountGenerationFlowState {
  const factory AccountGenerationFlowState.idle() = AccountGenerationStateIdle;

  const factory AccountGenerationFlowState.inProgress({
    required KeySource source,
  }) = AccountGenerationStateInProgress;

  const factory AccountGenerationFlowState.ready({
    required AptosAccount account,
  }) = AccountGenerationStateReady;

  const factory AccountGenerationFlowState.error(String message) = _Error;
}

@freezed
sealed class KeySource with _$KeySource {
  const factory KeySource.mnemonic({
    required Uint8List entropyHash,
    int? accountIndex,
  }) = KeySourceMnemonic;

  const factory KeySource.privateKey({
    required Uint8List jwkThumbprint,
  }) = KeySourcePrivateKey;
}
