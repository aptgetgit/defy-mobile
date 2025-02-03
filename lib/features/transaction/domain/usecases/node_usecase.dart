import '../../../account/domain/entities/account_address.dart';
import '../../data/repositories/node_repository_implementation.dart';
import '../entities/account_data.dart';
import '../entities/gas_price_estimate.dart';
import '../entities/ledger_info.dart';

class FetchLedgerInfoUseCase {
  FetchLedgerInfoUseCase({required NodeRepository repository})
      : _repository = repository;

  final NodeRepository _repository;

  Future<LedgerInfo> call() => _repository.fetchLedgerInfo();
}

class FetchGasUnitPriceEstimateUseCase {
  FetchGasUnitPriceEstimateUseCase({required NodeRepository repository})
      : _repository = repository;

  final NodeRepository _repository;

  Future<GasPriceEstimate> call() => _repository.fetchGasPriceEstimate();
}

class FetchAccountDataUseCase {
  FetchAccountDataUseCase({required NodeRepository repository})
      : _repository = repository;

  final NodeRepository _repository;

  Future<AccountData> call({
    required AccountAddress accountAddress,
    BigInt? ledgerVersion,
  }) =>
      _repository.fetchAccountData(
        accountAddress: accountAddress,
        ledgerVersion: ledgerVersion,
      );
}
