import 'package:defy/core/di/providers/network/kratos_dio_service_provider.dart';
import 'package:defy/core/services/ory_kratos_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ory_kratos_client/ory_kratos_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/ory_kratos_service_provider.g.dart';

@Riverpod(keepAlive: true)
OryKratosClient oryKratosClientInitializer(Ref ref) {
  final kratosDioService = ref.watch(kratosDioServiceProvider);
  return OryKratosClient(dio: kratosDioService);
}

@Riverpod(keepAlive: true)
OryKratosClientService oryKratosClientService(Ref ref) {
  final client = ref.watch(oryKratosClientInitializerProvider);
  return OryKratosClientService(client);
}
