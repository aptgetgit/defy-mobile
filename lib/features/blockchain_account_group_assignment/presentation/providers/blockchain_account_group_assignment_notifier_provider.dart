import 'package:defy/features/blockchain_account_group/presentation/providers/blockchain_account_group_notifier_provider.dart';
import 'package:defy/features/blockchain_account_group_assignment/domain/entities/blockchain_account_group_assignment.dart';
import 'package:defy/features/blockchain_account_group_assignment/presentation/providers/blockchain_account_group_assignment_usecase_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/blockchain_account_group_assignment_notifier_provider.g.dart';

@riverpod
class BlockchainAccountGroupAssignmentNotifier
    extends _$BlockchainAccountGroupAssignmentNotifier {
  @override
  FutureOr<List<BlockchainAccountGroupAssignment>> build() {
    final groupsState = ref.watch(blockchainAccountGroupNotifierProvider);

    return groupsState.when(
      data: (groups) =>
          _fetchAndSyncAssignments(groups.map((group) => group.id).toList()),
      loading: () => _fetchLocalAssignments(),
      error: (_, __) => _fetchLocalAssignments(),
    );
  }

  Future<List<BlockchainAccountGroupAssignment>> _fetchAndSyncAssignments(
      List<String> groupIds) async {
    List<BlockchainAccountGroupAssignment> localData = _fetchLocalAssignments();
    state = AsyncData(localData);

    try {
      await Future.wait(groupIds.map((groupId) => ref
          .read(blockchainAccountGroupAssignmentRepositoryProvider)
          .syncBlockchainAccountGroupAssignments(groupId)));

      List<BlockchainAccountGroupAssignment> updatedData =
          _fetchLocalAssignments();
      if (!listEquals(localData, updatedData)) {
        state = AsyncData(updatedData);
        localData = updatedData;
      }
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }

    return localData;
  }

  List<BlockchainAccountGroupAssignment> _fetchLocalAssignments() {
    return ref
        .read(blockchainAccountGroupAssignmentRepositoryProvider)
        .listLocalBlockchainAccountGroupAssignments();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    final groupsState = ref.read(blockchainAccountGroupNotifierProvider);
    final groupIds = groupsState.whenOrNull(
          data: (groups) => groups.map((group) => group.id).toList(),
        ) ??
        [];
    state = AsyncData(await _fetchAndSyncAssignments(groupIds));
  }
}
