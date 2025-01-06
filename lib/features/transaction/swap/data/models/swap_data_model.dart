import 'package:defy/features/transaction/swap/domain/entities/swap_data_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/swap_data_model.g.dart';
part 'generated/swap_data_model.freezed.dart';

@freezed
class SwapModel with _$SwapModel {
  const SwapModel._();
  factory SwapModel({
    @JsonKey(name: 'code') required int? code,
    @JsonKey(name: 'message') required String? message,
    @JsonKey(name: 'data') required SwapDataModel? data,
  }) = _SwapModel;

  factory SwapModel.fromJson(Map<String, dynamic> json) =>
      _$SwapModelFromJson(json);

  SwapEntity toDomain() {
    return SwapEntity(
      code: code,
      message: message,
      data: data?.toDomain(),
    );
  }
}

@freezed
class SwapDataModel with _$SwapDataModel {
  const SwapDataModel._();
  factory SwapDataModel({
    @JsonKey(name: 'srcCoinType') required String? srcCoinType,
    @JsonKey(name: 'dstCoinType') required String? dstCoinType,
    @JsonKey(name: 'srcAmount') required String? srcAmount,
    @JsonKey(name: 'dstAmount') required String? dstAmount,
    @JsonKey(name: 'paths') required List<List<SwapPathItemModel>> paths,
  }) = _SwapDataModel;

  factory SwapDataModel.fromJson(Map<String, dynamic> json) =>
      _$SwapDataModelFromJson(json);

  SwapDataEntity toDomain() {
    return SwapDataEntity(
      srcCoinType: srcCoinType,
      dstCoinType: dstCoinType,
      srcAmount: srcAmount,
      dstAmount: dstAmount,
      paths:
          paths.map((path) => path.map((p) => p.toDomain()).toList()).toList(),
    );
  }
}

@freezed
class SwapPathItemModel with _$SwapPathItemModel {
  const SwapPathItemModel._();
  factory SwapPathItemModel({
    @JsonKey(name: 'poolId') required String? poolId,
    @JsonKey(name: 'source') required String? source,
    @JsonKey(name: 'sourceType') required String? sourceType,
    @JsonKey(name: 'srcCoinType') required String? srcCoinType,
    @JsonKey(name: 'dstCoinType') required String? dstCoinType,
    @JsonKey(name: 'srcAmount') required String? srcAmount,
    @JsonKey(name: 'dstAmount') required String? dstAmount,
    @JsonKey(name: 'metadata') required SwapPathMetadataModel? metadata,
  }) = _SwapPathItemModel;

  factory SwapPathItemModel.fromJson(Map<String, dynamic> json) =>
      _$SwapPathItemModelFromJson(json);

  SwapPathItemEntity toDomain() {
    return SwapPathItemEntity(
      poolId: poolId,
      source: source,
      sourceType: sourceType,
      srcCoinType: srcCoinType,
      dstCoinType: dstCoinType,
      srcAmount: srcAmount,
      dstAmount: dstAmount,
      metadata: metadata?.toDomain(),
    );
  }
}

@freezed
class SwapPathMetadataModel with _$SwapPathMetadataModel {
  const SwapPathMetadataModel._();
  factory SwapPathMetadataModel({
    @JsonKey(name: 'isXToY') required bool? isXToY,
    @JsonKey(name: 'tokenInIndex') required int? tokenInIndex,
    @JsonKey(name: 'tokenOutIndex') required int? tokenOutIndex,
    @JsonKey(name: 'tokenInWeight') required int? tokenInWeight,
    @JsonKey(name: 'tokenOutWeight') required int? tokenOutWeight,
    @JsonKey(name: 'isStable') required bool? isStable,
    @JsonKey(name: 'marketId') required int? marketId,
  }) = _SwapPathMetadataModel;

  factory SwapPathMetadataModel.fromJson(Map<String, dynamic> json) =>
      _$SwapPathMetadataModelFromJson(json);

  SwapPathMetadataEntity toDomain() {
    return SwapPathMetadataEntity(
      isXToY: isXToY,
      tokenInIndex: tokenInIndex,
      tokenOutIndex: tokenOutIndex,
      tokenInWeight: tokenInWeight,
      tokenOutWeight: tokenOutWeight,
      isStable: isStable,
      marketId: marketId,
    );
  }
}
