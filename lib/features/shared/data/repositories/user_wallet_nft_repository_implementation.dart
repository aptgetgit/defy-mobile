import 'package:defy/features/shared/data/sources/remote/user_wallet_nft_remote_source.dart';
import 'package:defy/features/shared/domain/entities/user_wallet_nft.dart';
import 'package:defy/features/shared/domain/repositories/user_wallet_nft_repository.dart';

class UserWalletNFTRepositoryImplementation implements UserWalletNFTRepository {
  final UserWalletNFTRemoteSource _remoteDataSource;
  UserWalletNFTRepositoryImplementation(this._remoteDataSource);
  @override
  Future<List<List<UserWalletNFT>?>?>  fetchUserWalletNFTs(String ownerAddress) async {
    final response = await _remoteDataSource.fetchUserWalletNFTs(ownerAddress);
    final walletNFTs = response?.map((nft) => nft.toDomain()).toList();
   if(walletNFTs != null){
    final Map<String,List<UserWalletNFT>> walletHoldingsByCollection = {};
    final List<UserWalletNFT> stakedNfts = [];
   for(int i=0;i<walletNFTs.length;i++){
    final nft = walletNFTs[i];
    final collectionId = nft.collection?.id;
    if(collectionId != null){
      if(walletHoldingsByCollection.containsKey(collectionId)){
      walletHoldingsByCollection[collectionId]!.add(nft);
    } else {
      if(nft.nft!.staked!){
        stakedNfts.add(walletNFTs[i]);
      } else if(!nft.nft!.staked!) {
        walletHoldingsByCollection[collectionId] = [nft];
     }
    } 
    }
   }
    return walletHoldingsByCollection.values.toList();
   } else {
     return null;
   }
  }
}