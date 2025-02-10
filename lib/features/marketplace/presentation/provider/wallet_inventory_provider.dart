import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/logging/app_logger.dart';
import '../../data/repository/wallet_inventory_repository_impl.dart';
import '../../data/sources/remote/wallet_inventory_remote.dart';
import '../../domain/entities/wallet_inventory_entity.dart';
import '../../domain/repository/wallet_invenotry_repository.dart';
import '../../domain/usecases/wallet_inventory_usecase.dart';
import 'tradeport_graphql_provider.dart';

part 'generated/wallet_inventory_provider.g.dart';

@riverpod
WalletInventoryRemote walletInventoryRemote(Ref ref) {
  ref.watch(tradeportGraphQLClientProvider);
  return WalletInventoryRemoteImpl();
}

@riverpod
WalletInventoryRepository walletInventoryRepository(
    Ref ref,) {
  final WalletInventoryRemote walletInventoryRemote = ref.read(walletInventoryRemoteProvider);
  return WalletInventoryRepositoryImpl(
      walletInventoryRemote: walletInventoryRemote,);
}

@riverpod
WalletInventoryUseCase walletInventoryUseCase(Ref ref) {
  final WalletInventoryRepository walletInventoryRepository = ref.read(walletInventoryRepositoryProvider);
  return WalletInventoryUseCase(
      walletInventoryRepository: walletInventoryRepository,);
}

@riverpod
class WalletInventory extends _$WalletInventory {
  @override
  void build() {}

  Future<WalletInventoryEntity?> getWalletInventory({
    required String owner,
  }) async {
    try {
      AppLogger.debug(
          'WalletInventory: Fetching wallet inventory for owner: $owner',);
      final WalletInventoryEntity? walletInventory =
          await ref.read(walletInventoryUseCaseProvider).call(
                owner: owner,
              );
      if (walletInventory != null) {
        AppLogger.debug(
            'WalletInventory: Wallet inventory fetched successfully',);
        AppLogger.debug(
            'WalletInventory: Number of collections: ${walletInventory.aptos.collections.length}',);
      } else {
        AppLogger.debug('WalletInventory: Wallet inventory is null');
      }
      return walletInventory;
    } catch (e, stackTrace) {
      AppLogger.debug('WalletInventory: Error fetching wallet inventory: $e');
      AppLogger.debug('WalletInventory: Stack trace: $stackTrace');
      rethrow;
    }
  }
}

@riverpod
Future<WalletInventoryEntity?> walletInventoryData(
  Ref ref,
  String owner,
) async {
  try {
    AppLogger.debug('walletInventoryData: Fetching data for owner $owner');
    final WalletInventoryEntity? walletInventory = await ref
        .read(walletInventoryProvider.notifier)
        .getWalletInventory(owner: owner);
    if (walletInventory != null) {
      AppLogger.debug('walletInventoryData: Data fetched successfully');
      AppLogger.debug(
          'walletInventoryData: Number of collections: ${walletInventory.aptos.collections.length}',);
    } else {
      AppLogger.debug('walletInventoryData: Fetched data is null');
    }
    return walletInventory;
  } catch (e, stackTrace) {
    AppLogger.debug('walletInventoryData: Error fetching data: $e');
    AppLogger.debug('walletInventoryData: Stack trace: $stackTrace');
    rethrow;
  }
}
