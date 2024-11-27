import 'package:ory_kratos_client/ory_kratos_client.dart';

class OryKratosClientService {
  final OryKratosClient _client;

  OryKratosClientService(this._client);

  OryKratosClient get client => _client;

  FrontendApi get frontendApi => _client.getFrontendApi();
}
