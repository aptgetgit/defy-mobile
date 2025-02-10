import 'package:defy/features/shared/data/repositories/user_blockchain_account_group_repository_implementation.dart';
import 'package:defy/features/shared/domain/entities/user_blockchain_account_group.dart';
import 'package:defy/features/shared/presentation/providers/user_blockchain_account_group_usecase_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/user_blockchain_account_group_notifier_provider.g.dart';

@riverpod
class UserBlockchainAccountGroupNotifier extends _$UserBlockchainAccountGroupNotifier {
  late final UserBlockchainAccountGroupRepository _repository;

  @override
  FutureOr<List<UserBlockchainAccountGroup>> build() {
    _repository = ref.watch(userBlockchainAccountGroupRepositoryProvider);
    return _fetchUserBlockchainAccountGroups();
  }

  Future<List<UserBlockchainAccountGroup>> _fetchUserBlockchainAccountGroups() async {
    List<UserBlockchainAccountGroup> localData =
        _repository.listLocalUserBlockchainAccountGroups();
    state = AsyncData(localData);

    try {
      await _repository.syncUserBlockchainAccountGroups();
      List<UserBlockchainAccountGroup> updatedData =
          _repository.listLocalUserBlockchainAccountGroups();

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
    state = AsyncData(await _fetchUserBlockchainAccountGroups());
  }
}
