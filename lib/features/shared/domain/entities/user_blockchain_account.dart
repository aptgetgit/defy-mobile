import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_blockchain_account.freezed.dart';
part 'generated/user_blockchain_account.g.dart';

@Freezed(fromJson: true)
class UserBlockchainAccount with _$UserBlockchainAccount {
  const UserBlockchainAccount._();

  const factory UserBlockchainAccount({
    required String id,
    required String accountAddress,
    required String blockchainNetworkId
  }) = _UserBlockchainAccount;

  factory UserBlockchainAccount.fromJson(Map<String, dynamic> json) =>
      _$UserBlockchainAccountFromJson(json);
}