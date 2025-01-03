import 'package:defy/features/marketplace/domain/entities/wallet_inventory_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/wallet_inventory_model.freezed.dart';
part 'generated/wallet_inventory_model.g.dart';

@freezed
class WalletInventoryModel extends WalletInventoryEntity with _$WalletInventoryModel {
  factory WalletInventoryModel({
    @JsonKey(name: 'aptos') required AptosModel aptos,
  }) = _WalletInventoryModel;

  factory WalletInventoryModel.fromJson(Map<String, dynamic> json) =>
      _$WalletInventoryModelFromJson(json);
}

@freezed
class AptosModel extends AptosEntity with _$AptosModel {
  factory AptosModel({
    @JsonKey(name: 'collections') required List<CollectionModel> collections,
  }) = _AptosModel;

  factory AptosModel.fromJson(Map<String, dynamic> json) =>
      _$AptosModelFromJson(json);
}

@freezed
class CollectionModel extends CollectionEntity with _$CollectionModel {
  factory CollectionModel({
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'floor') double? floor,
    @JsonKey(name: 'usd_volume') double? usdVolume,
    @JsonKey(name: 'verified') required bool verified,
    @JsonKey(name: 'cover_url') String? coverUrl,
    @JsonKey(name: 'nfts') required List<NFTModel> nfts,
  }) = _CollectionModel;

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionModelFromJson(json);
}

@freezed
class NFTModel extends NFTEntity with _$NFTModel {
  factory NFTModel({
    @JsonKey(name: 'media_url') required String mediaUrl,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'owner') required String owner,
    @JsonKey(name: 'collection') required CollectionTitleModel collection,
  }) = _NFTModel;

  factory NFTModel.fromJson(Map<String, dynamic> json) =>
      _$NFTModelFromJson(json);
}

@freezed
class CollectionTitleModel extends CollectionTitleEntity with _$CollectionTitleModel {
  factory CollectionTitleModel({
    @JsonKey(name: 'title') required String title,
  }) = _CollectionTitleModel;

  factory CollectionTitleModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionTitleModelFromJson(json);
}