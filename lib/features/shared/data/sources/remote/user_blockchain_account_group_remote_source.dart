import 'package:defy/core/api/api_response.dart';
import 'package:defy/features/shared/data/models/user_blockchain_account_group/user_blockchain_account_group_remote_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/user_blockchain_account_group_remote_source.g.dart';

@RestApi()
abstract class UserBlockchainAccountGroupRemoteDataSource {
  factory UserBlockchainAccountGroupRemoteDataSource(Dio dio) = _UserBlockchainAccountGroupRemoteDataSource;

  @POST("/v1/blockchain-account-groups")
  Future<ApiResponse<UserBlockchainAccountGroupRemoteModel>> createUserBlockchainAccountGroup(
    @Body() CreateUserBlockchainAccountGroupRemoteRequest body
  );

  @GET("/v1/blockchain-account-groups")
  Future<ApiResponse<List<UserBlockchainAccountGroupRemoteModel>>> listUserBlockchainAccountGroups();

  @GET("/v1/blockchain-account-groups/{blockchain-account-group-id}")
  Future<ApiResponse<UserBlockchainAccountGroupRemoteModel>> getUserBlockchainAccountGroup(
    @Path("blockchain-account-group-id") String blockchainAccountGroupId
  );

  @PUT("/v1/blockchain-account-groups/{blockchain-account-group-id}")
  Future<ApiResponse<UserBlockchainAccountGroupRemoteModel>> updateUserBlockchainAccountGroup(
    @Path("blockchain-account-group-id") String blockchainAccountGroupId,
    @Body() UpdateUserBlockchainAccountGroupRemoteRequest body
  );

  @DELETE("/v1/blockchain-account-groups/{blockchain-account-group-id}")
  Future<void> deleteUserBlockchainAccountGroup(
    @Path("blockchain-account-group-id") String blockchainAccountGroupId
  );
}