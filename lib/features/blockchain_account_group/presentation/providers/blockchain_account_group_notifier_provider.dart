import 'package:defy/features/blockchain_account_group/data/repositories/blockchain_account_group_repository_implementation.dart';
import 'package:defy/features/blockchain_account_group/domain/entities/blockchain_account_group.dart';
import 'package:defy/features/blockchain_account_group/presentation/providers/blockchain_account_group_usecase_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/blockchain_account_group_notifier_provider.g.dart';

@riverpod
class BlockchainAccountGroupNotifier extends _$BlockchainAccountGroupNotifier {
  late final BlockchainAccountGroupRepository _repository;

  @override
  FutureOr<List<BlockchainAccountGroup>> build() {
    _repository = ref.watch(blockchainAccountGroupRepositoryProvider);
    return _fetchBlockchainAccountGroups();
  }

  Future<List<BlockchainAccountGroup>> _fetchBlockchainAccountGroups() async {
    List<BlockchainAccountGroup> localData =
        _repository.listLocalBlockchainAccountGroups();
    state = AsyncData(localData);

    try {
      await _repository.syncBlockchainAccountGroups();
      List<BlockchainAccountGroup> updatedData =
          _repository.listLocalBlockchainAccountGroups();

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
    state = AsyncData(await _fetchBlockchainAccountGroups());
  }
}
