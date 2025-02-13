import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../config/environment/env.dart';
import '../../../shared/connectivity/domain/entities/connectivity_config.dart';
import '../../../shared/connectivity/presentation/providers/connectivity_status_provider.dart';
import '../providers/network/dio_init_provider.dart';

Future<List<Override>> initializeConnectivityModule() async {
  const ConnectivityConfig connectivityConfig = ConnectivityConfig(
    checkUrls: <String>['https://1.1.1.1'],
    timeout: Duration(seconds: 3),
  );

  final List<Override> overrides = <Override>[
    connectivityStatusInitializerProvider.overrideWithValue(connectivityConfig),
    dioInitializerProvider(Env.apiBaseUrl),
  ];

  return overrides;
}
