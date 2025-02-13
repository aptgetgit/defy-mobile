import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/network/presentation/providers/network_config_sync_provider.dart';

Future<List<Override>> initializeBlockchainModule() async {
  final List<Override> overrides = <Override>[
    networkConfigSyncProvider.overrideWith(NetworkConfigSync.new),
  ];

  return overrides;
}
