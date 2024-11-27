import 'package:defy/core/api/api_response.dart';
import 'package:defy/features/blockchain_account_group/data/models/remote/blockchain_account_group_remote_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/blockchain_account_group_remote_source.g.dart';

@RestApi()
abstract class BlockchainAccountGroupRemoteDataSource {
  factory BlockchainAccountGroupRemoteDataSource(Dio dio) =
      _BlockchainAccountGroupRemoteDataSource;

  @POST("/v1/blockchain-account-groups")
  Future<ApiResponse<BlockchainAccountGroupRemoteModel>>
      createBlockchainAccountGroup(
          @Body() CreateBlockchainAccountGroupRemoteRequest body);

  @GET("/v1/blockchain-account-groups")
  Future<ApiResponse<List<BlockchainAccountGroupRemoteModel>>>
      listBlockchainAccountGroups();

  @GET("/v1/blockchain-account-groups/{blockchain-account-group-id}")
  Future<ApiResponse<BlockchainAccountGroupRemoteModel>>
      getBlockchainAccountGroup(
          @Path("blockchain-account-group-id") String blockchainAccountGroupId);

  @PUT("/v1/blockchain-account-groups/{blockchain-account-group-id}")
  Future<ApiResponse<BlockchainAccountGroupRemoteModel>>
      updateBlockchainAccountGroup(
          @Path("blockchain-account-group-id") String blockchainAccountGroupId,
          @Body() UpdateBlockchainAccountGroupRemoteRequest body);

  @DELETE("/v1/blockchain-account-groups/{blockchain-account-group-id}")
  Future<void> deleteBlockchainAccountGroup(
      @Path("blockchain-account-group-id") String blockchainAccountGroupId);
}
