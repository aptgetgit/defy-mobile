import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/environment/env.dart';

import '../../../shared/network/data/models/local/network_config.dart';
import '../../../shared/network/presentation/providers/network_status_provider.dart';
import '../providers/network/dio_init_provider.dart';

Future<List<Override>> initializeNetworkModule() async {
  const NetworkConfig networkConfig = NetworkConfig(
    checkUrls: <String>['https://1.1.1.1'],
    timeout: Duration(seconds: 3),
  );
  final List<Override> overrides = <Override>[
    networkInitializerProvider.overrideWithValue(networkConfig),
    dioInitializerProvider(Env.apiBaseUrl),
  ];

  return overrides;
}
