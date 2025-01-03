
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/marketplace/data/repository/wallet_inventory_repository_impl.dart';
import 'package:defy/features/marketplace/data/sources/remote/wallet_inventory_remote.dart';
import 'package:defy/features/marketplace/domain/repository/wallet_invenotry_repository.dart';
import 'package:defy/features/marketplace/domain/usecases/wallet_inventory_usecase.dart';
import 'package:defy/features/marketplace/presentation/provider/tradeport_graphql_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/wallet_inventory_entity.dart';

part 'generated/wallet_inventory_provider.g.dart';

@riverpod
WalletInventoryRemote walletInventoryRemote(WalletInventoryRemoteRef ref) {
  final client = ref.watch(tradeportGraphQLClientProvider);
  return WalletInventoryRemoteImpl(client);
}

@riverpod
WalletInventoryRepository walletInventoryRepository(
    WalletInventoryRepositoryRef ref) {
  final walletInventoryRemote = ref.read(walletInventoryRemoteProvider);
  return WalletInventoryRepositoryImpl(
      walletInventoryRemote: walletInventoryRemote);
}

@riverpod
WalletInventoryUseCase walletInventoryUseCase(WalletInventoryUseCaseRef ref) {
  final walletInventoryRepository = ref.read(walletInventoryRepositoryProvider);
  return WalletInventoryUseCase(
      walletInventoryRepository: walletInventoryRepository);
}

@riverpod
class WalletInventory extends _$WalletInventory {
  @override
  void build() {}

  Future<WalletInventoryEntity?> getWalletInventory({
    required String owner,
  }) async {
    try {
      AppLogger.debug('WalletInventory: Fetching wallet inventory for owner: $owner');
      final walletInventory =
          await ref.read(walletInventoryUseCaseProvider).call(
                owner: owner,
              );
      if (walletInventory != null) {
        AppLogger.debug('WalletInventory: Wallet inventory fetched successfully');
        AppLogger.debug(
            'WalletInventory: Number of collections: ${walletInventory.aptos.collections.length}');
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
  WalletInventoryDataRef ref,
  String owner,
) async {
  try {
    AppLogger.debug('walletInventoryData: Fetching data for owner $owner');
    final walletInventory = await ref
        .read(walletInventoryProvider.notifier)
        .getWalletInventory(owner: owner);
    if (walletInventory != null) {
      AppLogger.debug('walletInventoryData: Data fetched successfully');
      AppLogger.debug(
          'walletInventoryData: Number of collections: ${walletInventory.aptos.collections.length}');
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
