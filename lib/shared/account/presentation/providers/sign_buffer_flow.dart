import 'dart:typed_data';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/account_address.dart';
import '../states/sign_buffer_flow_state.dart';
import 'usecase_provider.dart';

part 'generated/sign_buffer_flow.g.dart';

@Riverpod()
class SignBufferFlow extends _$SignBufferFlow {
 @override
 SignBufferFlowState build() => const SignBufferFlowState.idle();

 Future<void> sign({
   required AccountAddress accountAddress,
   required Uint8List buffer,
 }) async {
   state = const SignBufferFlowState.signing();

   try {
     final (Uint8List signature, Uint8List publicKey) = await ref
         .read(signBufferUseCaseProvider)
         .call(accountAddress: accountAddress, buffer: buffer);

     state = SignBufferFlowState.signed(
       signature: signature,
       publicKey: publicKey,
     );
   } on Exception catch (e) {
     state = SignBufferFlowState.error(e.toString());
     rethrow;
   }
 }

 void reset() {
   state = const SignBufferFlowState.idle();
 }
}
