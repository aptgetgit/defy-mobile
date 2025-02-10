
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/marketplace/data/sources/remote/wallet_inventory_remote.dart';
import 'package:defy/features/marketplace/domain/entities/wallet_inventory_entity.dart';
import 'package:defy/features/marketplace/domain/repository/wallet_invenotry_repository.dart';


class WalletInventoryRepositoryImpl implements WalletInventoryRepository {
  final WalletInventoryRemote walletInventoryRemote;

  WalletInventoryRepositoryImpl({required this.walletInventoryRemote});

  @override
  Future<WalletInventoryEntity?> getWalletInventory({
    required String owner,
  }) async {
    try {
      AppLogger.debug('WalletInventoryRepositoryImpl: Fetching wallet inventory for owner $owner');
      final result = await walletInventoryRemote.getWalletInventory(owner: owner);
      if (result != null) {
        AppLogger.debug('WalletInventoryRepositoryImpl: Data fetched successfully');
        return result;
      } else {
        AppLogger.debug('WalletInventoryRepositoryImpl: No data fetched');
        return null;
      }
    } catch (e) {
      AppLogger.error('WalletInventoryRepositoryImpl: Error fetching wallet inventory', error: e);
      rethrow;
    }
  }
}