import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/blockchain_account.dart';

part 'generated/blockchain_account_remote_model.freezed.dart';
part 'generated/blockchain_account_remote_model.g.dart';

@freezed
class BlockchainAccountRemoteModel with _$BlockchainAccountRemoteModel {
  const BlockchainAccountRemoteModel._();

  const factory BlockchainAccountRemoteModel({
    required String id,
    @JsonKey(name: 'blockchainNetworkId') required String blockchainNetworkId,
    @JsonKey(name: 'accountAddress') required String accountAddress,
  }) = _BlockchainAccountRemoteModel;

  factory BlockchainAccountRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$BlockchainAccountRemoteModelFromJson(json);

  BlockchainAccount toDomain() => BlockchainAccount(
        id: id,
        blockchainNetworkId: blockchainNetworkId,
        accountAddress: accountAddress,
      );

  static BlockchainAccountRemoteModel fromDomain(BlockchainAccount account) =>
      BlockchainAccountRemoteModel(
        id: account.id,
        blockchainNetworkId: account.blockchainNetworkId,
        accountAddress: account.accountAddress,
      );
}

@freezed
class CreateBlockchainAccountRemoteRequest
    with _$CreateBlockchainAccountRemoteRequest {
  const factory CreateBlockchainAccountRemoteRequest({
    @JsonKey(name: 'blockchainNetworkId') required String blockchainNetworkId,
    @JsonKey(name: 'accountAddress') required String accountAddress,
  }) = _CreateBlockchainAccountRemoteRequest;

  factory CreateBlockchainAccountRemoteRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CreateBlockchainAccountRemoteRequestFromJson(json);
}
