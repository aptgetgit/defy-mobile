import 'dart:typed_data';

import '../../../account/domain/entities/account_address.dart';

abstract class ITransactionBuilderRepository {
  Uint8List generateSigningMessage({
    required AccountAddress sender,
    required BigInt sequenceNumber,
    required Uint8List entryFunction,
    required BigInt maxGasAmount,
    required BigInt gasUnitPrice,
    required BigInt expirationTimestampSecs,
    required int chainId,
  });
}
