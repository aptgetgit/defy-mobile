import 'package:defy/features/lend-borrow/domain/lend_borrow_model.dart';
import 'package:defy/features/lend-borrow/domain/lending_details_state_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/lending_provider.g.dart';

@Riverpod(keepAlive: true)
class LendingDetailsViewProvider extends _$LendingDetailsViewProvider {
  @override
  LendingDetailsStateModel build() {
    return LendingDetailsStateModel(
        selectedTile: LendBorrowModel(
            apy: '23%',
            name: 'zUSDC',
            asset: 'assets/images/lend-usdc.png',
            fee: '1.0000',
            value: '126,232,092'));
  }

  selectTile(selectedTile) async {
    state = state.copyWith(selectedTile: selectedTile);
    print('Selected Tile: ${state.selectedTile}');
    return state.selectedTile;
  }

  void clearSelectedTile() {
    state = state.copyWith(selectedTile: null);
  }
}
