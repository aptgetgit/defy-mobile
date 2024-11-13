import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/tokens_entity.freezed.dart';
part 'generated/tokens_entity.g.dart';

@freezed
class TokenEntity with _$TokenEntity {
  const TokenEntity._();

  const factory TokenEntity({
  required int? chainId,
  required String? tokenAddress,
  required String? name,
  required String? symbol,
  required int? decimals,
  required String? bridge,
  required String? panoraSymbol,
  required String? logoUrl,
  required String? websiteUrl,
  required String? category,
  required bool? isInPanoraTokenList,
  required bool? isBanned,
  required int? panoraOrderIndex,
  required String? coingeckoId,
  required int? coinMarketCapId,
  }) = _TokenEntity;

  factory TokenEntity.fromJson(Map<String, dynamic> json) =>
      _$TokenEntityFromJson(json);
}