import 'package:dio/src/dio.dart';
import 'package:objectbox/src/native/store.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/dio/providers/network/base_dio_service_provider.dart';
import '../../../../core/dio/providers/services/object_box_service_provider.dart';
import '../../data/repositories/user_blockchain_account_group_repository_implementation.dart';
import '../../data/sources/local/user_blockchain_account_group_local_source.dart';
import '../../data/sources/remote/user_blockchain_account_group_remote_source.dart';
import '../../domain/usecases/user_blockchain_account_group_usecase.dart';

part 'generated/user_blockchain_account_group_usecase_provider.g.dart';

@riverpod
UserBlockchainAccountGroupRepository userBlockchainAccountGroupRepository(
    Ref ref,) {
  final Dio baseDio = ref.read(baseDioServiceProvider);
  final Store objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final localDataSource = UserBlockchainAccountGroupLocalDataSource(objectBoxStore);
  final remoteDataSource = UserBlockchainAccountGroupRemoteDataSource(baseDio);
  return UserBlockchainAccountGroupRepository(
      localDataSource, remoteDataSource,);
}

@riverpod
ListLocalUserBlockchainAccountGroupsUseCase listLocalUserBlockchainAccountGroupsUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupRepository repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return ListLocalUserBlockchainAccountGroupsUseCase(repository);
}

@riverpod
GetLocalUserBlockchainAccountGroupUseCase getLocalUserBlockchainAccountGroupUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupRepository repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return GetLocalUserBlockchainAccountGroupUseCase(repository);
}

@riverpod
SaveLocalUserBlockchainAccountGroupUseCase saveLocalUserBlockchainAccountGroupUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupRepository repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return SaveLocalUserBlockchainAccountGroupUseCase(repository);
}

@riverpod
DeleteLocalUserBlockchainAccountGroupUseCase deleteLocalUserBlockchainAccountGroupUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupRepository repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return DeleteLocalUserBlockchainAccountGroupUseCase(repository);
}

@riverpod
GetLocalUserBlockchainAccountGroupByNameUseCase getLocalUserBlockchainAccountGroupByNameUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupRepository repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return GetLocalUserBlockchainAccountGroupByNameUseCase(repository);
}

@riverpod
CreateRemoteUserBlockchainAccountGroupUseCase createRemoteUserBlockchainAccountGroupUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupRepository repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return CreateRemoteUserBlockchainAccountGroupUseCase(repository);
}

@riverpod
ListRemoteUserBlockchainAccountGroupsUseCase listRemoteUserBlockchainAccountGroupsUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupRepository repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return ListRemoteUserBlockchainAccountGroupsUseCase(repository);
}

@riverpod
GetRemoteUserBlockchainAccountGroupUseCase getRemoteUserBlockchainAccountGroupUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupRepository repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return GetRemoteUserBlockchainAccountGroupUseCase(repository);
}

@riverpod
UpdateRemoteUserBlockchainAccountGroupUseCase updateRemoteUserBlockchainAccountGroupUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupRepository repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return UpdateRemoteUserBlockchainAccountGroupUseCase(repository);
}

@riverpod
DeleteRemoteUserBlockchainAccountGroupUseCase deleteRemoteUserBlockchainAccountGroupUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupRepository repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return DeleteRemoteUserBlockchainAccountGroupUseCase(repository);
}

@riverpod
SyncUserBlockchainAccountGroupsUseCase syncUserBlockchainAccountGroupsUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupRepository repository = ref.read(userBlockchainAccountGroupRepositoryProvider);
  return SyncUserBlockchainAccountGroupsUseCase(repository);
}
