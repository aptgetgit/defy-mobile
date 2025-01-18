import 'package:envied/envied.dart';
part 'generated/env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'API_BASE_URL')
  static const String apiBaseUrl = _Env.apiBaseUrl;
}
