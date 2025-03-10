import 'package:freezed_annotation/freezed_annotation.dart';

import 'watchlist_collection_model.dart';


part 'generated/watchlist_state.freezed.dart';

@freezed
class WatchlistState with _$WatchlistState {
  const factory WatchlistState({
    @Default([]) List<WatchlistCollection> collections,
    @Default(0) int selectedTabIndex,
    @Default(false) bool isDeleteMode,
    String? selectedCollectionId,
    String? editingCollectionId,
    String? newCollectionName,
  }) = _WatchlistState;

}
