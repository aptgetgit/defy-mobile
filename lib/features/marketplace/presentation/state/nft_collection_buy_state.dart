import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/nft_collection_buy_state.freezed.dart';
part 'generated/nft_collection_buy_state.g.dart';


@Freezed(fromJson: true)
class NFTCollectionBuyStateModel with _$NFTCollectionBuyStateModel {
  const factory NFTCollectionBuyStateModel({
    @Default({}) Set<String> selectedNFTs,
    @Default("Collection Volume") String sortBy,
    @Default(true) bool isAscending,
    @Default({}) Map<String, dynamic> filter,
    @Default(0.0) double sweepValue,
  }) = _NFTCollectionBuyStateModel;

  factory NFTCollectionBuyStateModel.fromJson(Map<String, dynamic> json) =>
      _$NFTCollectionBuyStateModelFromJson(json);
}