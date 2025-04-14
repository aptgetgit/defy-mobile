import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../wallet/presentation/providers/wallet_provider.dart';
import '../presentation/providers/watchlist_new_collection_model.dart';
import '../presentation/providers/watchlist_new_collection_provider.dart';
import '../presentation/watchlist_safety_tokens_screen.dart';
import '../widgets/watchlist_collection_tile.dart';
import '../widgets/watchlist_newList_tile.dart';
import '../widgets/watchlist_new_collection.dart';
import '../widgets/watchlist_safety_token_tile.dart';

class WatchlistTokensTab extends ConsumerWidget {
  const WatchlistTokensTab({super.key, this.newCollectionHeroTag});
  final String? newCollectionHeroTag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the collections from the provider
    final List<WatchlistNewCollection> collections = ref.watch(tokenCollectionsProvider);
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: SingleChildScrollView(  // Make the entire content scrollable
        child: Column(
          children: <Widget>[
            // First row with Safety Tokens and New List (if no collections)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Safety Tokens tile (always shown)
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const WatchlistSafetyTokensScreen(),
                      ),
                    );
                  },
                  child: const WatchlistSafetyTokenTile(),
                ),

                Gap(10.w),
                
                // Show New List tile next to Safety Tokens tile if there are no collections
                // Otherwise, show the first collection
                if (collections.isEmpty) _buildNewListTile(context, ref) else WatchlistCollectionTile(
                  collection: collections[0],
                  heroTag: newCollectionHeroTag,
                ),
              ],
            ),
            Gap(20.h),
            
            // If we have at least one collection, we need to display the rest differently
            if (collections.isNotEmpty) 
              _buildRemainingCollections(context, ref, collections),
          ],
        ),
      ),
    );
  }
  
  // Method to build the remaining collections after the first one
  Widget _buildRemainingCollections(BuildContext context, WidgetRef ref, List<WatchlistNewCollection> collections) {
    // Skip the first collection as it's already shown in the top row
    final List<WatchlistNewCollection> remainingCollections = collections.length > 1 
        ? collections.sublist(1) 
        : [];
    
    // Calculate collection pairs for remaining collections
    final int completePairs = remainingCollections.length ~/ 2;
    final bool hasOddCollection = remainingCollections.length % 2 == 1;
    
    return Column(
      children: <Widget>[
        // First, render all complete pairs of remaining collections
        ...List.generate(completePairs, (int rowIndex) {
          final int firstItemIndex = rowIndex * 2;
          final int secondItemIndex = rowIndex * 2 + 1;
          
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // First column
                WatchlistCollectionTile(
                  collection: remainingCollections[firstItemIndex],
                  heroTag: newCollectionHeroTag,
                ),
                
                // Second column
                WatchlistCollectionTile(
                  collection: remainingCollections[secondItemIndex],
                ),
              ],
            ),
          );
        }),
        
        // If there's an odd remaining collection, show it with the New List tile
        if (hasOddCollection)
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Show the odd collection
                WatchlistCollectionTile(
                  collection: remainingCollections.last,
                  heroTag: newCollectionHeroTag,
                ),
                
                // Show New List tile in second position
                _buildNewListTile(context, ref),
              ],
            ),
          )
        else
          // If no odd collection, add a new row with the New List tile
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
  
  // Extract the New List tile creation into a separate method
  Widget _buildNewListTile(BuildContext context, WidgetRef ref) {
    final List<WatchlistNewCollection> collections = ref.watch(tokenCollectionsProvider);
    
    // Only apply directional animation if there are collections
    final bool hasCollections = collections.isNotEmpty;
    final bool isOddCollections = hasCollections && collections.length % 2 == 1;
    final String direction = isOddCollections ? 'right' : 'left';
    final String heroTag = 'new_list_${direction}_${DateTime.now().millisecondsSinceEpoch}';
    
    return Padding(
      padding: EdgeInsets.only(bottom: 38.h),  // Match the padding of other tiles
      child: hasCollections 
        // Apply animation only if there are collections
        ? TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: isOddCollections ? 1.0 : -1.0, end: 0.0),
            duration: const Duration(milliseconds: 500),
            builder: (BuildContext context, double value, Widget? child) => Transform.translate(
                offset: Offset(value * 100, 0),
                child: child,
              ),
            child: _buildNewListTileContent(context, ref, heroTag),
          )
        // No animation if there are no collections
        : _buildNewListTileContent(context, ref, heroTag),
    );
  }

  // Helper method to build the actual content of the new list tile
  Widget _buildNewListTileContent(BuildContext context, WidgetRef ref, String heroTag) => GestureDetector(
      onTap: () {
        // Clear any existing selections
        ref.read(walletNotifierProvider.notifier).clearSelectedTokens();
        
        // Navigate to create screen specifically for Tokens
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => WatchListNewCollectionScreen(
              source: CollectionSource.token,
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