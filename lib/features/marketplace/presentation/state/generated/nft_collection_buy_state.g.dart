// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../nft_collection_buy_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NFTCollectionBuyStateModelImpl _$$NFTCollectionBuyStateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NFTCollectionBuyStateModelImpl(
      selectedNFTs: (json['selected_n_f_ts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const {},
      sortBy: json['sort_by'] as String? ?? "Collection Volume",
      isAscending: json['is_ascending'] as bool? ?? true,
      filter: json['filter'] as Map<String, dynamic>? ?? const {},
      sweepValue: (json['sweep_value'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$NFTCollectionBuyStateModelImplToJson(
        _$NFTCollectionBuyStateModelImpl instance) =>
    <String, dynamic>{
      'selected_n_f_ts': instance.selectedNFTs.toList(),
      'sort_by': instance.sortBy,
      'is_ascending': instance.isAscending,
      'filter': instance.filter,
      'sweep_value': instance.sweepValue,
    };
