import 'package:defy/features/shared/data/sources/remote/user_wallet_nft_remote_source.dart';
import 'package:defy/features/shared/domain/entities/user_wallet_nft.dart';
import 'package:defy/features/shared/domain/repositories/user_wallet_nft_repository.dart';

class UserWalletNFTRepositoryImplementation implements UserWalletNFTRepository {
  final UserWalletNFTRemoteSource _remoteDataSource;
  UserWalletNFTRepositoryImplementation(this._remoteDataSource);
  @override
  Future<List<UserWalletNFT>?>  fetchUserWalletNFTs(String ownerAddress) async {
    final response = await _remoteDataSource.fetchUserWalletNFTs(ownerAddress);
    final walletNFTs = response?.map((nft) => nft.toDomain()).toList();
    return walletNFTs;
  }
}