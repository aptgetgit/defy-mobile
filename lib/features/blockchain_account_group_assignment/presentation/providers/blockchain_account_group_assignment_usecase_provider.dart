import 'package:defy/core/di/providers/network/base_dio_service_provider.dart';
import 'package:defy/core/di/providers/services/object_box_service_provider.dart';
import 'package:defy/features/blockchain_account_group_assignment/data/repositories/blockchain_account_group_assignment_repository_implementation.dart';
import 'package:defy/features/blockchain_account_group_assignment/data/sources/local/blockchain_account_group_assignment_local_source.dart';
import 'package:defy/features/blockchain_account_group_assignment/data/sources/remote/blockchain_account_group_assignment_remote_source.dart';
import 'package:defy/features/blockchain_account_group_assignment/domain/usecases/blockchain_account_group_assignment_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/blockchain_account_group_assignment_usecase_provider.g.dart';

@riverpod
BlockchainAccountGroupAssignmentRepository
    blockchainAccountGroupAssignmentRepository(Ref ref) {
  final baseDio = ref.read(baseDioServiceProvider);
  final objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final localDataSource =
      BlockchainAccountGroupAssignmentLocalDataSource(objectBoxStore);
  final remoteDataSource =
      BlockchainAccountGroupAssignmentRemoteDataSource(baseDio);
  return BlockchainAccountGroupAssignmentRepository(
      localDataSource, remoteDataSource);
}

@riverpod
ListLocalBlockchainAccountGroupAssignmentUseCase
    listLocalBlockchainAccountGroupAssignmentUseCase(Ref ref) {
  final repository =
      ref.read(blockchainAccountGroupAssignmentRepositoryProvider);
  return ListLocalBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
GetLocalBlockchainAccountGroupAssignmentUseCase
    getLocalBlockchainAccountGroupAssignmentUseCase(Ref ref) {
  final repository =
      ref.read(blockchainAccountGroupAssignmentRepositoryProvider);
  return GetLocalBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
GetLocalBlockchainAccountGroupAssignmentByAccountUseCase
    getLocalBlockchainAccountGroupAssignmentByAccountUseCase(Ref ref) {
  final repository =
      ref.read(blockchainAccountGroupAssignmentRepositoryProvider);
  return GetLocalBlockchainAccountGroupAssignmentByAccountUseCase(repository);
}

@riverpod
GetLocalBlockchainAccountGroupAssignmentsByGroupUseCase
    getLocalBlockchainAccountGroupAssignmentsByGroupUseCase(Ref ref) {
  final repository =
      ref.read(blockchainAccountGroupAssignmentRepositoryProvider);
  return GetLocalBlockchainAccountGroupAssignmentsByGroupUseCase(repository);
}

@riverpod
SaveLocalBlockchainAccountGroupAssignmentUseCase
    saveLocalBlockchainAccountGroupAssignmentUseCase(Ref ref) {
  final repository =
      ref.read(blockchainAccountGroupAssignmentRepositoryProvider);
  return SaveLocalBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
DeleteLocalBlockchainAccountGroupAssignmentUseCase
    deleteLocalBlockchainAccountGroupAssignmentUseCase(Ref ref) {
  final repository =
      ref.read(blockchainAccountGroupAssignmentRepositoryProvider);
  return DeleteLocalBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
ListRemoteBlockchainAccountGroupAssignmentsUseCase
    listRemoteBlockchainAccountGroupAssignmentsUseCase(Ref ref) {
  final repository =
      ref.read(blockchainAccountGroupAssignmentRepositoryProvider);
  return ListRemoteBlockchainAccountGroupAssignmentsUseCase(repository);
}

@riverpod
GetRemoteBlockchainAccountGroupAssignmentUseCase
    getRemoteBlockchainAccountGroupAssignmentUseCase(Ref ref) {
  final repository =
      ref.read(blockchainAccountGroupAssignmentRepositoryProvider);
  return GetRemoteBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
UpdateRemoteBlockchainAccountGroupAssignmentUseCase
    updateRemoteBlockchainAccountGroupAssignmentUseCase(Ref ref) {
  final repository =
      ref.read(blockchainAccountGroupAssignmentRepositoryProvider);
  return UpdateRemoteBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
DeleteRemoteBlockchainAccountGroupAssignmentUseCase
    deleteRemoteBlockchainAccountGroupAssignmentUseCase(Ref ref) {
  final repository =
      ref.read(blockchainAccountGroupAssignmentRepositoryProvider);
  return DeleteRemoteBlockchainAccountGroupAssignmentUseCase(repository);
}

@riverpod
SyncBlockchainAccountGroupAssignmentsUseCase
    syncBlockchainAccountGroupAssignmentsUseCase(Ref ref) {
  final repository =
      ref.read(blockchainAccountGroupAssignmentRepositoryProvider);
  return SyncBlockchainAccountGroupAssignmentsUseCase(repository);
}
