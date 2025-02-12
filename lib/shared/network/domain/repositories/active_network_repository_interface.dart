import '../entities/aptos_network.dart';

abstract class IActiveNetworkRepository {
  Future<AptosNetwork> getActiveNetwork();
  Future<void> setActiveNetwork(AptosNetwork network);
}
