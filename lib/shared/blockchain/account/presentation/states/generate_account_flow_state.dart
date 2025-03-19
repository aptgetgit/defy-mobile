import 'dart:typed_data';
import 'dart:ui';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/aptos_account_with_metadata.dart';

part 'generated/generate_account_flow_state.freezed.dart';

@freezed
sealed class GenerateAccountFlowState with _$GenerateAccountFlowState {
  const factory GenerateAccountFlowState.idle() = GenerateAccountFlowStateIdle;

  const factory GenerateAccountFlowState.importing() =
      GenerateAccountFlowStateImporting;

  const factory GenerateAccountFlowState.waitingForMetadata({
    required KeySource keySource,
  }) = GenerateAccountFlowStateWaitingForMetadata;

  const factory GenerateAccountFlowState.generating({
    required KeySource keySource,
    required String label,
    required Uri iconUri,
    required Color backgroundColor,
  }) = GenerateAccountFlowStateGenerating;

  const factory GenerateAccountFlowState.generated({
    required AptosAccountWithMetadata account,
  }) = GenerateAccountFlowStateReady;

  const factory GenerateAccountFlowState.error(String message) =
      GenerateAccountFlowStateError;
}

@freezed
sealed class KeySource with _$KeySource {
  const factory KeySource.mnemonic({
    required Uint8List entropyHash,
    required Option<int> accountIndex,
  }) = KeySourceMnemonic;

  const factory KeySource.privateKey({
    required Uint8List jwkThumbprint,
  }) = KeySourcePrivateKey;
}
