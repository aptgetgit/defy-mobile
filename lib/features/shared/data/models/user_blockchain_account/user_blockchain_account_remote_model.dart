import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user_blockchain_account.dart';

part 'generated/user_blockchain_account_remote_model.freezed.dart';
part 'generated/user_blockchain_account_remote_model.g.dart';

@Freezed(fromJson: true, toJson: true)
class UserBlockchainAccountRemoteModel with _$UserBlockchainAccountRemoteModel {
  const UserBlockchainAccountRemoteModel._();

  const factory UserBlockchainAccountRemoteModel({
    required String id,
    @JsonKey(name: 'blockchainNetworkId') required String blockchainNetworkId,
    @JsonKey(name: 'accountAddress') required String accountAddress,
  }) = _UserBlockchainAccountRemoteModel;

   factory UserBlockchainAccountRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$UserBlockchainAccountRemoteModelFromJson(json);

  UserBlockchainAccount toDomain() => UserBlockchainAccount(
        id: id,
        blockchainNetworkId: blockchainNetworkId,
        accountAddress: accountAddress,
      );

  static UserBlockchainAccountRemoteModel fromDomain(UserBlockchainAccount account) =>
      UserBlockchainAccountRemoteModel(
        id: account.id,
        blockchainNetworkId: account.blockchainNetworkId,
        accountAddress: account.accountAddress,
      );
}

@Freezed(fromJson: true, toJson: true)
class CreateUserBlockchainAccountRemoteRequest with _$CreateUserBlockchainAccountRemoteRequest {
  const factory CreateUserBlockchainAccountRemoteRequest({
    @JsonKey(name: 'blockchainNetworkId') required String blockchainNetworkId,
    @JsonKey(name: 'accountAddress') required String accountAddress,
  }) = _CreateUserBlockchainAccountRemoteRequest;

  factory CreateUserBlockchainAccountRemoteRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserBlockchainAccountRemoteRequestFromJson(json);
}