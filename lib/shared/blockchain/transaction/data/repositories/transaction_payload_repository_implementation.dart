// import 'dart:typed_data';

// import 'package:aptos_dart/aptos.dart' as aptos;
// import '../../../account/domain/entities/account_address.dart';
// import '../../domain/repositories/transaction_payload_repository.dart';

// class TransactionPayloadRepository implements ITransactionPayloadRepository {
//   @override
//   Uint8List createCoinTransferPayload({
//     required AccountAddress receiverAddress,
//     required String coinType,
//     required BigInt amount,
//   }) {
//     final aptos.ModuleId moduleId = aptos.ModuleId(
//       aptos.AccountAddress.coreCodeAddress(),
//       aptos.Identifier('coin'),
//     );
//     final aptos.Identifier functionName = aptos.Identifier('transfer');

//     final aptos.StructTag structTag = aptos.StructTag.fromString(coinType);
//     final List<aptos.TypeTag> typeArgs = <aptos.TypeTag>[
//       aptos.TypeTagStruct(structTag),
//     ];

//     final List<Uint8List> args = <Uint8List>[
//       aptos.bcsToBytes(aptos.AccountAddress(receiverAddress.toBytes())),
//       aptos.bcsSerializeUint64(amount),
//     ];

//     final aptos.EntryFunction entryFunction = aptos.EntryFunction(
//       moduleId,
//       functionName,
//       typeArgs,
//       args,
//     );

//     return aptos.bcsToBytes(entryFunction);
//   }
// }
