import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:defy/features/marketplace/domain/entities/trending_collection_entity.dart';
import 'package:defy/features/marketplace/presentation/state/marketplace_filter_state_model.dart';

part 'generated/marketplace_state_model.freezed.dart';

@freezed
class MarketplaceStateModel with _$MarketplaceStateModel {
  const factory MarketplaceStateModel({
    @Default([]) List<TrendingCollectionEntity> allCollections,
    @Default([]) List<TrendingCollectionEntity> displayedCollections,
    @Default(true) bool isLoading,
    @Default(0) int tabIndex,
    @Default(0) int selectedPeriod,
    @Default(10) int displayedItemCount,
    @Default(MarketplaceFilterStateModel())
    MarketplaceFilterStateModel filterState,
  }) = _MarketplaceStateModel;
}
