import 'package:defy/core/di/providers/network/base_dio_service_provider.dart';
import 'package:defy/core/di/providers/services/object_box_service_provider.dart';
import 'package:defy/features/blockchain_account_group/data/repositories/blockchain_account_group_repository_implementation.dart';
import 'package:defy/features/blockchain_account_group/data/sources/local/blockchain_account_group_local_source.dart';
import 'package:defy/features/blockchain_account_group/data/sources/remote/blockchain_account_group_remote_source.dart';
import 'package:defy/features/blockchain_account_group/domain/usecases/blockchain_account_group_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/blockchain_account_group_usecase_provider.g.dart';

@riverpod
BlockchainAccountGroupRepository blockchainAccountGroupRepository(Ref ref) {
  final baseDio = ref.read(baseDioServiceProvider);
  final objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final localDataSource = BlockchainAccountGroupLocalDataSource(objectBoxStore);
  final remoteDataSource = BlockchainAccountGroupRemoteDataSource(baseDio);
  return BlockchainAccountGroupRepository(localDataSource, remoteDataSource);
}

@riverpod
ListLocalBlockchainAccountGroupsUseCase listLocalBlockchainAccountGroupsUseCase(
    Ref ref) {
  final repository = ref.read(blockchainAccountGroupRepositoryProvider);
  return ListLocalBlockchainAccountGroupsUseCase(repository);
}

@riverpod
GetLocalBlockchainAccountGroupUseCase getLocalBlockchainAccountGroupUseCase(
    Ref ref) {
  final repository = ref.read(blockchainAccountGroupRepositoryProvider);
  return GetLocalBlockchainAccountGroupUseCase(repository);
}

@riverpod
SaveLocalBlockchainAccountGroupUseCase saveLocalBlockchainAccountGroupUseCase(
    Ref ref) {
  final repository = ref.read(blockchainAccountGroupRepositoryProvider);
  return SaveLocalBlockchainAccountGroupUseCase(repository);
}

@riverpod
DeleteLocalBlockchainAccountGroupUseCase
    deleteLocalBlockchainAccountGroupUseCase(Ref ref) {
  final repository = ref.read(blockchainAccountGroupRepositoryProvider);
  return DeleteLocalBlockchainAccountGroupUseCase(repository);
}

@riverpod
GetLocalBlockchainAccountGroupByNameUseCase
    getLocalBlockchainAccountGroupByNameUseCase(Ref ref) {
  final repository = ref.read(blockchainAccountGroupRepositoryProvider);
  return GetLocalBlockchainAccountGroupByNameUseCase(repository);
}

@riverpod
CreateRemoteBlockchainAccountGroupUseCase
    createRemoteBlockchainAccountGroupUseCase(Ref ref) {
  final repository = ref.read(blockchainAccountGroupRepositoryProvider);
  return CreateRemoteBlockchainAccountGroupUseCase(repository);
}

@riverpod
ListRemoteBlockchainAccountGroupsUseCase
    listRemoteBlockchainAccountGroupsUseCase(Ref ref) {
  final repository = ref.read(blockchainAccountGroupRepositoryProvider);
  return ListRemoteBlockchainAccountGroupsUseCase(repository);
}

@riverpod
GetRemoteBlockchainAccountGroupUseCase getRemoteBlockchainAccountGroupUseCase(
    Ref ref) {
  final repository = ref.read(blockchainAccountGroupRepositoryProvider);
  return GetRemoteBlockchainAccountGroupUseCase(repository);
}

@riverpod
UpdateRemoteBlockchainAccountGroupUseCase
    updateRemoteBlockchainAccountGroupUseCase(Ref ref) {
  final repository = ref.read(blockchainAccountGroupRepositoryProvider);
  return UpdateRemoteBlockchainAccountGroupUseCase(repository);
}

@riverpod
DeleteRemoteBlockchainAccountGroupUseCase
    deleteRemoteBlockchainAccountGroupUseCase(Ref ref) {
  final repository = ref.read(blockchainAccountGroupRepositoryProvider);
  return DeleteRemoteBlockchainAccountGroupUseCase(repository);
}

@riverpod
SyncBlockchainAccountGroupsUseCase syncBlockchainAccountGroupsUseCase(Ref ref) {
  final repository = ref.read(blockchainAccountGroupRepositoryProvider);
  return SyncBlockchainAccountGroupsUseCase(repository);
}
