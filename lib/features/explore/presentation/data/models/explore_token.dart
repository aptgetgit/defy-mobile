class ExploreToken {
  final String id;
  final String name;
  final String symbol;
  final double priceUsd;
  final double changePercentage;
  final int investors;
  final String returnPeriod;
  final String? logo;
  final String tileType; // "image" or "emoji"
  final String? emoji;   // Emoji character (e.g., "🌐")

  ExploreToken({
    required this.id,
    required this.name,
    required this.symbol,
    required this.priceUsd,
    required this.changePercentage,
    required this.investors,
    required this.returnPeriod,
    this.logo,
    String? tileType, // Changed to optional parameter
    this.emoji,
  }) : tileType = tileType ?? 'image'; // Default to 'image' if null

  ExploreToken copyWith({
    String? id,
    String? name,
    String? symbol,
    double? priceUsd,
    double? changePercentage,
    int? investors,
    String? returnPeriod,
    String? logo,
    String? tileType,
    String? emoji,
  }) {
    return ExploreToken(
      id: id ?? this.id,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      priceUsd: priceUsd ?? this.priceUsd,
      changePercentage: changePercentage ?? this.changePercentage,
      investors: investors ?? this.investors,
      returnPeriod: returnPeriod ?? this.returnPeriod,
      logo: logo ?? this.logo,
      tileType: tileType ?? this.tileType,
      emoji: emoji ?? this.emoji,
    );
  }
}