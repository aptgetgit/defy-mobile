import 'package:defy/core/api/api_response.dart';
import 'package:defy/features/shared/data/models/user_blockchain_account/user_blockchain_account_remote_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/user_blockchain_account_group_assignment_remote_source.g.dart';

@RestApi()
abstract class UserBlockchainAccountGroupAssignmentRemoteDataSource {
  factory UserBlockchainAccountGroupAssignmentRemoteDataSource(Dio dio) = _UserBlockchainAccountGroupAssignmentRemoteDataSource;

  @GET("/v1/blockchain-account-groups/{blockchain-account-group-id}/blockchain-accounts")
  Future<ApiResponse<List<UserBlockchainAccountRemoteModel>>> listUserBlockchainAccountGroupAssignments(
    @Path("blockchain-account-group-id") String blockchainAccountGroupId
  );

  @GET("/v1/blockchain-account-groups/{blockchain-account-group-id}/blockchain-accounts/{blockchain-account-id}")
  Future<ApiResponse<UserBlockchainAccountRemoteModel>> getUserBlockchainAccountGroupAssignment(
    @Path("blockchain-account-group-id") String blockchainAccountGroupId,
    @Path("blockchain-account-id") String blockchainAccountId
  );

  @PUT("/v1/blockchain-account-groups/{blockchain-account-group-id}/blockchain-accounts/{blockchain-account-id}")
  Future<ApiResponse<UserBlockchainAccountRemoteModel>> updateUserBlockchainAccountGroupAssignment(
    @Path("blockchain-account-group-id") String blockchainAccountGroupId,
    @Path("blockchain-account-id") String blockchainAccountId
  );

  @DELETE("/v1/blockchain-account-groups/{blockchain-account-group-id}/blockchain-accounts/{blockchain-account-id}")
  Future<void> deleteUserBlockchainAccountGroupAssignment(
    @Path("blockchain-account-group-id") String blockchainAccountGroupId,
    @Path("blockchain-account-id") String blockchainAccountId
  );
}