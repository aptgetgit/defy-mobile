import 'package:defy/core/di/providers/network/base_dio_service_provider.dart';
import 'package:defy/core/di/providers/services/object_box_service_provider.dart';
import 'package:defy/features/blockchain_account/data/repositories/blockchain_account_repository_implementation.dart';
import 'package:defy/features/blockchain_account/data/sources/local/blockchain_account_local_source.dart';
import 'package:defy/features/blockchain_account/data/sources/remote/blockchain_account_remote_source.dart';
import 'package:defy/features/blockchain_account/domain/usecases/blockchain_account_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/blockchain_account_usecase_provider.g.dart';

@riverpod
BlockchainAccountRepository blockchainAccountRepository(Ref ref) {
  final baseDio = ref.read(baseDioServiceProvider);
  final objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final localDataSource = BlockchainAccountLocalDataSource(objectBoxStore);
  final remoteDataSource = BlockchainAccountRemoteDataSource(baseDio);
  return BlockchainAccountRepository(localDataSource, remoteDataSource);
}

@riverpod
ListLocalBlockchainAccountsUseCase listLocalBlockchainAccountsUseCase(Ref ref) {
  final repository = ref.read(blockchainAccountRepositoryProvider);
  return ListLocalBlockchainAccountsUseCase(repository);
}

@riverpod
GetLocalBlockchainAccountUseCase getLocalBlockchainAccountUseCase(Ref ref) {
  final repository = ref.read(blockchainAccountRepositoryProvider);
  return GetLocalBlockchainAccountUseCase(repository);
}

@riverpod
SaveLocalBlockchainAccountUseCase saveLocalBlockchainAccountUseCase(Ref ref) {
  final repository = ref.read(blockchainAccountRepositoryProvider);
  return SaveLocalBlockchainAccountUseCase(repository);
}

@riverpod
DeleteLocalBlockchainAccountUseCase deleteLocalBlockchainAccountUseCase(
    Ref ref) {
  final repository = ref.read(blockchainAccountRepositoryProvider);
  return DeleteLocalBlockchainAccountUseCase(repository);
}

@riverpod
CreateRemoteBlockchainAccountUseCase createRemoteBlockchainAccountUseCase(
    Ref ref) {
  final repository = ref.read(blockchainAccountRepositoryProvider);
  return CreateRemoteBlockchainAccountUseCase(repository);
}

@riverpod
ListRemoteBlockchainAccountsUseCase listRemoteBlockchainAccountsUseCase(
    Ref ref) {
  final repository = ref.read(blockchainAccountRepositoryProvider);
  return ListRemoteBlockchainAccountsUseCase(repository);
}

@riverpod
GetRemoteBlockchainAccountUseCase getRemoteBlockchainAccountUseCase(Ref ref) {
  final repository = ref.read(blockchainAccountRepositoryProvider);
  return GetRemoteBlockchainAccountUseCase(repository);
}

@riverpod
DeleteRemoteBlockchainAccountUseCase deleteRemoteBlockchainAccountUseCase(
    Ref ref) {
  final repository = ref.read(blockchainAccountRepositoryProvider);
  return DeleteRemoteBlockchainAccountUseCase(repository);
}

@riverpod
SyncBlockchainAccountsUseCase syncBlockchainAccountsUseCase(Ref ref) {
  final repository = ref.read(blockchainAccountRepositoryProvider);
  return SyncBlockchainAccountsUseCase(repository);
}
