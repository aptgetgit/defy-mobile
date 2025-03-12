// import 'dart:typed_data';
// import 'package:aptos_dart/aptos.dart' as aptos;

// import '../../../account/domain/entities/account_address.dart';
// import '../../domain/repositories/transaction_builder_repository.dart';

// class TransactionBuilderRepository implements ITransactionBuilderRepository {
//   @override
//   Uint8List generateSigningMessage({
//     required AccountAddress sender,
//     required BigInt sequenceNumber,
//     required Uint8List entryFunction,
//     required BigInt maxGasAmount,
//     required BigInt gasUnitPrice,
//     required BigInt expirationTimestampSecs,
//     required int chainId,
//   }) {
//     final aptos.Deserializer deserializer = aptos.Deserializer(entryFunction);

//     final aptos.TransactionPayloadEntryFunction payload =
//         aptos.TransactionPayloadEntryFunction.load(deserializer);

//     final aptos.RawTransaction rawTransaction = aptos.RawTransaction(
//       aptos.AccountAddress(sender.toBytes()),
//       sequenceNumber,
//       payload,
//       maxGasAmount,
//       gasUnitPrice,
//       expirationTimestampSecs,
//       aptos.ChainId(chainId),
//     );

//     return aptos.TransactionBuilder.getSigningMessage(rawTransaction);
//   }
// }
