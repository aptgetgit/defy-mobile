import 'package:defy/core/api/api_response.dart';
import 'package:defy/features/blockchain_account/data/models/remote/blockchain_account_remote_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/blockchain_account_group_assignment_remote_source.g.dart';

@RestApi()
abstract class BlockchainAccountGroupAssignmentRemoteDataSource {
  factory BlockchainAccountGroupAssignmentRemoteDataSource(Dio dio) =
      _BlockchainAccountGroupAssignmentRemoteDataSource;

  @GET(
      "/v1/blockchain-account-groups/{blockchain-account-group-id}/blockchain-accounts")
  Future<ApiResponse<List<BlockchainAccountRemoteModel>>>
      listBlockchainAccountGroupAssignments(
          @Path("blockchain-account-group-id") String blockchainAccountGroupId);

  @GET(
      "/v1/blockchain-account-groups/{blockchain-account-group-id}/blockchain-accounts/{blockchain-account-id}")
  Future<ApiResponse<BlockchainAccountRemoteModel>>
      getBlockchainAccountGroupAssignment(
          @Path("blockchain-account-group-id") String blockchainAccountGroupId,
          @Path("blockchain-account-id") String blockchainAccountId);

  @PUT(
      "/v1/blockchain-account-groups/{blockchain-account-group-id}/blockchain-accounts/{blockchain-account-id}")
  Future<ApiResponse<BlockchainAccountRemoteModel>>
      updateBlockchainAccountGroupAssignment(
          @Path("blockchain-account-group-id") String blockchainAccountGroupId,
          @Path("blockchain-account-id") String blockchainAccountId);

  @DELETE(
      "/v1/blockchain-account-groups/{blockchain-account-group-id}/blockchain-accounts/{blockchain-account-id}")
  Future<void> deleteBlockchainAccountGroupAssignment(
      @Path("blockchain-account-group-id") String blockchainAccountGroupId,
      @Path("blockchain-account-id") String blockchainAccountId);
}
