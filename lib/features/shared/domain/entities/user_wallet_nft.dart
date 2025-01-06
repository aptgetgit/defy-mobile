import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_wallet_nft.freezed.dart';
part 'generated/user_wallet_nft.g.dart';

@freezed
class UserWalletNFT with _$UserWalletNFT {
  const UserWalletNFT._();

  const factory UserWalletNFT({
  required String? nftId,
  required String? acquiredUsdPrice,
  required String? acquiredPrice,
  required NFTCollection? collection,
  required NFT? nft,
  }) = _UserWalletNFT;

  factory UserWalletNFT.fromJson(Map<String, dynamic> json) =>
      _$UserWalletNFTFromJson(json);
}

@freezed
class NFTCollection with _$NFTCollection {
  const NFTCollection._();

  const factory NFTCollection({
  required String? coverUrl,
  required String? title,
  required bool? verified,
  required String? id,
  required int? floor,
  }) = _NFTCollection;

  factory NFTCollection.fromJson(Map<String, dynamic> json) =>
      _$NFTCollectionFromJson(json);
}

@freezed
class NFT with _$NFT {
  const NFT._();

  const factory NFT({
  required String? name,
  required String? owner,
  required bool? staked,
  required String? tokenId,
  required bool? burned,
  required String? mediaType,
  required String? mediaUrl,
  required String? contractId,
  required int? version,
  required List<NFTListing?>? listings,
  }) = _NFT;

  factory NFT.fromJson(Map<String, dynamic> json) =>
      _$NFTFromJson(json);
}

@freezed
class NFTListing with _$NFTListing {
  const NFTListing._();

  const factory NFTListing({
  required bool? listed,
  required int? price,
  }) = _NFTListing;

  factory NFTListing.fromJson(Map<String, dynamic> json) =>
      _$NFTListingFromJson(json);
}