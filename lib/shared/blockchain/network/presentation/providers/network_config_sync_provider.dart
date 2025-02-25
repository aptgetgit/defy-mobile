import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/logging/app_logger.dart';
import '../../domain/entities/aptos_network.dart';
import '../../domain/entities/network_config.dart';
import '../../domain/usecases/get_all_network_configs_usecase.dart';
import '../../domain/usecases/sync_network_configs_usecase.dart';
import 'usecase_provider.dart';

part 'generated/network_config_sync_provider.g.dart';

@Riverpod(keepAlive: true)
class NetworkConfigSync extends _$NetworkConfigSync {
  static const Map<String, String> _defaultRpcUrls = <String, String>{
    'aptos:mainnet': 'https://api.mainnet.aptoslabs.com/v1',
    'aptos:testnet': 'https://api.testnet.aptoslabs.com/v1',
    'aptos:devnet': 'https://api.devnet.aptoslabs.com/v1',
  };

  NetworkConfig _getDefaultConfig(AptosNetwork network) => NetworkConfig(
        caipChainId: network.toCaipChainId(),
        rpcUrl: Uri.parse(_defaultRpcUrls[network.reference]!),
      );

  List<NetworkConfig> _ensureAllNetworks(List<NetworkConfig> configs) {
    final List<AptosNetwork> existingNetworks = configs
        .map((NetworkConfig c) => AptosNetwork.fromCaipChainId(c.caipChainId))
        .toList();

    return <NetworkConfig>[
      // Mainnet
      if (existingNetworks.any((AptosNetwork n) => n is AptosMainnet))
        configs.firstWhere(
          (NetworkConfig c) =>
              AptosNetwork.fromCaipChainId(c.caipChainId) is AptosMainnet,
        )
      else
        _getDefaultConfig(const AptosNetwork.mainnet()),

      // Testnet
      if (existingNetworks.any((AptosNetwork n) => n is AptosTestnet))
        configs.firstWhere(
          (NetworkConfig c) =>
              AptosNetwork.fromCaipChainId(c.caipChainId) is AptosTestnet,
        )
      else
        _getDefaultConfig(const AptosNetwork.testnet()),

      // Devnet
      if (existingNetworks.any((AptosNetwork n) => n is AptosDevnet))
        configs.firstWhere(
          (NetworkConfig c) =>
              AptosNetwork.fromCaipChainId(c.caipChainId) is AptosDevnet,
        )
      else
        _getDefaultConfig(const AptosNetwork.devnet()),
    ];
  }

  @override
  Future<List<NetworkConfig>> build() async {
    final SyncNetworkConfigsUseCase syncNetworks =
        ref.read(syncNetworkConfigsUseCaseProvider);
    final GetAllNetworkConfigsUseCase getNetworks =
        ref.read(getAllNetworkConfigsUseCaseProvider);

    try {
      await syncNetworks.call();
    } on Exception catch (e) {
      AppLogger.error('Network sync failed: $e');
    }

    final List<NetworkConfig> storedNetworks = getNetworks.call();
    return _ensureAllNetworks(storedNetworks);
  }

  Future<void> sync() async {
    final SyncNetworkConfigsUseCase syncNetworks =
        ref.read(syncNetworkConfigsUseCaseProvider);
    final GetAllNetworkConfigsUseCase getNetworks =
        ref.read(getAllNetworkConfigsUseCaseProvider);

    state = const AsyncLoading<List<NetworkConfig>>();

    try {
      await syncNetworks.call();
      final List<NetworkConfig> storedNetworks = getNetworks.call();
      state =
          AsyncData<List<NetworkConfig>>(_ensureAllNetworks(storedNetworks));
    } on Exception catch (e, stackTrace) {
      state = AsyncError<List<NetworkConfig>>(e, stackTrace);
    }
  }
}

@riverpod
List<NetworkConfig> networkConfigs(Ref ref) =>
    ref.watch(networkConfigSyncProvider).valueOrNull ?? const <NetworkConfig>[];
