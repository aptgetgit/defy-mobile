// import 'package:freezed_annotation/freezed_annotation.dart';
// import '../../../domain/entities/transaction.dart';

// part 'generated/transaction_remote_model.freezed.dart';
// part 'generated/transaction_remote_model.g.dart';

// @Freezed(unionKey: 'type', fromJson: true)
// sealed class TransactionRemoteModel with _$TransactionRemoteModel {
//   factory TransactionRemoteModel.fromDomain(Transaction transaction) =>
//       switch (transaction) {
//         final PendingTransaction pending => TransactionRemoteModel.pending(
//             hash: pending.hash,
//             sender: pending.sender,
//             sequenceNumber: pending.sequenceNumber.toString(),
//             maxGasAmount: pending.maxGasAmount.toString(),
//             gasUnitPrice: pending.gasUnitPrice.toString(),
//             expirationTimestampSecs: pending.expirationTimestampSecs.toString(),
//           ),
//         final UserTransaction user => TransactionRemoteModel.user(
//             hash: user.hash,
//             success: user.success,
//             gasUsed: user.gasUsed.toString(),
//             vmStatus: user.vmStatus,
//             maxGasAmount: user.maxGasAmount.toString(),
//             gasUnitPrice: user.gasUnitPrice.toString(),
//           ),
//       };
//   @FreezedUnionValue('pending_transaction')
//   const factory TransactionRemoteModel.pending({
//     required String hash,
//     required String sender,
//     required String sequenceNumber,
//     required String maxGasAmount,
//     required String gasUnitPrice,
//     required String expirationTimestampSecs,
//   }) = PendingTransactionRemoteModel;

//   @FreezedUnionValue('user_transaction')
//   const factory TransactionRemoteModel.user({
//     required String hash,
//     required bool success,
//     required String gasUsed,
//     required String vmStatus,
//     required String maxGasAmount,
//     required String gasUnitPrice,
//   }) = UserTransactionRemoteModel;

//   factory TransactionRemoteModel.fromJson(Map<String, dynamic> json) =>
//       _$TransactionRemoteModelFromJson(json);

//   const TransactionRemoteModel._();

//   Transaction toDomain() => switch (this) {
//         final PendingTransactionRemoteModel pending => Transaction.pending(
//             hash: pending.hash,
//             sender: pending.sender,
//             sequenceNumber: BigInt.parse(pending.sequenceNumber),
//             maxGasAmount: BigInt.parse(pending.maxGasAmount),
//             gasUnitPrice: BigInt.parse(pending.gasUnitPrice),
//             expirationTimestampSecs:
//                 BigInt.parse(pending.expirationTimestampSecs),
//           ),
//         final UserTransactionRemoteModel user => Transaction.user(
//             hash: user.hash,
//             success: user.success,
//             gasUsed: BigInt.parse(user.gasUsed),
//             vmStatus: user.vmStatus,
//             maxGasAmount: BigInt.parse(user.maxGasAmount),
//             gasUnitPrice: BigInt.parse(user.gasUnitPrice),
//           ),
//       };
// }
