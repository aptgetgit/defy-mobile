import 'package:defy/features/shared/domain/entities/user_wallet_nft.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// @Riverpod(keepAlive: true)
// class UserWalletNFTList extends _$UserWalletNFTList {
//   @override
//   FutureOr<List<UserWalletNFT>?> build() {
//     return [];
//   }

//   Future<List<UserWalletNFT>?> getWalletNftList() async {
//     final walletNftList = await ref.read(walletNftUsecaseProvider).call();
//     state = walletNftList;
//     return walletNftList;
//   }

//   Future<List<UserWalletNFT>?> _fetchData(String ownerAddress) async {

//   }
// }