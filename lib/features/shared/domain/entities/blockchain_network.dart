import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/blockchain_network.freezed.dart';
part 'generated/blockchain_network.g.dart';

@Freezed(fromJson: true)
class BlockchainNetwork with _$BlockchainNetwork {
  const BlockchainNetwork._();

  const factory BlockchainNetwork({
    required String id,
    required String namespace,
    required String reference,
  }) = _BlockchainNetwork;

  factory BlockchainNetwork.fromJson(Map<String, dynamic> json) =>
      _$BlockchainNetworkFromJson(json);

  String get caipBlockchainId => '$namespace:$reference';
}