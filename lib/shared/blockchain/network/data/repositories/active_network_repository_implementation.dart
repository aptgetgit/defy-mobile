import '../../domain/entities/aptos_network.dart';
import '../../domain/repositories/active_network_repository_interface.dart';
import '../sources/local/active_network_local_data_source.dart';

class ActiveNetworkRepository implements IActiveNetworkRepository {
  const ActiveNetworkRepository({
    required ActiveNetworkLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  final ActiveNetworkLocalDataSource _localDataSource;

  @override
  AptosNetwork? getActiveNetwork() {
    final String? savedNetwork = _localDataSource.getActiveNetworkId();

    if (savedNetwork == null) {
      return null;
    }
    return AptosNetwork.fromCaipChainId(savedNetwork);
  }

  @override
  Future<void> setActiveNetwork(AptosNetwork network) async {
    await _localDataSource.setActiveNetworkId(
      networkId: network.toCaipChainId(),
    );
  }

  @override
  Future<void> clearActiveNetwork() => _localDataSource.removeActiveNetworkId();

  @override
  bool hasActiveNetwork() => getActiveNetwork() != null;
}
