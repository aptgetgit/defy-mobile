import 'package:defy/features/marketplace/domain/entities/wallet_inventory_entity.dart';

abstract class WalletInventoryRepository {
  Future<WalletInventoryEntity?> getWalletInventory({
    required String owner,
  });
}