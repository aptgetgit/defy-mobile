// import 'dart:typed_data';

// import 'package:aptos_dart/aptos.dart' as aptos;

// import '../entities/transaction.dart';
// import '../repositories/node_repository.dart';

// class SimulateTransactionUseCase {
//   SimulateTransactionUseCase({
//     required INodeRepository nodeRepository,
//   }) : _nodeRepository = nodeRepository;

//   final INodeRepository _nodeRepository;

//   Future<UserTransaction> call({
//     required Uint8List rawTransaction,
//     required Uint8List publicKey,
//   }) async {
//     final aptos.RawTransaction transaction = aptos.RawTransaction.deserialize(
//       aptos.Deserializer(rawTransaction),
//     );

//     final aptos.SignedTransaction signedTxn = aptos.SignedTransaction(
//       transaction,
//       aptos.TransactionAuthenticatorEd25519(
//         aptos.Ed25519PublicKey(publicKey),
//         aptos.Ed25519Signature(Uint8List(64)),
//       ),
//     );

//     return _nodeRepository.simulateTransaction(
//       signedTransaction: aptos.bcsToBytes(signedTxn),
//     );
//   }
// }
