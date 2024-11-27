import 'package:defy/features/blockchain_account/data/repositories/blockchain_account_repository_implementation.dart';
import 'package:defy/features/blockchain_account/domain/entities/blockchain_account.dart';
import 'package:defy/features/blockchain_account/presentation/providers/blockchain_account_usecase_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/blockchain_account_notifier_provider.g.dart';

@riverpod
class BlockchainAccountNotifier extends _$BlockchainAccountNotifier {
  late final BlockchainAccountRepository _repository;

  @override
  FutureOr<List<BlockchainAccount>> build() {
    _repository = ref.watch(blockchainAccountRepositoryProvider);
    return _fetchBlockchainAccounts();
  }

  Future<List<BlockchainAccount>> _fetchBlockchainAccounts() async {
    List<BlockchainAccount> localData =
        _repository.listLocalBlockchainAccounts();
    state = AsyncData(localData);

    try {
      await _repository.syncBlockchainAccounts();
      List<BlockchainAccount> updatedData =
          _repository.listLocalBlockchainAccounts();

      if (!listEquals(localData, updatedData)) {
        state = AsyncData(updatedData);
        localData = updatedData;
      }
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
    return localData;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _fetchBlockchainAccounts());
  }
}
