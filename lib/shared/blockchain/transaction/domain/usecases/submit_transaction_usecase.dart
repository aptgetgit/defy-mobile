// import 'dart:typed_data';

// import '../entities/transaction.dart';
// import '../repositories/node_repository.dart';

// class SubmitTransactionUseCase {
//   SubmitTransactionUseCase({
//     required INodeRepository nodeRepository,
//   }) : _nodeRepository = nodeRepository;

//   final INodeRepository _nodeRepository;

//   Future<PendingTransaction> call({
//     required Uint8List signedTransaction,
//   }) async =>
//       _nodeRepository.submitTransaction(
//         signedTransaction: signedTransaction,
//       );
// }
