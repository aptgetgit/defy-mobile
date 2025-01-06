import 'package:defy/features/marketplace/domain/entities/collection_details_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/collection_details_model.g.dart';
part 'generated/collection_details_model.freezed.dart';

@freezed
class CollectionDetailsModel extends CollectionDetailsEntity
    with _$CollectionDetailsModel {
  factory CollectionDetailsModel({
    @JsonKey(name: 'collections') required List<CollectionInfoModel>? collectionInfo,
    @JsonKey(name: 'listings') required List<CollectionListingsModel>? listings,
    @JsonKey(name: 'collection_stats') required CollectionStatsModel? stats,
    @JsonKey(name: 'actions') required List<CollectionActivityModel>? activity,
  }) = _CollectionDetailsModel;

  factory CollectionDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionDetailsModelFromJson(json);
}


@freezed 
class CollectionInfoModel extends CollectionInfoEntity with _$CollectionInfoModel {
  factory CollectionInfoModel({
    @JsonKey(name: 'id') required String? id,
    @JsonKey(name: 'title') required String? title,
    @JsonKey(name: 'slug') required String? slug,
    @JsonKey(name: 'semantic_slug') required String? semanticSlug,
    @JsonKey(name: 'description') required String? description,
    @JsonKey(name: 'floor') required int? floor,
    @JsonKey(name: 'volume') required int? volume,
    @JsonKey(name: 'usd_volume') required double? usdVolume,
    @JsonKey(name: 'cover_url') required String? coverUrl,
    @JsonKey(name: 'supply') required int? supply,
    @JsonKey(name: 'verified') required bool? verified,
    @JsonKey(name: 'discord') required String? discord,
    @JsonKey(name: 'twitter') required String? twitter,
    @JsonKey(name: 'website') required String? website,
  }) = _CollectionInfoModel;

  factory CollectionInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionInfoModelFromJson(json);
}

@freezed
class CollectionListingsModel extends CollectionListingsEntity
    with _$CollectionListingsModel {
  factory CollectionListingsModel({
    @JsonKey(name: 'id') required String? id,
    @JsonKey(name: 'price') required int? price,
    @JsonKey(name: 'block_time') required String? blockTime,
    @JsonKey(name: 'seller') required String? seller,
    @JsonKey(name: 'nft') required CollectionListingsNFTModel? nft,
    @JsonKey(name: 'contract') required CollectionListingsContractModel? contract,
  }) = _CollectionListingsModel;

  factory CollectionListingsModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionListingsModelFromJson(json);
}

@freezed
class CollectionListingsNFTModel extends CollectionListingsNFTEntity
    with _$CollectionListingsNFTModel {
  factory CollectionListingsNFTModel({
    @JsonKey(name: 'id') required String? id,
    @JsonKey(name: 'name') required String? name,
    @JsonKey(name: 'media_url') required String? mediaUrl,
    @JsonKey(name: 'media_type') required String? mediaType,
    @JsonKey(name: 'ranking') required int? ranking,
  }) = _CollectionListingsNFTModel;

  factory CollectionListingsNFTModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionListingsNFTModelFromJson(json);
}

@freezed
class CollectionListingsContractModel extends CollectionListingsContractEntity
    with _$CollectionListingsContractModel {
  factory CollectionListingsContractModel({
    @JsonKey(name: 'key') required String? key,
  }) = _CollectionListingsContractModel;

  factory CollectionListingsContractModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionListingsContractModelFromJson(json);
}

@freezed
class CollectionStatsModel extends CollectionStatsEntity
    with _$CollectionStatsModel {
  factory CollectionStatsModel({
    @JsonKey(name: 'total_mint_volume') required String? totalMintVolume,
    @JsonKey(name: 'total_mint_usd_volume') required String? totalMintUsdVolume,
    @JsonKey(name: 'total_sales') required int? totalSales,
    @JsonKey(name: 'total_usd_volume') required String? totalUsdVolume,
    @JsonKey(name: 'total_volume') required String? totalVolume,
    @JsonKey(name: 'day_volume') required String? dayVolume,
    @JsonKey(name: 'day_sales') required int? daySales,
    @JsonKey(name: 'day_usd_volume') required String? dayUsdVolume,
  }) = _CollectionStatsModel;

  factory CollectionStatsModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionStatsModelFromJson(json);
}

@freezed
class CollectionActivityModel extends CollectionActivityEntity
    with _$CollectionActivityModel {
  factory CollectionActivityModel({
    @JsonKey(name: 'id') required String? id,
    @JsonKey(name: 'type') required String? type,
    @JsonKey(name: 'price') required int? price,
    @JsonKey(name: 'usd_price') required double? usdPrice,
    @JsonKey(name: 'sender') required String? sender,
    @JsonKey(name: 'receiver') required String? receiver,
    @JsonKey(name: 'block_time') required String? blockTime,
    @JsonKey(name: 'nft') required CollectionActivityNFTModel? nft,

  }) = _CollectionActivityModel;

  factory CollectionActivityModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionActivityModelFromJson(json);
}

@freezed
class CollectionActivityNFTModel extends CollectionActivityNFTEntity
    with _$CollectionActivityNFTModel {
  factory CollectionActivityNFTModel({
    @JsonKey(name: 'id') required String? id,
    @JsonKey(name: 'name') required String? name,
    @JsonKey(name: 'media_url') required String? mediaUrl,
    @JsonKey(name: 'ranking') required int? ranking,
  }) = _CollectionActivityNFTModel;

  factory CollectionActivityNFTModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionActivityNFTModelFromJson(json);
}

