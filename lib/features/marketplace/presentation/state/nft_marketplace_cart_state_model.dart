import 'package:defy/features/marketplace/domain/entities/collection_details_entity.dart';
import 'package:defy/features/marketplace/domain/entities/nft_marketplace_cart_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'generated/nft_marketplace_cart_state_model.freezed.dart';

@freezed
class NFTMarketplaceCartStateModel with _$NFTMarketplaceCartStateModel {
  const factory NFTMarketplaceCartStateModel({
    @Default([]) List<NFTMarketplaceCartEntity> items,
    @Default(true) bool isSortAscending,
    @Default(false) bool isEditMode,
    @Default({}) Map<String, bool> deletedItems,
    @Default({}) Set<String> selectedNFTs,
  }) = _NFTMarketplaceCartStateModel;
}