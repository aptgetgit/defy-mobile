// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../nft_collection_buy_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NFTCollectionBuyStateModelImpl _$$NFTCollectionBuyStateModelImplFromJson(
        Map json) =>
    $checkedCreate(
      r'_$NFTCollectionBuyStateModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'selected_n_f_ts',
            'sort_by',
            'is_ascending',
            'filter',
            'sweep_value'
          ],
        );
        final val = _$NFTCollectionBuyStateModelImpl(
          selectedNFTs: $checkedConvert(
              'selected_n_f_ts',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toSet() ??
                  const {}),
          sortBy: $checkedConvert(
              'sort_by', (v) => v as String? ?? "Collection Volume"),
          isAscending:
              $checkedConvert('is_ascending', (v) => v as bool? ?? true),
          filter: $checkedConvert(
              'filter',
              (v) =>
                  (v as Map?)?.map(
                    (k, e) => MapEntry(k as String, e),
                  ) ??
                  const {}),
          sweepValue: $checkedConvert(
              'sweep_value', (v) => (v as num?)?.toDouble() ?? 0.0),
        );
        return val;
      },
      fieldKeyMap: const {
        'selectedNFTs': 'selected_n_f_ts',
        'sortBy': 'sort_by',
        'isAscending': 'is_ascending',
        'sweepValue': 'sweep_value'
      },
    );

const _$$NFTCollectionBuyStateModelImplFieldMap = <String, String>{
  'selectedNFTs': 'selected_n_f_ts',
  'sortBy': 'sort_by',
  'isAscending': 'is_ascending',
  'filter': 'filter',
  'sweepValue': 'sweep_value',
};

abstract final class _$$NFTCollectionBuyStateModelImplJsonKeys {
  static const String selectedNFTs = 'selected_n_f_ts';
  static const String sortBy = 'sort_by';
  static const String isAscending = 'is_ascending';
  static const String filter = 'filter';
  static const String sweepValue = 'sweep_value';
}

// ignore: unused_element
abstract class _$$NFTCollectionBuyStateModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? selectedNFTs(Set<String> instance) => instance.toList();
  // ignore: unused_element
  static Object? sortBy(String instance) => instance;
  // ignore: unused_element
  static Object? isAscending(bool instance) => instance;
  // ignore: unused_element
  static Object? filter(Map<String, dynamic> instance) => instance;
  // ignore: unused_element
  static Object? sweepValue(double instance) => instance;
}
