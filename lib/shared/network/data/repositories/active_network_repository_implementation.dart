import '../../../../core/services/shared_preference_service.dart';
import '../../domain/entities/aptos_network.dart';
import '../../domain/repositories/active_network_repository_interface.dart';

class ActiveNetworkRepository implements IActiveNetworkRepository {
  const ActiveNetworkRepository({
    required SharedPreferencesService sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferencesService _sharedPreferences;
  static const String _networkKey = 'app:setting:network';

  @override
  Future<AptosNetwork> getActiveNetwork() async {
    final String? savedNetwork = _sharedPreferences.getString(_networkKey);

    if (savedNetwork == null) {
      const AptosNetwork defaultNetwork = AptosNetwork.mainnet();
      await setActiveNetwork(defaultNetwork);
      return defaultNetwork;
    }

    try {
      final AptosNetwork parsedNetwork =
          AptosNetwork.fromCaipChainId(savedNetwork);
      return parsedNetwork;
    } catch (e) {
      if (e is ArgumentError) {
        const AptosNetwork defaultNetwork = AptosNetwork.mainnet();
        await setActiveNetwork(defaultNetwork);
        return defaultNetwork;
      }
      rethrow;
    }
  }

  @override
  Future<void> setActiveNetwork(AptosNetwork network) async {
    await _sharedPreferences.set<String>(_networkKey, network.toCaipChainId());
  }
}
