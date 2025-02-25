import 'dart:typed_data';

import '../../../account/domain/entities/account_address.dart';

abstract class ITransactionPayloadRepository {
  Uint8List createCoinTransferPayload({
    required AccountAddress receiverAddress,
    required String coinType,
    required BigInt amount,
  });
}
