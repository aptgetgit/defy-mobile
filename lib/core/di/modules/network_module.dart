import 'package:defy/config/environment/env.dart';
import 'package:defy/core/di/providers/network/dio_init_provider.dart';
import 'package:defy/core/di/providers/network/network_connectivity_provider.dart';
import 'package:defy/core/di/providers/services/ory_kratos_service_provider.dart';
import 'package:defy/core/models/network_connectivity_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NetworkModule {
  static Future<List<Override>> initialize() async {
    final overrides = <Override>[];

    const networkConfig = NetworkConnectivityConfig(
      checkUrls: ['https://1.1.1.1'],
      timeout: Duration(seconds: 3),
      lookupAddress: 'google.com',
    );

    overrides.addAll([
      networkInitializerProvider.overrideWithValue(networkConfig),
      dioInitializerProvider(Env.apiBaseUrl),
      dioInitializerProvider(Env.oryKratosEndpoint),
      oryKratosClientInitializerProvider,
    ]);

    return overrides;
  }
}
