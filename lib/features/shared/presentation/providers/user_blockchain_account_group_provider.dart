import 'package:defy/core/providers/dio_provider.dart';
import 'package:defy/core/providers/object_box_database_provider.dart';
import 'package:defy/features/shared/data/repositories/user_blockchain_account_group_repository_implementation.dart';
import 'package:defy/features/shared/data/sources/local/user_blockchain_account_group_local_source.dart';
import 'package:defy/features/shared/data/sources/remote/user_blockchain_account_group_remote_source.dart';
import 'package:defy/features/shared/domain/repositories/user_blockchain_account_group_repository.dart';
import 'package:defy/features/shared/domain/usecases/user_blockchain_account_group_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/user_blockchain_account_group_provider.g.dart';

@riverpod
UserBlockchainAccountGroupRepository userBlockchainAccountGroupRepository(
    UserBlockchainAccountGroupRepositoryRef ref) {
  final baseDio = ref.read(baseDioServiceProvider);
  final objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final localDataSource = UserBlockchainAccountGroupLocalDataSource(objectBoxStore);
  final remoteDataSource = UserBlockchainAccountGroupRemoteDataSource(baseDio);
  return UserBlockchainAccountGroupRepositoryImplementation(
      localDataSource, remoteDataSource);
}

@riverpod
ListLocalUserBlockchainAccountGroupsUseCase listLocalUserBlockchainAccountGroupsUseCase(
    ListLocalUserBlockchainAccountGroupsUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return ListLocalUserBlockchainAccountGroupsUseCase(repository);
}

@riverpod
GetLocalUserBlockchainAccountGroupUseCase getLocalUserBlockchainAccountGroupUseCase(
    GetLocalUserBlockchainAccountGroupUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return GetLocalUserBlockchainAccountGroupUseCase(repository);
}

@riverpod
SaveLocalUserBlockchainAccountGroupUseCase saveLocalUserBlockchainAccountGroupUseCase(
    SaveLocalUserBlockchainAccountGroupUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return SaveLocalUserBlockchainAccountGroupUseCase(repository);
}

@riverpod
DeleteLocalUserBlockchainAccountGroupUseCase deleteLocalUserBlockchainAccountGroupUseCase(
    DeleteLocalUserBlockchainAccountGroupUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return DeleteLocalUserBlockchainAccountGroupUseCase(repository);
}

@riverpod
GetLocalUserBlockchainAccountGroupByNameUseCase getLocalUserBlockchainAccountGroupByNameUseCase(
    GetLocalUserBlockchainAccountGroupByNameUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return GetLocalUserBlockchainAccountGroupByNameUseCase(repository);
}

@riverpod
CreateRemoteUserBlockchainAccountGroupUseCase createRemoteUserBlockchainAccountGroupUseCase(
    CreateRemoteUserBlockchainAccountGroupUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return CreateRemoteUserBlockchainAccountGroupUseCase(repository);
}

@riverpod
ListRemoteUserBlockchainAccountGroupsUseCase listRemoteUserBlockchainAccountGroupsUseCase(
    ListRemoteUserBlockchainAccountGroupsUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return ListRemoteUserBlockchainAccountGroupsUseCase(repository);
}

@riverpod
GetRemoteUserBlockchainAccountGroupUseCase getRemoteUserBlockchainAccountGroupUseCase(
    GetRemoteUserBlockchainAccountGroupUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return GetRemoteUserBlockchainAccountGroupUseCase(repository);
}

@riverpod
UpdateRemoteUserBlockchainAccountGroupUseCase updateRemoteUserBlockchainAccountGroupUseCase(
    UpdateRemoteUserBlockchainAccountGroupUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return UpdateRemoteUserBlockchainAccountGroupUseCase(repository);
}

@riverpod
DeleteRemoteUserBlockchainAccountGroupUseCase deleteRemoteUserBlockchainAccountGroupUseCase(
    DeleteRemoteUserBlockchainAccountGroupUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return DeleteRemoteUserBlockchainAccountGroupUseCase(repository);
}

@riverpod
SyncUserBlockchainAccountGroupsUseCase syncUserBlockchainAccountGroupsUseCase(
    SyncUserBlockchainAccountGroupsUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return SyncUserBlockchainAccountGroupsUseCase(repository);
}
