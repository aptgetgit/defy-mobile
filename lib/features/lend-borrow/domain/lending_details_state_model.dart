import 'package:defy/features/lend-borrow/domain/lend_borrow_model.dart';

class LendingDetailsStateModel {
  final LendBorrowModel selectedTile;

  LendingDetailsStateModel({required this.selectedTile});

  LendingDetailsStateModel copyWith({
    LendBorrowModel? selectedTile,
  }) {
    return LendingDetailsStateModel(
      selectedTile: selectedTile ?? this.selectedTile,
    );
  }
}