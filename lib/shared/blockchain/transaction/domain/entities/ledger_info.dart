import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/ledger_info.freezed.dart';

@freezed
class LedgerInfo with _$LedgerInfo {
  const factory LedgerInfo({
    required int chainId,
    required BigInt epoch,
    required BigInt ledgerVersion,
    required BigInt oldestLedgerVersion,
    required BigInt ledgerTimestamp,
    required BigInt oldestBlockHeight,
    required BigInt blockHeight,
    String? gitHash,
  }) = _LedgerInfo;
}
