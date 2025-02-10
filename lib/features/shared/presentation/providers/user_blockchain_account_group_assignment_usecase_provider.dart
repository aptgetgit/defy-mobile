
import 'package:dio/src/dio.dart';
import 'package:objectbox/src/native/store.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/dio/providers/network/base_dio_service_provider.dart';
import '../../../../core/dio/providers/services/object_box_service_provider.dart';
import '../../data/repositories/user_blockchain_account_group_assignment_repository_implementation.dart';
import '../../data/sources/local/user_blockchain_account_group_assignment_local_source.dart';
import '../../data/sources/remote/user_blockchain_account_group_assignment_remote_source.dart';
import '../../domain/usecases/user_blockchain_account_group_assignment_usecase.dart';

part 'generated/user_blockchain_account_group_assignment_usecase_provider.g.dart';

@riverpod
UserBlockchainAccountGroupAssignmentRepository userBlockchainAccountGroupAssignmentRepository(
    Ref ref,) {
  final Dio baseDio = ref.read(baseDioServiceProvider);
  final Store objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final UserBlockchainAccountGroupAssignmentLocalDataSource localDataSource = UserBlockchainAccountGroupAssignmentLocalDataSource(objectBoxStore);
  final UserBlockchainAccountGroupAssignmentRemoteDataSource remoteDataSource = UserBlockchainAccountGroupAssignmentRemoteDataSource(baseDio);
  return UserBlockchainAccountGroupAssignmentRepository(
      localDataSource, remoteDataSource,);
}

@riverpod
ListLocalUserBlockchainAccountGroupAssignmentUseCase listLocalUserBlockchainAccountGroupAssignmentUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupAssignmentRepository repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return ListLocalUserBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
GetLocalUserBlockchainAccountGroupAssignmentUseCase getLocalUserBlockchainAccountGroupAssignmentUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupAssignmentRepository repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return GetLocalUserBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
GetLocalUserBlockchainAccountGroupAssignmentByAccountUseCase
    getLocalUserBlockchainAccountGroupAssignmentByAccountUseCase(
        Ref ref,) {
  final UserBlockchainAccountGroupAssignmentRepository repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return GetLocalUserBlockchainAccountGroupAssignmentByAccountUseCase(repository);
}

@riverpod
GetLocalUserBlockchainAccountGroupAssignmentsByGroupUseCase
    getLocalUserBlockchainAccountGroupAssignmentsByGroupUseCase(
        Ref ref,) {
  final UserBlockchainAccountGroupAssignmentRepository repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return GetLocalUserBlockchainAccountGroupAssignmentsByGroupUseCase(repository);
}



@riverpod
SaveLocalUserBlockchainAccountGroupAssignmentUseCase saveLocalUserBlockchainAccountGroupAssignmentUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupAssignmentRepository repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return SaveLocalUserBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
DeleteLocalUserBlockchainAccountGroupAssignmentUseCase deleteLocalUserBlockchainAccountGroupAssignmentUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupAssignmentRepository repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return DeleteLocalUserBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
ListRemoteUserBlockchainAccountGroupAssignmentsUseCase listRemoteUserBlockchainAccountGroupAssignmentsUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupAssignmentRepository repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return ListRemoteUserBlockchainAccountGroupAssignmentsUseCase(repository);
}

@riverpod
GetRemoteUserBlockchainAccountGroupAssignmentUseCase getRemoteUserBlockchainAccountGroupAssignmentUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupAssignmentRepository repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return GetRemoteUserBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
UpdateRemoteUserBlockchainAccountGroupAssignmentUseCase updateRemoteUserBlockchainAccountGroupAssignmentUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupAssignmentRepository repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return UpdateRemoteUserBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
DeleteRemoteUserBlockchainAccountGroupAssignmentUseCase deleteRemoteUserBlockchainAccountGroupAssignmentUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupAssignmentRepository repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return DeleteRemoteUserBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
SyncUserBlockchainAccountGroupAssignmentsUseCase syncUserBlockchainAccountGroupAssignmentsUseCase(
    Ref ref,) {
  final UserBlockchainAccountGroupAssignmentRepository repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return SyncUserBlockchainAccountGroupAssignmentsUseCase(repository);
}

