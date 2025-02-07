import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/message_signing_flow_state.freezed.dart';

@freezed
class MessageSigningFlowState with _$MessageSigningFlowState {
  const factory MessageSigningFlowState.initial() = MessageSigningFlowInitial;
  
  const factory MessageSigningFlowState.signing() = MessageSigningFlowSigning;
  
  const factory MessageSigningFlowState.completed({
    required Uint8List signature,
    required Uint8List publicKey,
  }) = MessageSigningFlowCompleted;
  
  const factory MessageSigningFlowState.failed({
    required String error,
  }) = MessageSigningFlowFailed;
}
