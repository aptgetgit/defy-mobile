// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../nft_marketplace_sell_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NFTMarketplaceSellStateImpl _$$NFTMarketplaceSellStateImplFromJson(
        Map json) =>
    $checkedCreate(
      r'_$NFTMarketplaceSellStateImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'is_selection_mode',
            'selected_n_f_ts',
            'expanded_states',
            'sort_by',
            'is_ascending'
          ],
        );
        final val = _$NFTMarketplaceSellStateImpl(
          isSelectionMode:
              $checkedConvert('is_selection_mode', (v) => v as bool? ?? true),
          selectedNFTs: $checkedConvert(
              'selected_n_f_ts',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toSet() ??
                  const {}),
          expandedStates: $checkedConvert(
              'expanded_states',
              (v) =>
                  (v as Map?)?.map(
                    (k, e) => MapEntry(k as String, e as bool),
                  ) ??
                  const {}),
          sortBy: $checkedConvert(
              'sort_by', (v) => v as String? ?? "Collection Volume"),
          isAscending:
              $checkedConvert('is_ascending', (v) => v as bool? ?? true),
        );
        return val;
      },
      fieldKeyMap: const {
        'isSelectionMode': 'is_selection_mode',
        'selectedNFTs': 'selected_n_f_ts',
        'expandedStates': 'expanded_states',
        'sortBy': 'sort_by',
        'isAscending': 'is_ascending'
      },
    );

const _$$NFTMarketplaceSellStateImplFieldMap = <String, String>{
  'isSelectionMode': 'is_selection_mode',
  'selectedNFTs': 'selected_n_f_ts',
  'expandedStates': 'expanded_states',
  'sortBy': 'sort_by',
  'isAscending': 'is_ascending',
};

abstract final class _$$NFTMarketplaceSellStateImplJsonKeys {
  static const String isSelectionMode = 'is_selection_mode';
  static const String selectedNFTs = 'selected_n_f_ts';
  static const String expandedStates = 'expanded_states';
  static const String sortBy = 'sort_by';
  static const String isAscending = 'is_ascending';
}

// ignore: unused_element
abstract class _$$NFTMarketplaceSellStateImplPerFieldToJson {
  // ignore: unused_element
  static Object? isSelectionMode(bool instance) => instance;
  // ignore: unused_element
  static Object? selectedNFTs(Set<String> instance) => instance.toList();
  // ignore: unused_element
  static Object? expandedStates(Map<String, bool> instance) => instance;
  // ignore: unused_element
  static Object? sortBy(String instance) => instance;
  // ignore: unused_element
  static Object? isAscending(bool instance) => instance;
}

Map<String, dynamic> _$$NFTMarketplaceSellStateImplToJson(
        _$NFTMarketplaceSellStateImpl instance) =>
    <String, dynamic>{
      'is_selection_mode': instance.isSelectionMode,
      'selected_n_f_ts': instance.selectedNFTs.toList(),
      'expanded_states': instance.expandedStates,
      'sort_by': instance.sortBy,
      'is_ascending': instance.isAscending,
    };
