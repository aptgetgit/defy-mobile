import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/remote/network_config_remote_model.dart';

part 'generated/network_config_remote_data_source.g.dart';

@RestApi()
abstract class NetworkConfigRemoteDataSource {
  factory NetworkConfigRemoteDataSource(Dio dio) =
      _NetworkConfigRemoteDataSource;

  @GET('/v1/blockchain-networks')
  Future<HttpResponse<NetworkConfigResponseModel>> getNetworks();

  @GET('/v1/blockchain-networks/{blockchain-network-id}')
  Future<HttpResponse<NetworkConfigRemoteModel>> getNetwork(
    @Path('blockchain-network-id') String blockchainNetworkId,
  );
}
