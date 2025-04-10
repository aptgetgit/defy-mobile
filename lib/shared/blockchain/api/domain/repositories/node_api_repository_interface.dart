import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../account/domain/entities/account_address.dart';
import '../entities/account_data.dart';
import '../entities/gas_price_estimate.dart';
import '../entities/ledger_info.dart';

abstract class INodeApiRepository {
  TaskEither<ExceptionWithStackTrace, AccountData> fetchAccountData({
    required AccountAddress accountAddress,
    required Option<BigInt> ledgerVersion,
  });

  TaskEither<ExceptionWithStackTrace, LedgerInfo> fetchLedgerInfo();

  TaskEither<ExceptionWithStackTrace, GasPriceEstimate> fetchGasPriceEstimate();
}
