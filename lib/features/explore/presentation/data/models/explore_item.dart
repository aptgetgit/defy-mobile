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