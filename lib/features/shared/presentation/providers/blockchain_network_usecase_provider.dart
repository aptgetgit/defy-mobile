import 'package:dio/src/dio.dart';
import 'package:objectbox/src/native/store.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/dio/providers/network/base_dio_service_provider.dart';
import '../../../../core/dio/providers/services/object_box_service_provider.dart';
import '../../data/repositories/blockchain_network_repository_implementation.dart';
import '../../data/sources/local/blockchain_network_local_source.dart';
import '../../data/sources/remote/blockchain_network_remote_source.dart';
import '../../domain/usecases/blockchain_network_usecase.dart';

part 'generated/blockchain_network_usecase_provider.g.dart';

@riverpod
BlockchainNetworkRepository blockchainNetworkRepository(
    Ref ref) {
  final Dio baseDio = ref.read(baseDioServiceProvider);
  final Store objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final localDataSource = BlockchainNetworkLocalDataSource(objectBoxStore);
  final remoteDataSource = BlockchainNetworkRemoteDataSource(baseDio);
  return BlockchainNetworkRepository(
      localDataSource, remoteDataSource);
}

@riverpod
ListLocalBlockchainNetworksUseCase listLocalBlockchainNetworksUseCase(
    Ref ref) {
  final BlockchainNetworkRepository repository = ref.read(blockchainNetworkRepositoryProvider);
  return ListLocalBlockchainNetworksUseCase(repository);
}

@riverpod
GetLocalBlockchainNetworkUseCase getLocalBlockchainNetworkUseCase(
    Ref ref) {
  final BlockchainNetworkRepository repository = ref.read(blockchainNetworkRepositoryProvider);
  return GetLocalBlockchainNetworkUseCase(repository);
}

@riverpod
SaveLocalBlockchainNetworkUseCase saveLocalBlockchainNetworkUseCase(
    Ref ref) {
  final BlockchainNetworkRepository repository = ref.read(blockchainNetworkRepositoryProvider);
  return SaveLocalBlockchainNetworkUseCase(repository);
}

@riverpod
DeleteLocalBlockchainNetworkUseCase deleteLocalBlockchainNetworkUseCase(
    Ref ref) {
  final BlockchainNetworkRepository repository = ref.read(blockchainNetworkRepositoryProvider);
  return DeleteLocalBlockchainNetworkUseCase(repository);
}

@riverpod
ListRemoteBlockchainNetworksUseCase listRemoteBlockchainNetworksUseCase(
    Ref ref) {
  final BlockchainNetworkRepository repository = ref.read(blockchainNetworkRepositoryProvider);
  return ListRemoteBlockchainNetworksUseCase(repository);
}

@riverpod
GetRemoteBlockchainNetworkUseCase getRemoteBlockchainNetworkUseCase(
    Ref ref) {
  final BlockchainNetworkRepository repository = ref.read(blockchainNetworkRepositoryProvider);
  return GetRemoteBlockchainNetworkUseCase(repository);
}

@riverpod
SyncBlockchainNetworksUseCase syncBlockchainNetworksUseCase(
    Ref ref) {
  final BlockchainNetworkRepository repository = ref.read(blockchainNetworkRepositoryProvider);
  return SyncBlockchainNetworksUseCase(repository);
}
