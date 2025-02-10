
import 'package:defy/features/shared/data/repositories/user_blockchain_account_repository_implementation.dart';
import 'package:defy/features/shared/data/sources/local/user_blockchain_account_local_source.dart';
import 'package:defy/features/shared/data/sources/remote/user_blockchain_account_remote_source.dart';
import 'package:defy/features/shared/domain/usecases/user_blockchain_account_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/dio/providers/network/base_dio_service_provider.dart';
import '../../../../core/dio/providers/services/object_box_service_provider.dart';

part 'generated/user_blockchain_account_usecase_provider.g.dart';

@riverpod
UserBlockchainAccountRepository userBlockchainAccountRepository(
    UserBlockchainAccountRepositoryRef ref) {
  final baseDio = ref.read(baseDioServiceProvider);
  final objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final localDataSource = UserBlockchainAccountLocalDataSource(objectBoxStore);
  final remoteDataSource = UserBlockchainAccountRemoteDataSource(baseDio);
  return UserBlockchainAccountRepository(
      localDataSource, remoteDataSource);
}

@riverpod
ListLocalUserBlockchainAccountsUseCase listLocalUserBlockchainAccountsUseCase(
    ListLocalUserBlockchainAccountsUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountRepositoryProvider);
  return ListLocalUserBlockchainAccountsUseCase(repository);
}

@riverpod
GetLocalUserBlockchainAccountUseCase getLocalUserBlockchainAccountUseCase(
    GetLocalUserBlockchainAccountUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountRepositoryProvider);
  return GetLocalUserBlockchainAccountUseCase(repository);
}

@riverpod
SaveLocalUserBlockchainAccountUseCase saveLocalUserBlockchainAccountUseCase(
    SaveLocalUserBlockchainAccountUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountRepositoryProvider);
  return SaveLocalUserBlockchainAccountUseCase(repository);
}

@riverpod
DeleteLocalUserBlockchainAccountUseCase deleteLocalUserBlockchainAccountUseCase(
    DeleteLocalUserBlockchainAccountUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountRepositoryProvider);
  return DeleteLocalUserBlockchainAccountUseCase(repository);
}

@riverpod
CreateRemoteUserBlockchainAccountUseCase createRemoteUserBlockchainAccountUseCase(
    CreateRemoteUserBlockchainAccountUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountRepositoryProvider);
  return CreateRemoteUserBlockchainAccountUseCase(repository);
}

@riverpod
ListRemoteUserBlockchainAccountsUseCase listRemoteUserBlockchainAccountsUseCase(
    ListRemoteUserBlockchainAccountsUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountRepositoryProvider);
  return ListRemoteUserBlockchainAccountsUseCase(repository);
}

@riverpod
GetRemoteUserBlockchainAccountUseCase getRemoteUserBlockchainAccountUseCase(
    GetRemoteUserBlockchainAccountUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountRepositoryProvider);
  return GetRemoteUserBlockchainAccountUseCase(repository);
}

@riverpod
DeleteRemoteUserBlockchainAccountUseCase deleteRemoteUserBlockchainAccountUseCase(
    DeleteRemoteUserBlockchainAccountUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountRepositoryProvider);
  return DeleteRemoteUserBlockchainAccountUseCase(repository);
}

@riverpod
SyncUserBlockchainAccountsUseCase syncUserBlockchainAccountsUseCase(
    SyncUserBlockchainAccountsUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountRepositoryProvider);
  return SyncUserBlockchainAccountsUseCase(repository);
}