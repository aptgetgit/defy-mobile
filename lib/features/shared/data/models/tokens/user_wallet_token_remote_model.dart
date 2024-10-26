import 'package:defy/features/shared/domain/entities/user_wallet_token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_wallet_token_remote_model.freezed.dart';
part 'generated/user_wallet_token_remote_model.g.dart';

@freezed
class UserWalletTokenRemoteModel with _$UserWalletTokenRemoteModel {
  factory UserWalletTokenRemoteModel({
    @JsonKey(name: 'metadata') required MetaDataModel? metaData,
    @JsonKey(name: 'owner_address') required String? ownerAddress,
    @JsonKey(name: 'amount') required int? amount,
    @JsonKey(name: 'asset_type') required String? assetType,
    @JsonKey(name: 'is_frozen') required bool? isFrozen,
  }) = _UserWalletTokenRemoteModel;

  factory UserWalletTokenRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$UserWalletTokenRemoteModelFromJson(json);

  UserWalletToken toDomain() => UserWalletToken(
        metaData: metaData?.toDomain(),
        ownerAddress: ownerAddress,
        amount: amount,
        assetType: assetType,
        isFrozen: isFrozen,
      );

  static UserWalletTokenRemoteModel fromDomain(UserWalletToken token) =>
      UserWalletTokenRemoteModel(
          metaData: MetaDataModel.fromDomain(token.metaData),
          ownerAddress: token.ownerAddress,
          amount: token.amount,
          assetType: token.assetType,
          isFrozen: token.isFrozen,
          );
}

@freezed
class MetaDataModel with _$MetaDataModel {
  factory MetaDataModel({
    @JsonKey(name: 'decimals') required int? decimals,
    @JsonKey(name: 'name') required String? name,
    @JsonKey(name: 'symbol') required String? symbol,
  }) = _MetaDataModel;

  factory MetaDataModel.fromJson(Map<String, dynamic> json) =>
      _$MetaDataModelFromJson(json);

  MetaDataEntity toDomain() => MetaDataEntity(
        decimals: decimals,
        name: name,
        symbol: symbol,
      );

  static MetaDataModel fromDomain(MetaDataEntity? metaData) => MetaDataModel(
        decimals: metaData?.decimals,
        name: metaData?.name,
        symbol: metaData?.symbol,
      );
}
