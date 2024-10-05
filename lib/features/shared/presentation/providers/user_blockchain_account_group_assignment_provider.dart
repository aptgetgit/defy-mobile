import 'package:defy/core/providers/dio_provider.dart';
import 'package:defy/core/providers/object_box_database_provider.dart';
import 'package:defy/features/shared/data/repositories/user_blockchain_account_group_assignment_repository_implementation.dart';
import 'package:defy/features/shared/data/sources/local/user_blockchain_account_group_assignment_local_source.dart';
import 'package:defy/features/shared/data/sources/remote/user_blockchain_account_group_assignment_remote_source.dart';
import 'package:defy/features/shared/domain/repositories/user_blockchain_account_group_assignment_repository.dart';
import 'package:defy/features/shared/domain/usecases/user_blockchain_account_group_assignment_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/user_blockchain_account_group_assignment_provider.g.dart';

@riverpod
UserBlockchainAccountGroupAssignmentRepository userBlockchainAccountGroupAssignmentRepository(
    UserBlockchainAccountGroupAssignmentRepositoryRef ref) {
  final baseDio = ref.read(baseDioServiceProvider);
  final objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final localDataSource = UserBlockchainAccountGroupAssignmentLocalDataSource(objectBoxStore);
  final remoteDataSource = UserBlockchainAccountGroupAssignmentRemoteDataSource(baseDio);
  return UserBlockchainAccountGroupAssignmentRepositoryImplementation(
      localDataSource, remoteDataSource);
}

@riverpod
ListLocalUserBlockchainAccountGroupAssignmentUseCase listLocalUserBlockchainAccountGroupAssignmentUseCase(
    ListLocalUserBlockchainAccountGroupAssignmentUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return ListLocalUserBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
GetLocalUserBlockchainAccountGroupAssignmentUseCase getLocalUserBlockchainAccountGroupAssignmentUseCase(
    GetLocalUserBlockchainAccountGroupAssignmentUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return GetLocalUserBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
GetLocalUserBlockchainAccountGroupAssignmentByAccountUseCase
    getLocalUserBlockchainAccountGroupAssignmentByAccountUseCase(
        GetLocalUserBlockchainAccountGroupAssignmentByAccountUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return GetLocalUserBlockchainAccountGroupAssignmentByAccountUseCase(repository);
}

@riverpod
GetLocalUserBlockchainAccountGroupAssignmentsByGroupUseCase
    getLocalUserBlockchainAccountGroupAssignmentsByGroupUseCase(
        GetLocalUserBlockchainAccountGroupAssignmentsByGroupUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return GetLocalUserBlockchainAccountGroupAssignmentsByGroupUseCase(repository);
}



@riverpod
SaveLocalUserBlockchainAccountGroupAssignmentUseCase saveLocalUserBlockchainAccountGroupAssignmentUseCase(
    SaveLocalUserBlockchainAccountGroupAssignmentUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return SaveLocalUserBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
DeleteLocalUserBlockchainAccountGroupAssignmentUseCase deleteLocalUserBlockchainAccountGroupAssignmentUseCase(
    DeleteLocalUserBlockchainAccountGroupAssignmentUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return DeleteLocalUserBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
ListRemoteUserBlockchainAccountGroupAssignmentsUseCase listRemoteUserBlockchainAccountGroupAssignmentsUseCase(
    ListRemoteUserBlockchainAccountGroupAssignmentsUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return ListRemoteUserBlockchainAccountGroupAssignmentsUseCase(repository);
}

@riverpod
GetRemoteUserBlockchainAccountGroupAssignmentUseCase getRemoteUserBlockchainAccountGroupAssignmentUseCase(
    GetRemoteUserBlockchainAccountGroupAssignmentUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return GetRemoteUserBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
UpdateRemoteUserBlockchainAccountGroupAssignmentUseCase updateRemoteUserBlockchainAccountGroupAssignmentUseCase(
    UpdateRemoteUserBlockchainAccountGroupAssignmentUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return UpdateRemoteUserBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
DeleteRemoteUserBlockchainAccountGroupAssignmentUseCase deleteRemoteUserBlockchainAccountGroupAssignmentUseCase(
    DeleteRemoteUserBlockchainAccountGroupAssignmentUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return DeleteRemoteUserBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
SyncUserBlockchainAccountGroupAssignmentsUseCase syncUserBlockchainAccountGroupAssignmentsUseCase(
    SyncUserBlockchainAccountGroupAssignmentsUseCaseRef ref) {
  final repository = ref.read(userBlockchainAccountGroupAssignmentRepositoryProvider);
  return SyncUserBlockchainAccountGroupAssignmentsUseCase(repository);
}

