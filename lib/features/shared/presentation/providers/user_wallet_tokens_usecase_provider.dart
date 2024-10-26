import 'package:defy/features/shared/data/repositories/user_wallet_tokens_repository_implementation.dart';
import 'package:defy/features/shared/data/sources/remote/user_wallet_tokens_remote_source.dart';
import 'package:defy/features/shared/domain/repositories/user_wallet_tokens_repository.dart';
import 'package:defy/features/shared/domain/usecases/user_wallet_tokens_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/user_wallet_tokens_usecase_provider.g.dart';

@riverpod
UserWalletTokensRepository userWalletTokensRepository(UserWalletTokensRepositoryRef ref) {
  final remoteDataSource = UserWalletTokensRemoteSourceImpl();
  return UserWalletTokensRepositoryImplementation(remoteDataSource);
}

@riverpod
UserWalletTokensUseCase userWalletTokensUsecase(UserWalletTokensUsecaseRef ref) {
  final repository = ref.read(userWalletTokensRepositoryProvider);
  return UserWalletTokensUseCase(repository);
}