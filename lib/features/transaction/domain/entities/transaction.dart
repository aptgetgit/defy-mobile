import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/transaction.freezed.dart';

@freezed
sealed class Transaction with _$Transaction {
  const factory Transaction.pending({
    required String hash,
    required String sender,
    required BigInt sequenceNumber,
    required BigInt maxGasAmount,
    required BigInt gasUnitPrice,
    required BigInt expirationTimestampSecs,
  }) = PendingTransaction;

  const factory Transaction.user({
    required String hash,
    required bool success,
    required BigInt gasUsed,
    required String vmStatus,
    required BigInt maxGasAmount,
    required BigInt gasUnitPrice,
  }) = UserTransaction;
}
