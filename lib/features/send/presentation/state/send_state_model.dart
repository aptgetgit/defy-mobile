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
  }) => SendToState<T>(
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
      tileSelected: tileSelected ?? this.tileSelected,
      selectedToItems: selectedItems ?? this.selectedToItems,
    );
}


class SendNFTState<T extends SelectableItem> {
  final bool isSelectionMode;
  final List<bool> tileSelected;
  final List<T> selectedNFTs;
  final TextEditingController searchController;
  final bool seeMore;

  SendNFTState({
    required this.isSelectionMode,
    required this.tileSelected,
    required this.selectedNFTs,
    required this.searchController,
    required this.seeMore,
  });

  int get selectedCount => selectedNFTs.length;

  SendNFTState<T> copyWith({
    bool? isSelectionMode,
    List<bool>? tileSelected,
    List<T>? selectedNFTs,
    TextEditingController? searchController,
    bool? seeMore,
  }) => SendNFTState<T>(
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
      tileSelected: tileSelected ?? this.tileSelected,
      selectedNFTs: selectedNFTs ?? this.selectedNFTs,
      searchController: searchController ?? this.searchController,
      seeMore: seeMore ?? this.seeMore,
    );
}

class SendScreenState {
  final bool seeMore;
  final TextEditingController searchController;

  SendScreenState({
    required this.seeMore,
    required this.searchController,
  });

  SendScreenState copyWith({
    bool? seeMore,
    TextEditingController? searchController,
  }) => SendScreenState(
      seeMore: seeMore ?? this.seeMore,
      searchController: searchController ?? this.searchController,
    );
}
