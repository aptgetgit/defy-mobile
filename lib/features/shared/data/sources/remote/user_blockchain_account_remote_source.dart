import 'package:defy/core/api/api_response.dart';
import 'package:defy/features/shared/data/models/user_blockchain_account/user_blockchain_account_remote_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/user_blockchain_account_remote_source.g.dart';

@RestApi()
abstract class UserBlockchainAccountRemoteDataSource {
  factory UserBlockchainAccountRemoteDataSource(Dio dio) = _UserBlockchainAccountRemoteDataSource;

  @POST("/v1/blockchain-accounts")
  Future<ApiResponse<UserBlockchainAccountRemoteModel>> createUserBlockchainAccount(
      @Body() CreateUserBlockchainAccountRemoteRequest body);

  @GET("/v1/blockchain-accounts")
  Future<ApiResponse<List<UserBlockchainAccountRemoteModel>>>
      listUserBlockchainAccounts({
    @Query("namespace") String? namespace,
    @Query("reference") String? reference,
  });

  @GET("/v1/blockchain-accounts/{blockchain-account-id}")
  Future<ApiResponse<UserBlockchainAccountRemoteModel>> getUserBlockchainAccount(
      @Path("blockchain-account-id") String blockchainAccountId);

  @DELETE("/v1/blockchain-accounts/{blockchain-account-id}")
  Future<void> deleteUserBlockchainAccount(
      @Path("blockchain-account-id") String blockchainAccountId);
}
