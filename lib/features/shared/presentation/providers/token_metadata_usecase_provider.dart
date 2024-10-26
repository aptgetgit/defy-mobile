import 'package:defy/features/shared/data/repositories/token_metadata_repository_implementation.dart';
import 'package:defy/features/shared/data/sources/remote/token_metadata_remote_source.dart';
import 'package:defy/features/shared/domain/repositories/token_metadata_repository.dart';
import 'package:defy/features/shared/domain/usecases/token_metadata_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/token_metadata_usecase_provider.g.dart';

@riverpod
TokenMetaDataRepository tokenMetaDataRepository(
    TokenMetaDataRepositoryRef ref) {
  final remoteSource = TokenMetadataRemoteSourceImpl();
  return TokenMetadataRepositoryImplementation(remoteSource);
}

@riverpod
TokenMetadataUseCase tokenMetaDataUseCase(TokenMetaDataUseCaseRef ref) {
  final repository = ref.read(tokenMetaDataRepositoryProvider);
  return TokenMetadataUseCase(repository);
}