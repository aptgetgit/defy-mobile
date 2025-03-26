// providers/receive_provider.dart
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Define a model for the asset (optional, for better type safety)
class Asset {

  Asset({
    required this.name,
    required this.symbol,
    required this.imagePath,
  });
  final String name;
  final String symbol;
  final String imagePath;
}

// State for the receive flow
class ReceiveState {

  ReceiveState({
    required this.currentPage,
    this.selectedAsset,
    this.balanceOption,
  });
  final int currentPage; // 1, 2, or 3
  final Asset? selectedAsset;
  final String? balanceOption;

  ReceiveState copyWith({int? currentPage, Asset? selectedAsset}) => ReceiveState(
      currentPage: currentPage ?? this.currentPage,
      selectedAsset: selectedAsset ?? this.selectedAsset,
    );
}

// StateNotifier for managing the receive flow
class ReceiveNotifier extends StateNotifier<ReceiveState> {
  ReceiveNotifier() : super(ReceiveState(currentPage: 1));

  void setPage(int page) {
    state = state.copyWith(currentPage: page);
  }

  void selectAsset(Asset asset) {
    state = state.copyWith(selectedAsset: asset);
  }

  void clearSelection() {
    state = state.copyWith(selectedAsset: null);
  }
}

// Provider for the receive flow
final StateNotifierProvider<ReceiveNotifier, ReceiveState> receiveProvider = StateNotifierProvider<ReceiveNotifier, ReceiveState>((StateNotifierProviderRef<ReceiveNotifier, ReceiveState> ref) => ReceiveNotifier());
