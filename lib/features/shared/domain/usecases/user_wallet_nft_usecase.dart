// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:defy/features/shared/domain/entities/user_wallet_nft.dart';
import 'package:defy/features/shared/domain/repositories/user_wallet_nft_repository.dart';

class UserWalletNftUsecase {
  final UserWalletNFTRepository _repository;
  UserWalletNftUsecase(this._repository);

  Future<List<List<UserWalletNFT>?>?> call(String ownerAddress) {
    return _repository.fetchUserWalletNFTs(ownerAddress);
  }
}
