import 'package:defy/features/shared/data/repositories/user_wallet_nft_repository_implementation.dart';
import 'package:defy/features/shared/data/sources/remote/user_wallet_nft_remote_source.dart';
import 'package:defy/features/shared/domain/repositories/user_wallet_nft_repository.dart';
import 'package:defy/features/shared/domain/usecases/user_wallet_nft_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/user_wallet_nft_usecase_provider.g.dart';

@riverpod
UserWalletNFTRepository userWalletNFTRepository(UserWalletNFTRepositoryRef ref) {
  final remoteDataSource = UserWalletNFTRemoteSourceImpl();
  return UserWalletNFTRepositoryImplementation(remoteDataSource);
}

@riverpod
UserWalletNftUsecase userWalletNftUsecase(UserWalletNftUsecaseRef ref) {
  final repository = ref.read(userWalletNFTRepositoryProvider);
  return UserWalletNftUsecase(repository);
}