import 'package:envied/envied.dart';

part 'generated/env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'API_BASE_URL')
  static const String apiBaseUrl = _Env.apiBaseUrl;

  @EnviedField(varName: 'APTOS_NODE_API_BASE_URL')
  static const String aptosNodeApiBaseUrl = _Env.aptosNodeApiBaseUrl;

  @EnviedField(varName: 'SENTRY_DSN')
  static const String sentryDsn = _Env.sentryDsn;
}
