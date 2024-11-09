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

  @EnviedField(varName: 'DEFY_GRAPH_QL_ENDPOINT')  
  static const String defyGraphQlEndpoint = _Env.defyGraphQlEndpoint;

  @EnviedField(varName: 'DEFY_ADMIN_SECRET')
  static const String defyAdminSecret = _Env.defyAdminSecret;

  @EnviedField(varName: 'STAKING_LEND-BORROW_BASE_URL')
  static const String stakingLendBorrowBaseUrl = _Env.stakingLendBorrowBaseUrl;

  @EnviedField(varName: 'YIELD_AGGREDATOR_BASE_URL')
  static const String yieldAggregatorBaseUrl = _Env.yieldAggregatorBaseUrl;
}