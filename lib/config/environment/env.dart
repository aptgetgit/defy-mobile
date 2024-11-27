import 'package:envied/envied.dart';
part 'generated/env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'API_BASE_URL')
  static const String apiBaseUrl = _Env.apiBaseUrl;

  @EnviedField(varName: 'ORY_KRATOS_ENDPOINT')
  static const String oryKratosEndpoint = _Env.oryKratosEndpoint;

  @EnviedField(varName: 'GOOGLE_WEB_APPLICATION_CLIENT_ID')
  static const String googleWebApplicationClientId =
      _Env.googleWebApplicationClientId;
}
