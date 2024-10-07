import 'package:defy/features/shared/data/repositories/user_blockchain_account_repository_implementation.dart';
import 'package:defy/features/shared/domain/entities/user_blockchain_account.dart';
import 'package:defy/features/shared/presentation/providers/user_blockchain_account_usecase_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/user_blockchain_account_notifier_provider.g.dart';

@riverpod
class UserBlockchainAccountNotifier extends _$UserBlockchainAccountNotifier {
  late final UserBlockchainAccountRepository _repository;

  @override
  FutureOr<List<UserBlockchainAccount>> build() {
    _repository = ref.watch(userBlockchainAccountRepositoryProvider);
    return _fetchUserBlockchainAccounts();
  }

  Future<List<UserBlockchainAccount>> _fetchUserBlockchainAccounts() async {
    List<UserBlockchainAccount> localData =
        _repository.listLocalUserBlockchainAccounts();
    state = AsyncData(localData);

    try {
      await _repository.syncUserBlockchainAccounts();
      List<UserBlockchainAccount> updatedData =
          _repository.listLocalUserBlockchainAccounts();

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
    state = AsyncData(await _fetchUserBlockchainAccounts());
  }
}
