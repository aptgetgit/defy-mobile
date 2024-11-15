// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../swap_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SwapEntityImpl _$$SwapEntityImplFromJson(Map<String, dynamic> json) =>
    _$SwapEntityImpl(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : SwapDataEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SwapEntityImplToJson(_$SwapEntityImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

_$SwapDataEntityImpl _$$SwapDataEntityImplFromJson(Map<String, dynamic> json) =>
    _$SwapDataEntityImpl(
      srcCoinType: json['srcCoinType'] as String?,
      dstCoinType: json['dstCoinType'] as String?,
      srcAmount: json['srcAmount'] as String?,
      dstAmount: json['dstAmount'] as String?,
      paths: (json['paths'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map(
                  (e) => SwapPathItemEntity.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$$SwapDataEntityImplToJson(
        _$SwapDataEntityImpl instance) =>
    <String, dynamic>{
      'srcCoinType': instance.srcCoinType,
      'dstCoinType': instance.dstCoinType,
      'srcAmount': instance.srcAmount,
      'dstAmount': instance.dstAmount,
      'paths': instance.paths,
    };

_$SwapPathItemEntityImpl _$$SwapPathItemEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$SwapPathItemEntityImpl(
      poolId: json['poolId'] as String?,
      source: json['source'] as String?,
      sourceType: json['sourceType'] as String?,
      srcCoinType: json['srcCoinType'] as String?,
      dstCoinType: json['dstCoinType'] as String?,
      srcAmount: json['srcAmount'] as String?,
      dstAmount: json['dstAmount'] as String?,
      metadata: json['metadata'] == null
          ? null
          : SwapPathMetadataEntity.fromJson(
              json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SwapPathItemEntityImplToJson(
        _$SwapPathItemEntityImpl instance) =>
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

_$SwapPathMetadataEntityImpl _$$SwapPathMetadataEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$SwapPathMetadataEntityImpl(
      isXToY: json['isXToY'] as bool?,
      tokenInIndex: (json['tokenInIndex'] as num?)?.toInt(),
      tokenOutIndex: (json['tokenOutIndex'] as num?)?.toInt(),
      tokenInWeight: (json['tokenInWeight'] as num?)?.toInt(),
      tokenOutWeight: (json['tokenOutWeight'] as num?)?.toInt(),
      isStable: json['isStable'] as bool?,
      marketId: (json['marketId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SwapPathMetadataEntityImplToJson(
        _$SwapPathMetadataEntityImpl instance) =>
    <String, dynamic>{
      'isXToY': instance.isXToY,
      'tokenInIndex': instance.tokenInIndex,
      'tokenOutIndex': instance.tokenOutIndex,
      'tokenInWeight': instance.tokenInWeight,
      'tokenOutWeight': instance.tokenOutWeight,
      'isStable': instance.isStable,
      'marketId': instance.marketId,
    };
