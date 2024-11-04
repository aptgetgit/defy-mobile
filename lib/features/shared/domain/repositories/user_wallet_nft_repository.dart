import 'package:defy/features/shared/domain/entities/user_wallet_nft.dart';

abstract class UserWalletNFTRepository {
  Future<List<List<UserWalletNFT>?>?>fetchUserWalletNFTs(String ownerAddress);
}