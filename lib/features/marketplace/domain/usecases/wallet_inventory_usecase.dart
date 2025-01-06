import 'package:defy/features/marketplace/domain/entities/wallet_inventory_entity.dart';
import 'package:defy/features/marketplace/domain/repository/wallet_invenotry_repository.dart';

import '../../../../core/logging/app_logger.dart';



class WalletInventoryUseCase {
  final WalletInventoryRepository walletInventoryRepository;

  WalletInventoryUseCase({required this.walletInventoryRepository});

  Future<WalletInventoryEntity?> call({
    required String owner,
  }) async {
    AppLogger.debug('WalletInventoryUseCase: Calling use case for owner $owner');
    final result = await walletInventoryRepository.getWalletInventory(owner: owner);
    if (result != null) {
      AppLogger.debug('WalletInventoryUseCase: Data retrieved successfully');
    } else {
      AppLogger.debug('WalletInventoryUseCase: No data retrieved');
    }
    return result;
  }
}