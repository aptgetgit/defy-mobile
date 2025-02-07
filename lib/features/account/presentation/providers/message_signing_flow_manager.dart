import 'dart:typed_data';

import 'package:ed25519_edwards/ed25519_edwards.dart' as ed25519;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/account_address.dart';
import '../states/message_signing_flow_state.dart';
import 'account_usecase_provider.dart';

part 'generated/message_signing_flow_manager.g.dart';

@Riverpod()
class MessageSigningFlowManager extends _$MessageSigningFlowManager {
  @override
  MessageSigningFlowState build() => const MessageSigningFlowState.initial();

  Future<void> signMessage({
    required AccountAddress accountAddress,
    required Uint8List message,
  }) async {
    state = const MessageSigningFlowState.signing();

    try {
      final Uint8List privateKey = await ref
          .read(revealAccountPrivateKeyUseCaseProvider)
          .call(accountAddress: accountAddress);

      final ed25519.PrivateKey nPrivateKey = ed25519.newKeyFromSeed(privateKey);

      final Uint8List signature = ed25519.sign(nPrivateKey, message);

      final ed25519.PublicKey publicKey = ed25519.public(nPrivateKey);
      // final AptosAccount? account = await ref
      //     .read(getAptosAccountUseCaseProvider)
      //     .call(accountAddress: accountAddress);

      // if (account == null) {
      //   throw StateError('Account not found');
      // }

      // final signature = await ref
      //     .read(signMessageUseCaseProvider)
      //     .call(
      //       message: message,
      //       privateKey: privateKey,
      //     );

      state = MessageSigningFlowState.completed(
        signature: signature,
        publicKey: Uint8List.fromList(publicKey.bytes),
      );
    } on Exception catch (e) {
      state = MessageSigningFlowState.failed(error: e.toString());
      rethrow;
    }
  }

  void reset() {
    state = const MessageSigningFlowState.initial();
  }
}
