// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../swap_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SwapModelImpl _$$SwapModelImplFromJson(Map<String, dynamic> json) =>
    _$SwapModelImpl(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : SwapDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SwapModelImplToJson(_$SwapModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

_$SwapDataModelImpl _$$SwapDataModelImplFromJson(Map<String, dynamic> json) =>
    _$SwapDataModelImpl(
      srcCoinType: json['srcCoinType'] as String?,
      dstCoinType: json['dstCoinType'] as String?,
      srcAmount: json['srcAmount'] as String?,
      dstAmount: json['dstAmount'] as String?,
      paths: (json['paths'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => SwapPathItemModel.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$$SwapDataModelImplToJson(_$SwapDataModelImpl instance) =>
    <String, dynamic>{
      'srcCoinType': instance.srcCoinType,
      'dstCoinType': instance.dstCoinType,
      'srcAmount': instance.srcAmount,
      'dstAmount': instance.dstAmount,
      'paths': instance.paths,
    };

_$SwapPathItemModelImpl _$$SwapPathItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SwapPathItemModelImpl(
      poolId: json['poolId'] as String?,
      source: json['source'] as String?,
      sourceType: json['sourceType'] as String?,
      srcCoinType: json['srcCoinType'] as String?,
      dstCoinType: json['dstCoinType'] as String?,
      srcAmount: json['srcAmount'] as String?,
      dstAmount: json['dstAmount'] as String?,
      metadata: json['metadata'] == null
          ? null
          : SwapPathMetadataModel.fromJson(
              json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SwapPathItemModelImplToJson(
        _$SwapPathItemModelImpl instance) =>
    <String, dynamic>{
      'poolId': instance.poolId,
      'source': instance.source,
      'sourceType': instance.sourceType,
      'srcCoinType': instance.srcCoinType,
      'dstCoinType': instance.dstCoinType,
      'srcAmount': instance.srcAmount,
      'dstAmount': instance.dstAmount,
      'metadata': instance.metadata,
    };

_$SwapPathMetadataModelImpl _$$SwapPathMetadataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SwapPathMetadataModelImpl(
      isXToY: json['isXToY'] as bool?,
      tokenInIndex: (json['tokenInIndex'] as num?)?.toInt(),
      tokenOutIndex: (json['tokenOutIndex'] as num?)?.toInt(),
      tokenInWeight: (json['tokenInWeight'] as num?)?.toInt(),
      tokenOutWeight: (json['tokenOutWeight'] as num?)?.toInt(),
      isStable: json['isStable'] as bool?,
      marketId: (json['marketId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SwapPathMetadataModelImplToJson(
        _$SwapPathMetadataModelImpl instance) =>
    <String, dynamic>{
      'isXToY': instance.isXToY,
      'tokenInIndex': instance.tokenInIndex,
      'tokenOutIndex': instance.tokenOutIndex,
      'tokenInWeight': instance.tokenInWeight,
      'tokenOutWeight': instance.tokenOutWeight,
      'isStable': instance.isStable,
      'marketId': instance.marketId,
    };
