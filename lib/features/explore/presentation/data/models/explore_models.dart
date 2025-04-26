class ExploreItem {
  final String id;
  final String name;
  final String imagePath;
  final String description;
  final List<String> tags;
  final bool isFavorite;

  ExploreItem({
    required this.id,
    required this.name,
    required this.imagePath,
    this.description = '',
    this.tags = const [],
    this.isFavorite = false,
  });

  ExploreItem copyWith({
    String? id,
    String? name,
    String? imagePath,
    String? description,
    List<String>? tags,
    bool? isFavorite,
  }) {
    return ExploreItem(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

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

class DappItem extends ExploreItem {
  final String category;
  final List<String> socials;

  DappItem({
    required super.id,
    required super.name,
    required super.imagePath, 
    super.description = '',
    super.tags = const [],
    super.isFavorite = false,
    this.category = '',
    this.socials = const [],
  });

  @override
  DappItem copyWith({
    String? id,
    String? name,
    String? imagePath,
    String? description,
    List<String>? tags,
    bool? isFavorite,
    String? category,
    List<String>? socials,
  }) {
    return DappItem(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      isFavorite: isFavorite ?? this.isFavorite,
      category: category ?? this.category,
      socials: socials ?? this.socials,
    );
  }
}

class ExploreToken {
  final String id;
  final String name;
  final String symbol;
  final double priceUsd;
  final double changePercentage;
  final int investors;
  final String returnPeriod;
  final String? logo;

  ExploreToken({
    required this.id,
    required this.name,
    required this.symbol,
    required this.priceUsd,
    required this.changePercentage,
    required this.investors,
    required this.returnPeriod,
    this.logo,
  });

  ExploreToken copyWith({
    String? id,
    String? name,
    String? symbol,
    double? priceUsd,
    double? changePercentage,
    int? investors,
    String? returnPeriod,
    String? logo,
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
    );
  }
}

class ExploreDapp {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final List<String> categories;
  final String url;
  final bool isFavorite;

  ExploreDapp({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.categories,
    required this.url,
    this.isFavorite = false,
  });

  ExploreDapp copyWith({
    String? id,
    String? name,
    String? description,
    String? imagePath,
    List<String>? categories,
    String? url,
    bool? isFavorite,
  }) {
    return ExploreDapp(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      categories: categories ?? this.categories,
      url: url ?? this.url,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}