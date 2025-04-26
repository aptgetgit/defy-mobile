import 'explore_item.dart';

class TokenItem extends ExploreItem {
  final double priceUsd;
  final double priceChange;
  final int investors;
  final String returnPeriod;

  TokenItem({
    required super.id,
    required super.name,
    required super.imagePath,
    super.description = '',
    super.tags = const [],
    super.isFavorite = false,
    this.priceUsd = 0.0,
    this.priceChange = 0.0,
    this.investors = 0,
    this.returnPeriod = '',
  });

  @override
  TokenItem copyWith({
    String? id,
    String? name,
    String? imagePath,
    String? description,
    List<String>? tags,
    bool? isFavorite,
    double? priceUsd,
    double? priceChange,
    int? investors,
    String? returnPeriod,
  }) {
    return TokenItem(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      isFavorite: isFavorite ?? this.isFavorite,
      priceUsd: priceUsd ?? this.priceUsd,
      priceChange: priceChange ?? this.priceChange,
      investors: investors ?? this.investors,
      returnPeriod: returnPeriod ?? this.returnPeriod,
    );
  }
}