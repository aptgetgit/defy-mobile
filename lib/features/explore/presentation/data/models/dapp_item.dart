import 'explore_item.dart';

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