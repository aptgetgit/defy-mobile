import 'package:defy/features/shared/domain/entities/user_blockchain_account_group_assignment.dart';
import 'package:defy/features/shared/domain/repositories/user_blockchain_account_group_assignment_repository.dart';
import 'package:defy/features/shared/presentation/providers/user_blockchain_account_group_assignment_provider.dart';
import 'package:defy/features/shared/presentation/providers/user_blockchain_account_group_notifier_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/user_blockchain_account_group_assignment_notifier_provider.g.dart';


@riverpod
class UserBlockchainAccountGroupAssignmentNotifier extends _$UserBlockchainAccountGroupAssignmentNotifier {
  late final UserBlockchainAccountGroupAssignmentRepository _repository;

  @override
  FutureOr<List<UserBlockchainAccountGroupAssignment>> build() {
    _repository = ref.watch(userBlockchainAccountGroupAssignmentRepositoryProvider);
    
    final groupsState = ref.watch(userBlockchainAccountGroupNotifierProvider);
    
    return groupsState.when(
      data: (groups) => _fetchAndSyncAssignments(groups.map((group) => group.id).toList()),
      loading: () => _fetchLocalAssignments(),
      error: (_, __) => _fetchLocalAssignments(),
    );
  }

  Future<List<UserBlockchainAccountGroupAssignment>> _fetchAndSyncAssignments(List<String> groupIds) async {
    List<UserBlockchainAccountGroupAssignment> localData = _fetchLocalAssignments();
    state = AsyncData(localData);

    try {
      await Future.wait(groupIds.map((groupId) => 
        _repository.syncUserBlockchainAccountGroupAssignments(groupId)
      ));

      List<UserBlockchainAccountGroupAssignment> updatedData = _fetchLocalAssignments();
      if (!listEquals(localData, updatedData)) {
        state = AsyncData(updatedData);
        localData = updatedData;
      }
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }

    return localData;
  }

  List<UserBlockchainAccountGroupAssignment> _fetchLocalAssignments() {
    return _repository.listLocalUserBlockchainAccountGroupAssignments();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    final groupsState = ref.read(userBlockchainAccountGroupNotifierProvider);
    final groupIds = groupsState.whenOrNull(
      data: (groups) => groups.map((group) => group.id).toList(),
    ) ?? [];
    state = AsyncData(await _fetchAndSyncAssignments(groupIds));
  }
}