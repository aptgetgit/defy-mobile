import 'package:defy/core/di/providers/network/base_dio_service_provider.dart';
import 'package:defy/core/di/providers/services/object_box_service_provider.dart';
import 'package:defy/features/blockchain_network/data/repositories/blockchain_network_repository_implementation.dart';
import 'package:defy/features/blockchain_network/data/sources/local/blockchain_network_local_source.dart';
import 'package:defy/features/blockchain_network/data/sources/remote/blockchain_network_remote_source.dart';
import 'package:defy/features/blockchain_network/domain/usecases/blockchain_network_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/blockchain_network_usecase_provider.g.dart';

@riverpod
BlockchainNetworkRepository blockchainNetworkRepository(Ref ref) {
  final baseDio = ref.read(baseDioServiceProvider);
  final objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final localDataSource = BlockchainNetworkLocalDataSource(objectBoxStore);
  final remoteDataSource = BlockchainNetworkRemoteDataSource(baseDio);
  return BlockchainNetworkRepository(localDataSource, remoteDataSource);
}

@riverpod
ListLocalBlockchainNetworksUseCase listLocalBlockchainNetworksUseCase(Ref ref) {
  final repository = ref.read(blockchainNetworkRepositoryProvider);
  return ListLocalBlockchainNetworksUseCase(repository);
}

@riverpod
GetLocalBlockchainNetworkUseCase getLocalBlockchainNetworkUseCase(Ref ref) {
  final repository = ref.read(blockchainNetworkRepositoryProvider);
  return GetLocalBlockchainNetworkUseCase(repository);
}

@riverpod
SaveLocalBlockchainNetworkUseCase saveLocalBlockchainNetworkUseCase(Ref ref) {
  final repository = ref.read(blockchainNetworkRepositoryProvider);
  return SaveLocalBlockchainNetworkUseCase(repository);
}

@riverpod
DeleteLocalBlockchainNetworkUseCase deleteLocalBlockchainNetworkUseCase(
    Ref ref) {
  final repository = ref.read(blockchainNetworkRepositoryProvider);
  return DeleteLocalBlockchainNetworkUseCase(repository);
}

@riverpod
ListRemoteBlockchainNetworksUseCase listRemoteBlockchainNetworksUseCase(
    Ref ref) {
  final repository = ref.read(blockchainNetworkRepositoryProvider);
  return ListRemoteBlockchainNetworksUseCase(repository);
}

@riverpod
GetRemoteBlockchainNetworkUseCase getRemoteBlockchainNetworkUseCase(Ref ref) {
  final repository = ref.read(blockchainNetworkRepositoryProvider);
  return GetRemoteBlockchainNetworkUseCase(repository);
}

@riverpod
SyncBlockchainNetworksUseCase syncBlockchainNetworksUseCase(Ref ref) {
  final repository = ref.read(blockchainNetworkRepositoryProvider);
  return SyncBlockchainNetworksUseCase(repository);
}
