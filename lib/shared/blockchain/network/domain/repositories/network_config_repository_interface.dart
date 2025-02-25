import '../entities/network_config.dart';

abstract class INetworkConfigRepository {
  Future<void> syncWithRemote();

  List<NetworkConfig> getAll();

  NetworkConfig? getByCaipChainId({required String caipChainId});

  NetworkConfig store({required NetworkConfig networkConfig});

  List<NetworkConfig> storeMany({required List<NetworkConfig> networkConfigs});

  void delete({required String caipChainId});

  void deleteMany({required List<String> caipChainIds});
}
