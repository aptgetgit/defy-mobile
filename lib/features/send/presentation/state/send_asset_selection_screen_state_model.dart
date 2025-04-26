
import '../../domain/models/selectable_item_model.dart';


class SendAssetSelectionScreenState<T extends SelectableItem> {
  final List<T> selectedAssetItems;
  final bool isMulti;
  bool isSelectionMode;

  final List<bool> tileSelected;

  SendAssetSelectionScreenState({
    required this.selectedAssetItems,
    required this.isMulti,
    required this.isSelectionMode,
    required this.tileSelected,
  });

  SendAssetSelectionScreenState copyWith({
    List<T>? selectedAssetItems,
    bool? isMulti,
    bool? isSelectionMode,
    List<bool>? tileSelected,
  }) {
    return SendAssetSelectionScreenState(
      selectedAssetItems: selectedAssetItems ?? this.selectedAssetItems,
      isMulti: isMulti ?? this.isMulti,
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
      tileSelected: tileSelected ?? this.tileSelected,
    );
  }
}


