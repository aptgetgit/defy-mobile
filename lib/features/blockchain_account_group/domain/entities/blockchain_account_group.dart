import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/blockchain_account_group.freezed.dart';
part 'generated/blockchain_account_group.g.dart';

@freezed
class BlockchainAccountGroup with _$BlockchainAccountGroup {
  const BlockchainAccountGroup._();

  const factory BlockchainAccountGroup(
      {required String id,
      required String name,
      required String icon,
      required String color}) = _BlockchainAccountGroup;

  factory BlockchainAccountGroup.fromJson(Map<String, dynamic> json) =>
      _$BlockchainAccountGroupFromJson(json);
}
