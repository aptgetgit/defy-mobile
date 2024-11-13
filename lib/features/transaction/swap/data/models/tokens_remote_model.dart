import 'package:defy/features/transaction/swap/domain/entities/tokens_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/tokens_remote_model.freezed.dart';
part 'generated/tokens_remote_model.g.dart';

@freezed
class TokensRemoteModel with _$TokensRemoteModel {
  const TokensRemoteModel._();
  factory TokensRemoteModel({
    @JsonKey(name: 'chainId') required int? chainId,
    @JsonKey(name: 'tokenAddress') required dynamic tokenAddress,
    @JsonKey(name: 'name') required String? name,
    @JsonKey(name: 'symbol') required String? symbol,
    @JsonKey(name: 'decimals') required int? decimals,
    @JsonKey(name: 'bridge') required String? bridge,
    @JsonKey(name: 'panoraSymbol') required String? panoraSymbol,
    @JsonKey(name: 'logoUrl') required String? logoUrl,
    @JsonKey(name: 'websiteUrl') required String? websiteUrl,
    @JsonKey(name: 'category') required String? category, //not in res
    @JsonKey(name: 'isInPanoraTokenList') required bool? isInPanoraTokenList, //not in res
    @JsonKey(name: 'isBanned') required bool? isBanned, //not in res
    @JsonKey(name: 'panoraOrderIndex') required int? panoraOrderIndex, //not in res
    @JsonKey(name: 'coingeckoId') required String? coingeckoId,
    @JsonKey(name: 'coinMarketCapId') required int? coinMarketCapId,
  }) = _TokensRemoteModel;

  factory TokensRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$TokensRemoteModelFromJson(json);
  
  String? get tokenAddressString => tokenAddress is Map<String,dynamic> ? (tokenAddress?['v1']) : tokenAddress;

  TokenEntity toDomain() => TokenEntity(
      chainId: chainId,
      tokenAddress: tokenAddressString,
      name: name,
      symbol: symbol,
      decimals: decimals,
      bridge: bridge,
      panoraSymbol: panoraSymbol,
      logoUrl: logoUrl,
      websiteUrl: websiteUrl,
      category: category,
      isInPanoraTokenList: isInPanoraTokenList,
      isBanned: isBanned,
      panoraOrderIndex: panoraOrderIndex,
      coingeckoId: coingeckoId,
      coinMarketCapId: coinMarketCapId);

  static TokensRemoteModel fromDomain(TokenEntity entity) {
    return TokensRemoteModel(
      chainId: entity.chainId,
      tokenAddress: entity.tokenAddress,
      name: entity.name,
      symbol: entity.symbol,
      decimals: entity.decimals,
      bridge: entity.bridge,
      panoraSymbol: entity.panoraSymbol,
      logoUrl: entity.logoUrl,
      websiteUrl: entity.websiteUrl,
      category: entity.category,
      isInPanoraTokenList: entity.isInPanoraTokenList,
      isBanned: entity.isBanned,
      panoraOrderIndex: entity.panoraOrderIndex,
      coingeckoId: entity.coingeckoId,
      coinMarketCapId: entity.coinMarketCapId,
    );
  }
}
