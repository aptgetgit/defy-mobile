import 'package:defy/core/api/api_response.dart';
import 'package:defy/features/shared/data/models/blockchain_network/blockchain_network_remote_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/blockchain_network_remote_source.g.dart';

@RestApi()
abstract class BlockchainNetworkRemoteDataSource {
  factory BlockchainNetworkRemoteDataSource(Dio dio) =
      _BlockchainNetworkRemoteDataSource;

  @GET("/v1/blockchain-networks")
  Future<ApiResponse<List<BlockchainNetworkRemoteModel>>>
      listBlockchainNetworks();

  @GET("/v1/blockchain-networks/{blockchain-network-id}")
  Future<ApiResponse<BlockchainNetworkRemoteModel>> getBlockchainNetwork(
      @Path("blockchain-network-id") String blockchainNetworkId);
}
