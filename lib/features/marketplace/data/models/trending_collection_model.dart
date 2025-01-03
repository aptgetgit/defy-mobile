// ignore_for_file: invalid_annotation_target

import 'package:defy/features/marketplace/domain/entities/trending_collection_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/trending_collection_model.g.dart';
part 'generated/trending_collection_model.freezed.dart';

@freezed
class TrendingCollectionModel extends TrendingCollectionEntity with _$TrendingCollectionModel {
  factory TrendingCollectionModel({
    @JsonKey(name: 'id') required String? id,
    @JsonKey(name: 'current_trades_count') required int? currentTradesCount,
    @JsonKey(name: 'current_usd_volume') required String? currentUsdVolume,
    @JsonKey(name: 'current_volume') required String? currentVolume,
    @JsonKey(name: 'previous_trades_count') required int? previousTradesCount,
    @JsonKey(name: 'previous_usd_volume') required String? previousUsdVolume,
    @JsonKey(name: 'previous_volume') required String? previousVolume,
    @JsonKey(name: 'collection') required CollectionModel? collection,
  }) = _TrendingCollectionModel;

  factory TrendingCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$TrendingCollectionModelFromJson(json);
}

@freezed
class CollectionModel extends CollectionEntity with _$CollectionModel {
  factory CollectionModel({
    @JsonKey(name: 'id') required String? id,
    @JsonKey(name: 'slug') required String? slug,
    @JsonKey(name: 'title') required String? title,
    @JsonKey(name: 'supply') required int? supply,
    @JsonKey(name: 'cover_url') required String? coverUrl,
    @JsonKey(name: 'floor') required int? floor,
    @JsonKey(name: 'usd_volume') required double? usdVolume,
    @JsonKey(name: 'volume') required int? volume,
    @JsonKey(name: 'verified') required bool? verified,
  }) = _CollectionModel;

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionModelFromJson(json);
}