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