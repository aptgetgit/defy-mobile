import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/blockchain_account.freezed.dart';
part 'generated/blockchain_account.g.dart';

@freezed
class BlockchainAccount with _$BlockchainAccount {
  const BlockchainAccount._();

  const factory BlockchainAccount(
      {required String id,
      required String accountAddress,
      required String blockchainNetworkId}) = _BlockchainAccount;

  factory BlockchainAccount.fromJson(Map<String, dynamic> json) =>
      _$BlockchainAccountFromJson(json);
}
