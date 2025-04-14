import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../wallet/presentation/providers/wallet_provider.dart';
import '../../wallet/presentation/providers/wallet_provider.dart';
import '../presentation/providers/watchlist_new_collection_model.dart';
import '../presentation/providers/watchlist_new_collection_provider.dart';
import '../presentation/watchlist_cute_nft_screen.dart';
import '../widgets/watchlist_collection_tile.dart';
import '../widgets/watchlist_cute_nft_tile.dart';
import '../widgets/watchlist_grid_tile.dart';
import '../widgets/watchlist_newList_tile.dart';
import '../widgets/watchlist_new_collection.dart';

class WatchlistNFTTab extends ConsumerWidget {
  final String? newCollectionHeroTag;
  const WatchlistNFTTab({super.key, this.newCollectionHeroTag});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get only NFT collections from the provider
    final List<WatchlistNewCollection> nftCollections = ref.watch(nftCollectionsProvider);
    
    print('Building WatchlistNFTTab with ${nftCollections.length} NFT collections');
    
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          children: <Widget>[
            // Existing static content
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const WatchlistCuteNFTScreen(),
                      ),
                    );
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      child: const WatchlistCuteTile(),
                    ),
                  ),
                ),
                const WatchlistGridTile(),
              ],
            ),
            Gap(20.h),
            
            // Display NFT collections in grid WITH the New List tile at the end
            // Using the same pattern as the Tokens tab
            _buildNFTCollectionGrid(context, ref, nftCollections),
          ],
        ),
      ),
    );
  }
  
  // Helper method to build NFT collection grid matching the tokens tab pattern
  Widget _buildNFTCollectionGrid(BuildContext context, WidgetRef ref, List<WatchlistNewCollection> collections) {
    if (collections.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
        child: Center(
          child: _buildNewListTile(context, ref),
        ),
      );
    }
    // Calculate collection pairs (how many complete rows of two items)
    final int completePairs = collections.length ~/ 2;
    final bool hasOddCollection = collections.length % 2 == 1;
    
    return Column(
      children: <Widget>[
        // First, render all complete pairs
        ...List.generate(completePairs, (int rowIndex) {
          final int firstItemIndex = rowIndex * 2;
          final int secondItemIndex = rowIndex * 2 + 1;
          
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // First column: Show collection
                WatchlistCollectionTile(collection: collections[firstItemIndex], heroTag: newCollectionHeroTag ?? null),
                
                // Second column: Show collection
                WatchlistCollectionTile(collection: collections[secondItemIndex], heroTag: newCollectionHeroTag ?? null),
              ],
            ),
          );
        }),
        
        // Then, if there's an odd collection, show it with the New List tile
        if (hasOddCollection)
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Show the odd collection
                WatchlistCollectionTile(collection: collections[collections.length - 1]),
                
                // Show New List tile in second position
                _buildNewListTile(context, ref),
              ],
            ),
          )
        else
          // If collections count is even, add a new row with the New List tile
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Show New List tile in first position
                _buildNewListTile(context, ref),
                
                // Empty space for second position
                SizedBox(width: MediaQuery.of(context).size.width * 0.4),
              ],
            ),
          ),
      ],
    );
  }
  
  // Extract the New List tile creation into a separate method - similar to tokens tab
  Widget _buildNewListTile(BuildContext context, WidgetRef ref) {
    final List<WatchlistNewCollection> collections = ref.watch(nftCollectionsProvider);
    
    final bool hasCollections = collections.isNotEmpty;
    final bool isOddCollections = hasCollections && collections.length % 2 == 1;
    final String direction = isOddCollections ? 'right' : 'left';
    final String heroTag = 'new_list_nft_${direction}'; // Stable tag for NFTs
    
    return Padding(
      padding: EdgeInsets.only(bottom: 38.h),
      child: hasCollections 
        ? TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 0.0), // Start at 0 to prevent animation
            duration: const Duration(milliseconds: 500),
            builder: (BuildContext context, double value, Widget? child) => Transform.translate(
                offset: Offset(value * 100, 0),
                child: child,
              ),
            child: _buildNewListTileContent(context, ref, heroTag),
          )
        : _buildNewListTileContent(context, ref, heroTag),
    );
  }

  // Helper method to build the actual content of the new list tile
  Widget _buildNewListTileContent(BuildContext context, WidgetRef ref, String heroTag) => GestureDetector(
      onTap: () {
        // Clear any existing selections
        ref.read(walletNotifierProvider.notifier).clearSelectedTokens();
        
        // Navigate to create screen specifically for NFTs
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => WatchListNewCollectionScreen(
              source: CollectionSource.nft,
              returnHeroTag: heroTag,
            ),
            transitionsBuilder: (_, Animation<double> animation, __, Widget child) => FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
        );
      },
      child: Hero(
        tag: heroTag,
        child: const Material(
          type: MaterialType.transparency,
          child: WatchlistNewListTile(forceEmptyState: true),
        ),
      ),
    );
}