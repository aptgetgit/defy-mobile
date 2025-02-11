import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../config/environment/env.dart';
import '../../../shared/connectivity/data/models/local/connectivity_config.dart';
import '../../../shared/connectivity/presentation/providers/connectivity_provider.dart';
import '../providers/network/dio_init_provider.dart';

Future<List<Override>> initializeConnectivityModule() async {
  const ConnectivityConfig connectivityConfig = ConnectivityConfig(
    checkUrls: <String>['https://1.1.1.1'],
    timeout: Duration(seconds: 3),
  );

  final List<Override> overrides = <Override>[
    connectivityInitializerProvider.overrideWithValue(connectivityConfig),
    dioInitializerProvider(Env.apiBaseUrl),
  ];

  return overrides;
}
