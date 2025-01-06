// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../nft_marketplace_sell_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NFTMarketplaceSellStateImpl _$$NFTMarketplaceSellStateImplFromJson(
        Map<String, dynamic> json) =>
    _$NFTMarketplaceSellStateImpl(
      isSelectionMode: json['is_selection_mode'] as bool? ?? true,
      selectedNFTs: (json['selected_n_f_ts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const {},
      expandedStates: (json['expanded_states'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as bool),
          ) ??
          const {},
      sortBy: json['sort_by'] as String? ?? "Collection Volume",
      isAscending: json['is_ascending'] as bool? ?? true,
    );

Map<String, dynamic> _$$NFTMarketplaceSellStateImplToJson(
        _$NFTMarketplaceSellStateImpl instance) =>
    <String, dynamic>{
      'is_selection_mode': instance.isSelectionMode,
      'selected_n_f_ts': instance.selectedNFTs.toList(),
      'expanded_states': instance.expandedStates,
      'sort_by': instance.sortBy,
      'is_ascending': instance.isAscending,
    };
