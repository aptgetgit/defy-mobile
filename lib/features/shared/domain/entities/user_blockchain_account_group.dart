import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_blockchain_account_group.freezed.dart';
part 'generated/user_blockchain_account_group.g.dart';

@freezed
class UserBlockchainAccountGroup with _$UserBlockchainAccountGroup {
  const UserBlockchainAccountGroup._();

  const factory UserBlockchainAccountGroup(
      {required String id,
      required String name,
      required String icon,
      required String color}) = _UserBlockchainAccountGroup;

  factory UserBlockchainAccountGroup.fromJson(Map<String, dynamic> json) =>
      _$UserBlockchainAccountGroupFromJson(json);
}
