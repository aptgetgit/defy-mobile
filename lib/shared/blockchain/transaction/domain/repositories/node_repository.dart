// import 'dart:typed_data';

// import '../../../account/domain/entities/account_address.dart';
// import '../entities/account_data.dart';
// import '../entities/gas_price_estimate.dart';
// import '../entities/ledger_info.dart';
// import '../entities/transaction.dart';

// abstract class INodeRepository {
//   Future<AccountData> fetchAccountData({
//     required AccountAddress accountAddress,
//     BigInt? ledgerVersion,
//   });

//   Future<void> saveAccountData({
//     required AccountAddress accountAddress,
//     required AccountData data,
//   });

//   Future<AccountData?> getLocalAccountData(AccountAddress accountAddress);

//   Future<List<(AccountAddress ,AccountData)>> getAllLocalAccountData();

//   Future<LedgerInfo> fetchLedgerInfo();

//   Future<GasPriceEstimate> fetchGasPriceEstimate();

//   Future<UserTransaction> simulateTransaction({
//     required Uint8List signedTransaction,
//   });

//   Future<PendingTransaction> submitTransaction({
//     required Uint8List signedTransaction,
//   });
// }
