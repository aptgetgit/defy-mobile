import 'package:defy/core/api/api_response.dart';
import 'package:defy/features/blockchain_account/data/models/remote/blockchain_account_remote_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/blockchain_account_remote_source.g.dart';

@RestApi()
abstract class BlockchainAccountRemoteDataSource {
  factory BlockchainAccountRemoteDataSource(Dio dio) =
      _BlockchainAccountRemoteDataSource;

  @POST("/v1/blockchain-accounts")
  Future<ApiResponse<BlockchainAccountRemoteModel>> createBlockchainAccount(
      @Body() CreateBlockchainAccountRemoteRequest body);

  @GET("/v1/blockchain-accounts")
  Future<ApiResponse<List<BlockchainAccountRemoteModel>>>
      listBlockchainAccounts({
    @Query("namespace") String? namespace,
    @Query("reference") String? reference,
  });

  @GET("/v1/blockchain-accounts/{blockchain-account-id}")
  Future<ApiResponse<BlockchainAccountRemoteModel>> getBlockchainAccount(
      @Path("blockchain-account-id") String blockchainAccountId);

  @DELETE("/v1/blockchain-accounts/{blockchain-account-id}")
  Future<void> deleteBlockchainAccount(
      @Path("blockchain-account-id") String blockchainAccountId);
}
