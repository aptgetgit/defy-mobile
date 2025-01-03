import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:defy/features/marketplace/domain/entities/trending_collection_entity.dart';
import 'package:defy/features/marketplace/presentation/provider/trending_collection_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NFTMarketplaceSearchScreen extends ConsumerStatefulWidget {
  const NFTMarketplaceSearchScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NFTMarketplaceSearchScreen> createState() =>
      _NFTMarketplaceSearchScreenState();
}

class _NFTMarketplaceSearchScreenState
    extends ConsumerState<NFTMarketplaceSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<TrendingCollectionEntity> _searchResults = [];
  bool _isLoading = false;
  bool _hasSearched = false;
  List<String> _recentSearches = [];
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _loadRecentSearches();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final query = _searchController.text;
      if (query.isNotEmpty) {
        _performSearch(query);
      } else {
        setState(() {
          _searchResults = [];
        });
      }
    });
  }

  Future<void> _performSearch(String query) async {
    setState(() {
      _isLoading = true;
      _hasSearched = true;
    });

    try {
      final allCollections = await ref
          .read(trendingCollectionProvider.notifier)
          .getTrendingCollection(
            period: 'days_7',
            trendingBy: 'usd_volume',
            offset: 0,
            limit: 1000,
          );

      if (allCollections != null && allCollections.isNotEmpty) {
        _searchResults = allCollections
            .where((collection) =>
                collection.collection?.title
                    ?.toLowerCase()
                    .contains(query.toLowerCase()) ??
                false)
            .toList();
      } else {
        _searchResults = [];
      }
    } catch (e) {
      print("Error during search: $e");
      _searchResults = [];
    }

    setState(() {
      _isLoading = false;
    });

    if (query.isNotEmpty) {
      _addToRecentSearches(query);
    }
  }

  void _addToRecentSearches(String query) {
    if (!_recentSearches.contains(query)) {
      setState(() {
        _recentSearches.insert(0, query);
        if (_recentSearches.length > 5) {
          _recentSearches.removeLast();
        }
      });
      _saveRecentSearches();
    }
  }

  void _loadRecentSearches() async {
    setState(() {
      _recentSearches = ['NFT', 'Crypto', 'Art', 'Collectibles', 'Metaverse'];
    });
  }

  void _saveRecentSearches() async {
    print('Saved recent searches: $_recentSearches');
  }

  Widget _buildCollectionTile(TrendingCollectionEntity collection) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     blurRadius: 8,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                collection.collection!.coverUrl!,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 48,
                  height: 48,
                  color: Colors.grey[100],
                  child: Icon(Icons.image_not_supported,
                      color: Colors.grey[300], size: 24),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    collection.collection!.title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black87),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      _buildInfoItem(Icons.local_offer,
                          'Floor: ${collection.collection!.floor} APT'),
                      const SizedBox(width: 12),
                      _buildInfoItem(Icons.bar_chart,
                          'Vol: ${collection.collection!.volume} APT'),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[300], size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 11,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildRecentSearchChip(String query) {
    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      label: Text(
        query,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      onDeleted: () {
        setState(() {
          _recentSearches.remove(query);
        });
      },
      deleteIcon: const Icon(
        Icons.close,
        size: 16,
        color: Colors.black54,
      ),
      deleteIconColor: Colors.transparent,
      backgroundColor: Colors.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      labelPadding: const EdgeInsets.only(left: 8, right: 4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: BorderSide(
        color: Colors.grey[300]!,
        width: 0,
      ),
    );
  }

  Widget _buildTrendingAndRecentSearches() {
    final trendingSearches = [
      TrendingCollectionEntity(
          collection: CollectionEntity(
              title: 'Bored Ape Yacht Club',
              coverUrl:
                  'https://cdn.pixabay.com/photo/2022/02/18/16/09/ape-7020995_640.png',
              floor: 100,
              volume: 10000)),
      TrendingCollectionEntity(
          collection: CollectionEntity(
              title: 'CryptoPunks',
              coverUrl:
                  'https://cdn.pixabay.com/photo/2022/02/18/16/09/ape-7020995_640.png',
              floor: 80,
              volume: 8000)),
      TrendingCollectionEntity(
          collection: CollectionEntity(
              title: 'Doodles',
              coverUrl:
                  'https://cdn.pixabay.com/photo/2022/02/18/16/09/ape-7020995_640.png',
              floor: 20,
              volume: 2000)),
    ];

    return ListView(
      children: [
        if (_recentSearches.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Recent Searches',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _recentSearches.map(_buildRecentSearchChip).toList(),
            ),
          ),
          const SizedBox(height: 24),
        ],
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Trending Collections',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ...trendingSearches.map(_buildCollectionTile),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Discover NFTs',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(PhosphorIconsRegular.caretLeft, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search collections...',
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
                  prefixIcon: Icon(
                      PhosphorIcons.magnifyingGlass(PhosphorIconsStyle.regular),
                      color: Colors.grey[600],
                      size: 20),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(
                              PhosphorIcons.x(PhosphorIconsStyle.regular),
                              color: Colors.grey[600],
                              size: 20),
                          onPressed: () {
                            _searchController.clear();
                            _performSearch('');
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                ),
                style: const TextStyle(fontSize: 16),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _searchController.text.isEmpty
                    ? _buildTrendingAndRecentSearches()
                    : !_hasSearched
                        ? const SizedBox()
                        : _searchResults.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.search_off,
                                        size: 64, color: Colors.grey),
                                    const SizedBox(height: 16),
                                    Text(
                                      'No results found for "${_searchController.text}"',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey[600]),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                itemCount: _searchResults.length,
                                itemBuilder: (context, index) =>
                                    _buildCollectionTile(_searchResults[index]),
                              ),
          ),
        ],
      ),
    );
  }
}
