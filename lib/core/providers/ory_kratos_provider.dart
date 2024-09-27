import 'package:defy/core/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ory_kratos_client/ory_kratos_client.dart';

part 'generated/ory_kratos_provider.g.dart';


@Riverpod(keepAlive: true)
OryKratosClient oryKratosClientInitializer(OryKratosClientInitializerRef ref) {
  final kratosDioService = ref.watch(kratosDioServiceProvider);
  return OryKratosClient(dio: kratosDioService);
}

@Riverpod(keepAlive: true)
OryKratosClientService oryKratosClientService(OryKratosClientServiceRef ref) {
  final client = ref.watch(oryKratosClientInitializerProvider);
  return OryKratosClientService(client);
}

class OryKratosClientService {
  final OryKratosClient _client;

  OryKratosClientService(this._client);

  OryKratosClient get client => _client;

  FrontendApi get frontendApi => _client.getFrontendApi();
}