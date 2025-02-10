import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/nft_marketplace_sell_state_model.freezed.dart';
part 'generated/nft_marketplace_sell_state_model.g.dart';

@Freezed(fromJson: true)
class NFTMarketplaceSellState with _$NFTMarketplaceSellState {
  @JsonSerializable(explicitToJson: true)
  const factory NFTMarketplaceSellState({
    @Default(true) bool isSelectionMode,
    @Default({}) Set<String> selectedNFTs,
    @Default({}) Map<String, bool> expandedStates,
    @Default("Collection Volume") String sortBy,
    @Default(true) bool isAscending,
  }) = _NFTMarketplaceSellState;

  factory NFTMarketplaceSellState.fromJson(Map<String, dynamic> json) =>
      _$NFTMarketplaceSellStateFromJson(json);
}