
import 'dart:convert';

import 'package:defy/features/shared/data/models/wallet_assets/user_wallet_nft_remote_model.dart';
import 'package:http/http.dart' as http;

abstract class UserWalletNFTRemoteSource {
  Future<List<UserWalletNFTRemoteModel>?> fetchUserWalletNFTs(String ownerAddress);
}

class UserWalletNFTRemoteSourceImpl implements UserWalletNFTRemoteSource {
  @override
  Future<List<UserWalletNFTRemoteModel>?> fetchUserWalletNFTs(String ownerAddress) async {
    const url = 'https://api.indexer.xyz/graphql';
    final req = http.Request("POST", Uri.parse(url));
    final headers = {
      'content-type': 'application/json',
      'x-api-user': "Defy",
      'x-api-key': "s3Z2Xw1.17c86d6a8315fc025e4a475ffd4c6608",
    };
    const String query = r'''
query WalletHoldings($owner_address: String!) {
  aptos {
    wallet_holdings(address: $owner_address) {
      nft_id
      acquired_usd_price
      acquired_price
      collection {
        cover_url
        title
        verified
        id
        floor
      }
      nft {
        name
        owner
        staked
        token_id
        burned
        media_type
        media_url
        listings {
          listed
          price
        }
        contract_id
        version
      }
    }
  }
}
''';
    req.body = jsonEncode({
      'query': query,
      'variables': {'owner_address': ownerAddress}
    });
    req.headers.addAll(headers);

    try {
      final response = await http.Client().send(req);
      if (response.statusCode == 200) {
        final jsonString = await response.stream.transform(utf8.decoder).join();
        final data = jsonDecode(jsonString) as Map<String, dynamic>;
        final aptosWalletHoldings = data['data']['aptos']['wallet_holdings'];

        List<UserWalletNFTRemoteModel> walletHoldings = [];
        if (aptosWalletHoldings != null) {
          for (int i = 0; i < aptosWalletHoldings.length; i++) {
            final walletNft = UserWalletNFTRemoteModel.fromJson(aptosWalletHoldings[i]);
            walletHoldings.add(walletNft);
          }
        }
        return walletHoldings;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

}