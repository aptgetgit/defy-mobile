import 'package:defy/core/providers/dio_provider.dart';
import 'package:defy/core/providers/object_box_database_provider.dart';
import 'package:defy/features/shared/data/repositories/blockchain_network_repository_implementation.dart';
import 'package:defy/features/shared/data/sources/local/blockchain_network_local_source.dart';
import 'package:defy/features/shared/data/sources/remote/blockchain_network_remote_source.dart';
import 'package:defy/features/shared/domain/repositories/blockchain_network_repository.dart';
import 'package:defy/features/shared/domain/usecases/blockchain_network_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/blockchain_network_provider.g.dart';

@riverpod
BlockchainNetworkRepository blockchainNetworkRepository(
    BlockchainNetworkRepositoryRef ref) {
  final baseDio = ref.read(baseDioServiceProvider);
  final objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final localDataSource = BlockchainNetworkLocalDataSource(objectBoxStore);
  final remoteDataSource = BlockchainNetworkRemoteDataSource(baseDio);
  return BlockchainNetworkRepositoryImplementation(
      localDataSource, remoteDataSource);
}

@riverpod
ListLocalBlockchainNetworksUseCase listLocalBlockchainNetworksUseCase(
    ListLocalBlockchainNetworksUseCaseRef ref) {
  final repository = ref.read(blockchainNetworkRepositoryProvider);
  return ListLocalBlockchainNetworksUseCase(repository);
}

@riverpod
GetLocalBlockchainNetworkUseCase getLocalBlockchainNetworkUseCase(
    GetLocalBlockchainNetworkUseCaseRef ref) {
  final repository = ref.read(blockchainNetworkRepositoryProvider);
  return GetLocalBlockchainNetworkUseCase(repository);
}

@riverpod
SaveLocalBlockchainNetworkUseCase saveLocalBlockchainNetworkUseCase(
    SaveLocalBlockchainNetworkUseCaseRef ref) {
  final repository = ref.read(blockchainNetworkRepositoryProvider);
  return SaveLocalBlockchainNetworkUseCase(repository);
}

@riverpod
DeleteLocalBlockchainNetworkUseCase deleteLocalBlockchainNetworkUseCase(
    DeleteLocalBlockchainNetworkUseCaseRef ref) {
  final repository = ref.read(blockchainNetworkRepositoryProvider);
  return DeleteLocalBlockchainNetworkUseCase(repository);
}

@riverpod
ListRemoteBlockchainNetworksUseCase listRemoteBlockchainNetworksUseCase(
    ListRemoteBlockchainNetworksUseCaseRef ref) {
  final repository = ref.read(blockchainNetworkRepositoryProvider);
  return ListRemoteBlockchainNetworksUseCase(repository);
}

@riverpod
GetRemoteBlockchainNetworkUseCase getRemoteBlockchainNetworkUseCase(
    GetRemoteBlockchainNetworkUseCaseRef ref) {
  final repository = ref.read(blockchainNetworkRepositoryProvider);
  return GetRemoteBlockchainNetworkUseCase(repository);
}

@riverpod
SyncBlockchainNetworksUseCase syncBlockchainNetworksUseCase(
    SyncBlockchainNetworksUseCaseRef ref) {
  final repository = ref.read(blockchainNetworkRepositoryProvider);
  return SyncBlockchainNetworksUseCase(repository);
}
