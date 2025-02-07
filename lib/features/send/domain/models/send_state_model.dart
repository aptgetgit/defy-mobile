part of '../../presentation/providers/send_provider.dart';


class SendToState<T extends SelectableItem> {
  final bool isSelectionMode;
  final List<bool> tileSelected;
  final List<T> selectedToItems;
  

  SendToState({
    required this.isSelectionMode,
    required this.tileSelected,
    required this.selectedToItems,
  });

  int get selectedCount => selectedToItems.length;

  SendToState<T> copyWith({
    bool? isSelectionMode,
    List<bool>? tileSelected,
    List<T>? selectedItems,
  }) {
    return SendToState<T>(
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
      tileSelected: tileSelected ?? this.tileSelected,
      selectedToItems: selectedItems ?? this.selectedToItems,
    );
  }
}

class SendScreenState {
  final bool seeMore;
  final TextEditingController searchController ;

  SendScreenState({
    required this.seeMore,
    required this.searchController,
  });

  SendScreenState copyWith({
    bool? seeMore,
    TextEditingController? searchController,
  }) {
    return SendScreenState(
      seeMore: seeMore ?? this.seeMore,
      searchController: searchController ?? this.searchController,
    );
  }
}
