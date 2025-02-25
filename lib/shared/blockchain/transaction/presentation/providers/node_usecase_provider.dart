import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../core/di/providers/network/base_dio_service_provider.dart';
import '../../../../../core/di/providers/services/object_box_service_provider.dart';
import '../../data/repositories/node_repository_implementation.dart';
import '../../data/sources/local/account_data_local_data_source.dart';
import '../../data/sources/remote/account_data_remote_data_source.dart';
import '../../data/sources/remote/gas_price_estimate_remote_data_source.dart';
import '../../data/sources/remote/ledger_info_remote_data_source.dart';
import '../../data/sources/remote/transaction_simulation_remote_data_source.dart';
import '../../data/sources/remote/transaction_submission_remote_data_source.dart';
import '../../domain/usecases/node_usecase.dart';

part 'generated/node_usecase_provider.g.dart';

@riverpod
NodeRepository nodeRepository(Ref ref) {
  final Dio baseDio = ref.read(baseDioServiceProvider);
  final Store objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final AccountDataLocalDataSource accountDataLocalSource =
      AccountDataLocalDataSource(box: objectBoxStore.box());

  return NodeRepository(
    accountDataLocalSource: accountDataLocalSource,
    accountDataRemoteSource: AccountDataRemoteDataSource(baseDio),
    ledgerInfoRemoteSource: LedgerInfoRemoteDataSource(baseDio),
    gasPriceEstimateRemoteSource: GasPriceEstimateRemoteDataSource(baseDio),
    transactionSimulationRemoteSource:
        TransactionSimulationRemoteDataSource(baseDio),
    transactionSubmissionRemoteSource:
        TransactionSubmissionRemoteDataSource(baseDio),
  );
}

@riverpod
FetchLedgerInfoUseCase getLedgerInfoUseCase(Ref ref) =>
    FetchLedgerInfoUseCase(repository: ref.read(nodeRepositoryProvider));

@riverpod
FetchGasUnitPriceEstimateUseCase estimateGasUnitPriceUseCase(Ref ref) =>
    FetchGasUnitPriceEstimateUseCase(
      repository: ref.read(nodeRepositoryProvider),
    );

@riverpod
FetchAccountDataUseCase getAccountData(Ref ref) =>
    FetchAccountDataUseCase(repository: ref.read(nodeRepositoryProvider));
