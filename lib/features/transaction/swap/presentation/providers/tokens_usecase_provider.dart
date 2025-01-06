import 'package:defy/features/transaction/swap/data/repositories/tokens_repository_implementation.dart';
import 'package:defy/features/transaction/swap/data/sources/remote/tokens_remote_source.dart';
import 'package:defy/features/transaction/swap/domain/repositories/tokens_repository.dart';
import 'package:defy/features/transaction/swap/domain/usecases/tokens_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/tokens_usecase_provider.g.dart';

@riverpod
TokensRepository tokensRepository(TokensRepositoryRef ref) {
  final remoteDataSource = TokensRemoteSourceImplementation();
  return TokensRepositoryImplementation(remoteDataSource);
}

@riverpod
TokensUsecase tokensUsecase(TokensUsecaseRef ref) {
  final repository = ref.read(tokensRepositoryProvider);
  return TokensUsecase(repository);
}