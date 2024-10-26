import 'package:envied/envied.dart';
part 'generated/env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'API_BASE_URL')
  static const String apiBaseUrl = _Env.apiBaseUrl;

  @EnviedField(varName: 'ORY_KRATOS_ENDPOINT')
  static const String oryKratosEndpoint = _Env.oryKratosEndpoint;

  @EnviedField(varName: 'GOOGLE_WEB_APPLICATION_CLIENT_ID')
  static const String googleWebApplicationClientId = _Env.googleWebApplicationClientId;

  @EnviedField(varName: 'TRADE_PORT_GRAPH_QL_ENDPOINT')
  static const String tradePortGraphQlEndpoint = _Env.tradePortGraphQlEndpoint;

  @EnviedField(varName: 'TRADE_PORT_API_KEY')
  static const String tradePortApiKey = _Env.tradePortApiKey;

  @EnviedField(varName: 'TRADE_PORT_API_USER')
  static const String tradePortApiUser = _Env.tradePortApiUser;

  @EnviedField(varName: 'APTOS_GRAPH_QL_ENDPOINT')
  static const String aptosGraphQlEndpoint = _Env.aptosGraphQlEndpoint;

  @EnviedField(varName: 'DEFY_GRAPH_QL_ENDPOINT')
  static const String defyGraphQlEndpoint = _Env.defyGraphQlEndpoint;

  @EnviedField(varName: 'DEFY_ADMIN_SECRET')
  static const String defyAdminSecret = _Env.defyAdminSecret;
}