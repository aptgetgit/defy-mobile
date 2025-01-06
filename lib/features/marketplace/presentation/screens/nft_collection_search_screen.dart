import 'dart:async';

import 'package:defy/features/shared/presentation/widgets/nft_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:defy/features/marketplace/domain/entities/collection_details_entity.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NFTCollectionSearchScreen extends ConsumerStatefulWidget {
  final List<CollectionListingsEntity> listings;
  final CollectionInfoEntity collectionInfo;
  final String? collectionName;

  const NFTCollectionSearchScreen({
    Key? key,
    required this.listings,
    required this.collectionInfo,
    required this.collectionName,
  }) : super(key: key);

  @override
  ConsumerState<NFTCollectionSearchScreen> createState() =>
      _NFTCollectionSearchScreenState();
}

class _NFTCollectionSearchScreenState
    extends ConsumerState<NFTCollectionSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<CollectionListingsEntity> _searchResults = [];
  bool _isLoading = false;
  List<String> _recentSearches = [];
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchResults = widget.listings;
    _loadRecentSearches();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _performSearch(String query) {
    setState(() {
      _isLoading = true;
      _searchResults = widget.listings
          .where((listing) =>
              listing.nft!.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _isLoading = false;
    });

    _addToRecentSearches(query);
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

  void _loadRecentSearches() {
    // TODO: Implement loading from persistent storage
    setState(() {
      _recentSearches = ['NFT', 'Crypto', 'Art', 'Collectibles', 'Metaverse'];
    });
  }

  void _saveRecentSearches() {
    // TODO: Implement saving to persistent storage
    print('Saved recent searches: $_recentSearches');
  }

  Widget _buildSearchBar() {
    return Container(
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
            hintText: 'Search NFTs...',
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
            prefixIcon: Icon(
                PhosphorIcons.magnifyingGlass(PhosphorIconsStyle.regular),
                color: Colors.grey[600],
                size: 20),
            suffixIcon: IconButton(
              icon: Icon(PhosphorIcons.x(PhosphorIconsStyle.regular),
                  color: Colors.grey[600], size: 20),
              onPressed: () {
                _searchController.clear();
                _performSearch('');
              },
            ),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          ),
          style: const TextStyle(fontSize: 16),
          onChanged: (value) {
            _performSearch(value);
          },
        ),
      ),
    );
  }

  Widget _buildNFTGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontalPadding = 24.0;
        final cardSpacing = 16.0;
        final cardWidth =
            (constraints.maxWidth - 2 * horizontalPadding - cardSpacing) / 2;
        return GridView.builder(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: 8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: cardWidth / 260,
            crossAxisSpacing: cardSpacing,
            mainAxisSpacing: 18,
          ),
          itemCount: _searchResults.length,
          itemBuilder: (context, index) {
            final listing = _searchResults[index];
            return NFTCard(
              discordUrl: widget.collectionInfo.discord,
              twitterUrl: widget.collectionInfo.twitter,
              websiteUrl: widget.collectionInfo.website,
              description: widget.collectionInfo.description,
              isCollectionItem: true,
              imageUrl: listing.nft?.mediaUrl ?? '',
              nftName: listing.nft?.name ?? '',
              collectionName: widget.collectionName ?? '',
              price: listing.price ?? 0,
            );
          },
        );
      },
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
          'Search NFTs',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(PhosphorIconsRegular.caretLeft, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _searchResults.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.search_off,
                                size: 64, color: Colors.grey),
                            const SizedBox(height: 16),
                            Text(
                              'No results found',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      )
                    : _buildNFTGrid(),
          ),
        ],
      ),
    );
  }
}
