import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/watchlist_item_model.freezed.dart';

@freezed
class WatchlistItem with _$WatchlistItem {
  const factory WatchlistItem({
    required String id,
    required String name,
    required String imagePath,
    String? usdValue,
    String? nativeValue,
    String? symbol,
    @Default(false) bool isDeleting,
  }) = _WatchlistItem;

}
