import 'dart:typed_data';

import '../../../account/domain/entities/account_address.dart';
import '../repositories/transaction_payload_repository.dart';

class CreateCoinTransferPayloadUseCase {
  CreateCoinTransferPayloadUseCase(
      {required ITransactionPayloadRepository repository})
      : _repository = repository;

  final ITransactionPayloadRepository _repository;

  Uint8List call({
    required AccountAddress receiverAddress,
    required String coinType,
    required BigInt amount,
  }) =>
      _repository.createCoinTransferPayload(
        receiverAddress: receiverAddress,
        coinType: coinType,
        amount: amount,
      );
}
