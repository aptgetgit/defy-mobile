import 'package:dio/dio.dart';
import 'package:objectbox/objectbox.dart';
import 'package:retrofit/dio.dart';

import '../../domain/entities/network_config.dart';
import '../../domain/repositories/network_config_repository_interface.dart';
import '../models/local/network_config_local_model.dart';
import '../models/remote/network_config_remote_model.dart';
import '../sources/local/network_config_local_data_source.dart';
import '../sources/remote/network_config_remote_data_source.dart';

class NetworkConfigRepository implements INetworkConfigRepository {
  NetworkConfigRepository({
    required Store store,
    required NetworkConfigLocalDataSource localDataSource,
    required NetworkConfigRemoteDataSource remoteDataSource,
  })  : _store = store,
        _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  final Store _store;
  final NetworkConfigLocalDataSource _localDataSource;
  final NetworkConfigRemoteDataSource _remoteDataSource;

  @override
  Future<void> syncWithRemote() async {
    try {
      final HttpResponse<NetworkConfigResponseModel> response =
          await _remoteDataSource.getNetworks();
      final List<NetworkConfig> networks = response.data.data
          .map((NetworkConfigRemoteModel model) => model.toDomain())
          .toList();
      storeMany(networkConfigs: networks);
    } on DioException catch (e) {
      throw StateError('Failed to sync networks: ${e.message}');
    }
  }

  @override
  List<NetworkConfig> getAll() => _store.runInTransaction(
        TxMode.read,
        () => _localDataSource
            .getAll()
            .map((NetworkConfigLocalModel model) => model.toDomain())
            .toList(),
      );

  @override
  NetworkConfig? getByCaipChainId({required String caipChainId}) =>
      _store.runInTransaction(TxMode.read, () {
        final NetworkConfigLocalModel? model =
            _localDataSource.getByCaipChainId(caipChainId: caipChainId);
        return model?.toDomain();
      });

  @override
  NetworkConfig store({required NetworkConfig networkConfig}) =>
      _store.runInTransaction(TxMode.write, () {
        final NetworkConfigLocalModel model =
            _localDataSource.store(config: networkConfig);
        return model.toDomain();
      });

  @override
  List<NetworkConfig> storeMany({
    required List<NetworkConfig> networkConfigs,
  }) =>
      _store.runInTransaction(TxMode.write, () {
        _localDataSource.storeMany(networkConfigs);
        return getAll();
      });

  @override
  void delete({required String caipChainId}) {
    _store.runInTransaction(TxMode.write, () {
      final bool deleted = _localDataSource.deleteByCaipChainId(
        caipChainId: caipChainId,
      );

      if (!deleted) {
        throw StateError(
          'Cannot delete: Network config not found for CAIP chain ID: $caipChainId',
        );
      }
    });
  }

  @override
  void deleteMany({required List<String> caipChainIds}) {
    _store.runInTransaction(TxMode.write, () {
      final bool deleted = _localDataSource.deleteMany(caipChainIds);

      if (!deleted) {
        throw StateError(
          'Cannot delete: No network configs found for the provided CAIP chain IDs',
        );
      }
    });
  }
}
