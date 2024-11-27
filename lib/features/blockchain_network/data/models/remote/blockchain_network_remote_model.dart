import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/blockchain_network.dart';

part 'generated/blockchain_network_remote_model.freezed.dart';
part 'generated/blockchain_network_remote_model.g.dart';

@freezed
class BlockchainNetworkRemoteModel with _$BlockchainNetworkRemoteModel {
  const BlockchainNetworkRemoteModel._();

  const factory BlockchainNetworkRemoteModel({
    required String id,
    @JsonKey(name: 'namespace') required String namespace,
    @JsonKey(name: 'reference') required String reference,
  }) = _BlockchainNetworkRemoteModel;

  factory BlockchainNetworkRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$BlockchainNetworkRemoteModelFromJson(json);

  BlockchainNetwork toDomain() => BlockchainNetwork(
        id: id,
        namespace: namespace,
        reference: reference,
      );

  static BlockchainNetworkRemoteModel fromDomain(BlockchainNetwork network) =>
      BlockchainNetworkRemoteModel(
        id: network.id,
        namespace: network.namespace,
        reference: network.reference,
      );
}
