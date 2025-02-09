import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/sign_buffer_flow_state.freezed.dart';

@freezed
sealed class SignBufferFlowState with _$SignBufferFlowState {
  const factory SignBufferFlowState.idle() = SignBufferFlowStateIdle;

  const factory SignBufferFlowState.signing() = SignBufferFlowStateSigning;

  const factory SignBufferFlowState.signed({
    required Uint8List signature,
    required Uint8List publicKey,
  }) = SignBufferFlowStateSigned;

  const factory SignBufferFlowState.error(String message) =
      SignBufferFlowStateError;
}
