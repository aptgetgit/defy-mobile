import 'package:defy/features/shared/domain/entities/blockchain_network.dart';
import 'package:defy/features/shared/domain/repositories/blockchain_network_repository.dart';
import 'package:defy/features/shared/presentation/providers/blockchain_network_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/blockchain_network_notifier_provider.g.dart';

@riverpod
class BlockchainNetworkNotifier extends _$BlockchainNetworkNotifier {
  late final BlockchainNetworkRepository _repository;

  @override
  FutureOr<List<BlockchainNetwork>> build() {
    _repository = ref.watch(blockchainNetworkRepositoryProvider);
    return _fetchNetworks();
  }

  Future<List<BlockchainNetwork>> _fetchNetworks() async {
    List<BlockchainNetwork> localData =
        _repository.listLocalBlockchainNetworks();
    state = AsyncData(localData);

    try {
      await _repository.syncBlockchainNetworks();
      List<BlockchainNetwork> updatedData =
          _repository.listLocalBlockchainNetworks();

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
    state = AsyncData(await _fetchNetworks());
  }
}
