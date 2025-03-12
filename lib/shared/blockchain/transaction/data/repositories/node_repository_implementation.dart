// import 'dart:typed_data';

// import 'package:dio/dio.dart';
// import 'package:retrofit/dio.dart';

// import '../../../account/domain/entities/account_address.dart';
// import '../../domain/entities/account_data.dart';
// import '../../domain/entities/gas_price_estimate.dart';
// import '../../domain/entities/ledger_info.dart';
// import '../../domain/entities/transaction.dart';
// import '../../domain/repositories/node_repository.dart';
// import '../models/local/account_data_local_model.dart';
// import '../models/remote/account_data_remote_model.dart';
// import '../models/remote/gas_price_estimate_remote_model.dart';
// import '../models/remote/ledger_info_remote_model.dart';
// import '../models/remote/transaction_remote_model.dart';
// import '../sources/local/account_data_local_data_source.dart';
// import '../sources/remote/account_data_remote_data_source.dart';
// import '../sources/remote/gas_price_estimate_remote_data_source.dart';
// import '../sources/remote/ledger_info_remote_data_source.dart';
// import '../sources/remote/transaction_simulation_remote_data_source.dart';
// import '../sources/remote/transaction_submission_remote_data_source.dart';

// class NodeRepository implements INodeRepository {
//   NodeRepository({
//     required AccountDataLocalDataSource accountDataLocalSource,
//     required AccountDataRemoteDataSource accountDataRemoteSource,
//     required LedgerInfoRemoteDataSource ledgerInfoRemoteSource,
//     required GasPriceEstimateRemoteDataSource gasPriceEstimateRemoteSource,
//     required TransactionSimulationRemoteDataSource
//         transactionSimulationRemoteSource,
//     required TransactionSubmissionRemoteDataSource
//         transactionSubmissionRemoteSource,
//   })  : _accountDataLocalSource = accountDataLocalSource,
//         _accountDataRemoteSource = accountDataRemoteSource,
//         _ledgerInfoRemoteSource = ledgerInfoRemoteSource,
//         _gasPriceEstimateRemoteSource = gasPriceEstimateRemoteSource,
//         _transactionSimulationRemoteSource = transactionSimulationRemoteSource,
//         _transactionSubmissionRemoteSource = transactionSubmissionRemoteSource;

//   final AccountDataLocalDataSource _accountDataLocalSource;
//   final AccountDataRemoteDataSource _accountDataRemoteSource;
//   final LedgerInfoRemoteDataSource _ledgerInfoRemoteSource;
//   final GasPriceEstimateRemoteDataSource _gasPriceEstimateRemoteSource;
//   final TransactionSimulationRemoteDataSource
//       _transactionSimulationRemoteSource;
//   final TransactionSubmissionRemoteDataSource
//       _transactionSubmissionRemoteSource;

//   @override
//   Future<AccountData> fetchAccountData({
//     required AccountAddress accountAddress,
//     BigInt? ledgerVersion,
//   }) async {
//     try {
//       final HttpResponse<AccountDataRemoteModel> response =
//           await _accountDataRemoteSource.call(
//         accountAddress: accountAddress.toString(),
//         ledgerVersion: ledgerVersion?.toString(),
//       );

//       return response.data.toDomain();
//     } on DioException catch (e) {
//       throw StateError('Failed to get account data: ${e.message}');
//     } catch (e) {
//       throw StateError('Unexpected error getting account data: $e');
//     }
//   }

//   @override
//   Future<void> saveAccountData({
//     required AccountAddress accountAddress,
//     required AccountData data,
//   }) async {
//     _accountDataLocalSource.store(
//       accountAddress: accountAddress.toBytes(),
//       authenticationKey: data.authenticationKey.toBytes(),
//       sequenceNumber: data.sequenceNumber.toString(),
//     );
//   }

//   @override
//   Future<AccountData?> getLocalAccountData(
//     AccountAddress accountAddress,
//   ) async {
//     final AccountDataLocalModel? model = _accountDataLocalSource.getByAddress(
//       accountAddress: accountAddress.toBytes(),
//     );
//     return model?.toDomain();
//   }

//   @override
//   Future<List<(AccountAddress, AccountData)>> getAllLocalAccountData() async =>
//       _accountDataLocalSource
//           .getAll()
//           .map(
//             (AccountDataLocalModel model) =>
//                 (AccountAddress(bytes: model.accountAddress), model.toDomain()),
//           )
//           .toList();

//   @override
//   Future<LedgerInfo> fetchLedgerInfo() async {
//     try {
//       final HttpResponse<LedgerInfoRemoteModel> response =
//           await _ledgerInfoRemoteSource.call();

//       return response.data.toDomain();
//     } on DioException catch (e) {
//       throw StateError('Failed to get ledger info: ${e.message}');
//     } catch (e) {
//       throw StateError('Unexpected error getting ledger info: $e');
//     }
//   }

//   @override
//   Future<GasPriceEstimate> fetchGasPriceEstimate() async {
//     try {
//       final HttpResponse<GasPriceEstimateRemoteModel> response =
//           await _gasPriceEstimateRemoteSource.call();

//       return response.data.toDomain();
//     } on DioException catch (e) {
//       throw StateError('Failed to estimate gas price: ${e.message}');
//     } catch (e) {
//       throw StateError('Unexpected error estimating gas price: $e');
//     }
//   }

//   @override
//   Future<UserTransaction> simulateTransaction({
//     required Uint8List signedTransaction,
//   }) async {
//     try {
//       final HttpResponse<TransactionRemoteModel> response =
//           await _transactionSimulationRemoteSource.call(
//         signedTxn: signedTransaction,
//         estimateGasUnitPrice: true,
//         estimateMaxGasAmount: true,
//       );

//       return response.data.toDomain() as UserTransaction;
//     } on DioException catch (e) {
//       throw StateError('Failed to simulate transaction: ${e.message}');
//     } catch (e) {
//       throw StateError('Unexpected error simulating transaction: $e');
//     }
//   }

//   @override
//   Future<PendingTransaction> submitTransaction({
//     required Uint8List signedTransaction,
//   }) async {
//     try {
//       final HttpResponse<TransactionRemoteModel> response =
//           await _transactionSubmissionRemoteSource.call(
//         signedTxn: signedTransaction,
//       );
//       return response.data.toDomain() as PendingTransaction;
//     } on DioException catch (e) {
//       throw StateError('Failed to submit transaction: ${e.message}');
//     } catch (e) {
//       throw StateError('Unexpected error submit transaction: $e');
//     }
//   }
// }
