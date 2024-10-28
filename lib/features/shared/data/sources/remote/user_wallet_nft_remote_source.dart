
import 'package:defy/features/shared/data/models/user_wallet_assets/user_wallet_nft_remote_model.dart';

abstract class UserWalletNFTRemoteSource {
  Future<List<UserWalletNFTRemoteModel>?> fetchUserWalletNFTs(String ownerAddress);
}

class UserWalletNFTRemoteSourceImpl implements UserWalletNFTRemoteSource {
  @override
  Future<List<UserWalletNFTRemoteModel>?> fetchUserWalletNFTs(String ownerAddress) {
    // TODO: implement fetchUserWalletNFTs
    throw UnimplementedError();
  }

}


// class CoinMetaDataRemoteImpl implements CoinMetaDataRemote {
//   @override
//   Future<List<CoinMetaDataModel>?> getCoinMetaData(GraphQLClient defyClient, List<String> coinIdList) async {
//     final QueryOptions options = QueryOptions(
//     document: documentNodeQueryFetchCoinMetadata,
//     variables: {
//       "coin_id_list": coinIdList,
//     },
//   );
//   final QueryResult result = await defyClient.query(options);

//   var responseBody = result.data;
//   if (responseBody != null) {
//     final List<CoinMetaDataModel> coinMetaData = [];
//     for (int i = 0; i < responseBody['coins'].length; i++) {
//       final coinMetaDataModel =
//           CoinMetaDataModel.fromJson(responseBody['coins'][i]);
//       coinMetaData.add(coinMetaDataModel);
//     }
//     return coinMetaData;
//   } else {
//     return null;
//   }
//   }
// }