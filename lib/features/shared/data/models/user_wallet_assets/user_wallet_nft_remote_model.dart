import 'package:defy/features/shared/domain/entities/user_wallet_nft.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_wallet_nft_remote_model.freezed.dart';
part 'generated/user_wallet_nft_remote_model.g.dart';

@freezed
class UserWalletNFTRemoteModel with _$UserWalletNFTRemoteModel {
  factory UserWalletNFTRemoteModel({
    @JsonKey(name: 'nft_id') required String? nftId,
    @JsonKey(name: 'acquired_usd_price') required String? acquiredUsdPrice,
    @JsonKey(name: 'acquired_price') required String? acquiredPrice,
    @JsonKey(name: 'collection') required NFTCollectionRemoteModel? collection,
    @JsonKey(name: 'nft') required NFTRemoteModel? nft,
  }) = _UserWalletNFTRemoteModel;

  factory UserWalletNFTRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$UserWalletNFTRemoteModelFromJson(json);

  UserWalletNFT toDomain() => UserWalletNFT(
        nftId: nftId,
        acquiredUsdPrice: acquiredUsdPrice,
        acquiredPrice: acquiredPrice,
        collection: collection?.toDomain(),
        nft: nft?.toDomain(),
      );

  static fromDomain(UserWalletNFT nft) => UserWalletNFTRemoteModel(
        nftId: nft.nftId,
        acquiredUsdPrice: nft.acquiredUsdPrice,
        acquiredPrice: nft.acquiredPrice,
        collection: NFTCollectionRemoteModel.fromDomain(nft.collection),
        nft: NFTRemoteModel.fromDomain(nft.nft),
      );
}

@freezed
class NFTCollectionRemoteModel with _$NFTCollectionRemoteModel {
  factory NFTCollectionRemoteModel({
    @JsonKey(name: 'cover_url') required String? coverUrl,
    @JsonKey(name: 'title') required String? title,
    @JsonKey(name: 'verified') required bool? verified,
    @JsonKey(name: 'id') required String? id,
    @JsonKey(name: 'floor') required int? floor,
  }) = _NFTCollectionRemoteModel;

  factory NFTCollectionRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$NFTCollectionRemoteModelFromJson(json);

  NFTCollection toDomain() => NFTCollection(
        coverUrl: coverUrl,
        title: title,
        verified: verified,
        id: id,
        floor: floor,
      );

  static fromDomain(NFTCollection? collection) => NFTCollectionRemoteModel(
        coverUrl: collection?.coverUrl,
        title: collection?.title,
        verified: collection?.verified,
        id: collection?.id,
        floor: collection?.floor,
      );
}

@freezed
class NFTRemoteModel with _$NFTRemoteModel {
  factory NFTRemoteModel({
    @JsonKey(name: 'name') required String? name,
    @JsonKey(name: 'owner') required String? owner,
    @JsonKey(name: 'staked') required bool? staked,
    @JsonKey(name: 'token_id') required String? tokenId,
    @JsonKey(name: 'burned') required bool? burned,
    @JsonKey(name: 'media_type') required String? mediaType,
    @JsonKey(name: 'media_url') required String? mediaUrl,
    @JsonKey(name: 'contract_id') required String? contractId,
    @JsonKey(name: 'version') required int? version,
    @JsonKey(name: 'listings') required List<NFTListingModel?>? listings,
  }) = _NFTRemoteModel;

  factory NFTRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$NFTRemoteModelFromJson(json);

  NFT toDomain() => NFT(
        name: name,
        owner: owner,
        staked: staked,
        tokenId: tokenId,
        burned: burned,
        mediaType: mediaType,
        mediaUrl: mediaUrl,
        contractId: contractId,
        version: version,
        listings: listings?.map((listing) => listing?.toDomain()).toList(),
      );

  static fromDomain(NFT? nft) => NFTRemoteModel(
        name: nft?.name,
        owner: nft?.owner,
        staked: nft?.staked,
        tokenId: nft?.tokenId,
        burned: nft?.burned,
        mediaType: nft?.mediaType,
        mediaUrl: nft?.mediaUrl,
        contractId: nft?.contractId,
        version: nft?.version,
        listings: nft?.listings
            ?.map<NFTListingModel?>(
                (listing) => NFTListingModel.fromDomain(listing))
            .toList(),
      );
}

@freezed
class NFTListingModel with _$NFTListingModel {
  factory NFTListingModel({
    @JsonKey(name: 'listed') required bool? listed,
    @JsonKey(name: 'price') required int? price,
  }) = _NFTListingModel;

  factory NFTListingModel.fromJson(Map<String, dynamic> json) =>
      _$NFTListingModelFromJson(json);

  NFTListing toDomain() => NFTListing(listed: listed, price: price);

  static fromDomain(NFTListing? listing) => NFTListingModel(
        listed: listing?.listed,
        price: listing?.price,
      );
}
