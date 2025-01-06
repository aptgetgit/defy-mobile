import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_wallet_token.freezed.dart';
part 'generated/user_wallet_token.g.dart';

@freezed
class UserWalletToken with _$UserWalletToken {
  const UserWalletToken._();

  const factory UserWalletToken({
  required MetaDataEntity? metaData,
  required String? ownerAddress,
  required int? amount,
  required String? assetType,
  required bool? isFrozen,
  }) = _UserWalletToken;

  factory UserWalletToken.fromJson(Map<String, dynamic> json) =>
      _$UserWalletTokenFromJson(json);
}

@freezed
class MetaDataEntity with _$MetaDataEntity {
  const MetaDataEntity._();

  const factory MetaDataEntity({
  required int? decimals,
  required String? name,
  required String? symbol,
  }) = _MetaDataEntity;

  factory MetaDataEntity.fromJson(Map<String, dynamic> json) =>
      _$MetaDataEntityFromJson(json);
}
