import 'package:fpdart/fpdart.dart';
import 'package:retrofit/dio.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../account/domain/entities/account_address.dart';
import '../../../account/domain/entities/authentication_key.dart';
import '../../domain/entities/account_data.dart';
import '../../domain/entities/gas_price_estimate.dart';
import '../../domain/entities/ledger_info.dart';
import '../../domain/repositories/node_api_repository_interface.dart';
import '../models/remote/account_data_remote_model.dart';
import '../models/remote/gas_price_estimate_remote_model.dart';
import '../models/remote/ledger_info_remote_model.dart';
import '../sources/remote/node_api_remote_data_source.dart';

class NodeApiRepository implements INodeApiRepository {
  NodeApiRepository({required NodeApiRemoteDataSource remoteSource})
    : _remoteSource = remoteSource;

  final NodeApiRemoteDataSource _remoteSource;

  @override
  TaskEither<ExceptionWithStackTrace, AccountData> fetchAccountData({
    required AccountAddress accountAddress,
    required Option<BigInt> ledgerVersion,
  }) => TaskEither<ExceptionWithStackTrace, AccountData>(() async {
    try {
      final HttpResponse<AccountDataRemoteModel> response = await _remoteSource
          .getAccountData(
            accountAddress: accountAddress.toString(),
            ledgerVersion:
                ledgerVersion.map((BigInt v) => v.toString()).toNullable(),
          );

      if (response.response.statusCode == 400) {
        if (response.response.data['error_code'] == 'account_not_found') {
          return right(
            AccountData(
              authenticationKey: AuthenticationKey(
                bytes: accountAddress.toBytes(),
              ),
              sequenceNumber: BigInt.zero,
            ),
          );
        }
      }

      return right(response.data.toDomain());
    } on Exception catch (error, stackTrace) {
      return left(ExceptionWithStackTrace(error, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, LedgerInfo> fetchLedgerInfo() =>
      TaskEither<ExceptionWithStackTrace, LedgerInfo>(() async {
        try {
          final HttpResponse<LedgerInfoRemoteModel> response =
              await _remoteSource.getLedgerInfo();

          return right(response.data.toDomain());
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });

  @override
  TaskEither<ExceptionWithStackTrace, GasPriceEstimate>
  fetchGasPriceEstimate() =>
      TaskEither<ExceptionWithStackTrace, GasPriceEstimate>(() async {
        try {
          final HttpResponse<GasPriceEstimateRemoteModel> response =
              await _remoteSource.getGasPriceEstimate();

          return right(response.data.toDomain());
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });
}
