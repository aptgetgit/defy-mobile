import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/ledger_info.dart';

part 'generated/ledger_info_remote_model.freezed.dart';
part 'generated/ledger_info_remote_model.g.dart';

@Freezed(fromJson: true)
@JsonSerializable(fieldRename: FieldRename.snake)
class LedgerInfoRemoteModel with _$LedgerInfoRemoteModel {
  const factory LedgerInfoRemoteModel({
    required int chainId,
    required String epoch,
    required String ledgerVersion,
    required String oldestLedgerVersion,
    required String ledgerTimestamp,
    required String oldestBlockHeight,
    required String blockHeight,
    required Option<String> gitHash,
  }) = _LedgerInfoRemoteModel;

  factory LedgerInfoRemoteModel.fromDomain(LedgerInfo ledgerInfo) => LedgerInfoRemoteModel(
        chainId: ledgerInfo.chainId,
        epoch: ledgerInfo.epoch.toString(),
        ledgerVersion: ledgerInfo.ledgerVersion.toString(),
        oldestLedgerVersion: ledgerInfo.oldestLedgerVersion.toString(),
        ledgerTimestamp: ledgerInfo.ledgerTimestamp.toString(),
        oldestBlockHeight: ledgerInfo.oldestBlockHeight.toString(),
        blockHeight: ledgerInfo.blockHeight.toString(),
        gitHash: ledgerInfo.gitHash,
      );

  factory LedgerInfoRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$LedgerInfoRemoteModelFromJson(json);

  const LedgerInfoRemoteModel._();

  LedgerInfo toDomain() {
    final BigInt parsedEpoch = BigInt.parse(epoch);
    final BigInt parsedLedgerVersion = BigInt.parse(ledgerVersion);
    final BigInt parsedOldestLedgerVersion = BigInt.parse(oldestLedgerVersion);
    final BigInt parsedLedgerTimestamp = BigInt.parse(ledgerTimestamp);
    final BigInt parsedOldestBlockHeight = BigInt.parse(oldestBlockHeight);
    final BigInt parsedBlockHeight = BigInt.parse(blockHeight);
    return LedgerInfo(
      chainId: chainId,
      epoch: parsedEpoch,
      ledgerVersion: parsedLedgerVersion,
      oldestLedgerVersion: parsedOldestLedgerVersion,
      ledgerTimestamp: parsedLedgerTimestamp,
      oldestBlockHeight: parsedOldestBlockHeight,
      blockHeight: parsedBlockHeight,
      gitHash: gitHash,
    );
  }
}
