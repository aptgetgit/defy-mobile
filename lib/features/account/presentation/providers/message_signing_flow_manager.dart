import 'dart:typed_data';
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
     final (Uint8List signature, Uint8List publicKey) = await ref
         .read(signMessageUseCaseProvider)
         .call(accountAddress: accountAddress, message: message);

     state = MessageSigningFlowState.completed(
       signature: signature,
       publicKey: publicKey,
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
