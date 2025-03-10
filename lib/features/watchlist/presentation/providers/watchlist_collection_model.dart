import 'package:freezed_annotation/freezed_annotation.dart';

import 'watchlist_item_model.dart';

part 'generated/watchlist_collection_model.freezed.dart';

enum CollectionType {
  nft,
  token,
}

@freezed
class WatchlistCollection with _$WatchlistCollection {
  const factory WatchlistCollection({
    required String id,
    required String name,
    required CollectionType type,
    @Default([]) List<WatchlistItem> items,
    DateTime? createdAt,
    DateTime? lastUpdated,
    @Default(false) bool isDeleting,
    @Default(false) bool isEditing,
  }) = _WatchlistCollection;

}
