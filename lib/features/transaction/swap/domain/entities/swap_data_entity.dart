import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/swap_data_entity.g.dart';
part 'generated/swap_data_entity.freezed.dart';

@freezed
class SwapEntity with _$SwapEntity {
  factory SwapEntity({
    required int? code,
    required String? message,
    required SwapDataEntity? data,
  }) = _SwapEntity;

  factory SwapEntity.fromJson(Map<String, dynamic> json) =>
      _$SwapEntityFromJson(json);
}

@freezed
class SwapDataEntity with _$SwapDataEntity {
  factory SwapDataEntity({
    @JsonKey(name: 'srcCoinType') required String? srcCoinType,
    @JsonKey(name: 'dstCoinType') required String? dstCoinType,
    @JsonKey(name: 'srcAmount') required String? srcAmount,
    @JsonKey(name: 'dstAmount') required String? dstAmount,
    @JsonKey(name: 'paths') required List<List<SwapPathItemEntity>> paths,
  }) = _SwapDataEntity;

  factory SwapDataEntity.fromJson(Map<String, dynamic> json) =>
      _$SwapDataEntityFromJson(json);
}

@freezed
class SwapPathItemEntity with _$SwapPathItemEntity {
  factory SwapPathItemEntity({
    @JsonKey(name: 'poolId') required String? poolId,
    @JsonKey(name: 'source') required String? source,
    @JsonKey(name: 'sourceType') required String? sourceType,
    @JsonKey(name: 'srcCoinType') required String? srcCoinType,
    @JsonKey(name: 'dstCoinType') required String? dstCoinType,
    @JsonKey(name: 'srcAmount') required String? srcAmount,
    @JsonKey(name: 'dstAmount') required String? dstAmount,
    @JsonKey(name: 'metadata') required SwapPathMetadataEntity? metadata,
  }) = _SwapPathItemEntity;

  factory SwapPathItemEntity.fromJson(Map<String, dynamic> json) =>
      _$SwapPathItemEntityFromJson(json);
}

@freezed
class SwapPathMetadataEntity with _$SwapPathMetadataEntity {
  factory SwapPathMetadataEntity({
    @JsonKey(name: 'isXToY') required bool? isXToY,
    @JsonKey(name: 'tokenInIndex') required int? tokenInIndex,
    @JsonKey(name: 'tokenOutIndex') required int? tokenOutIndex,
    @JsonKey(name: 'tokenInWeight') required int? tokenInWeight,
    @JsonKey(name: 'tokenOutWeight') required int? tokenOutWeight,
    @JsonKey(name: 'isStable') required bool? isStable,
    @JsonKey(name: 'marketId') required int? marketId,
  }) = _SwapPathMetadataEntity;

  factory SwapPathMetadataEntity.fromJson(Map<String, dynamic> json) =>
      _$SwapPathMetadataEntityFromJson(json);
}