import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../wallet/presentation/providers/wallet_provider.dart';
import '../../wallet/presentation/providers/wallet_provider.dart';
import '../presentation/providers/watchlist_new_collection_model.dart';
import '../presentation/providers/watchlist_new_collection_provider.dart';


import '../widgets/watchlist_collection_tile.dart';
import '../widgets/watchlist_cute_nft_tile.dart';
import '../widgets/watchlist_grid_tile.dart';
import '../widgets/watchlist_newList_tile.dart';
import '../widgets/watchlist_new_collection.dart';

class WatchlistNFTTab extends ConsumerWidget {
  const WatchlistNFTTab({Key? key}) : super(key: key);

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
                    // Navigator.of(context).push(
                    //   MaterialPageRoute<void>(
                    //     builder: (BuildContext context) => const WatchlistTransitionScreen(),
                    //   ),
                    // );
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
        // Adjust this padding to be consistent with other layouts
        padding: EdgeInsets.only(top: 20.h),
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
                WatchlistCollectionTile(collection: collections[firstItemIndex]),
                
                // Second column: Show collection
                WatchlistCollectionTile(collection: collections[secondItemIndex]),
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
            // Use a consistent padding
            padding: EdgeInsets.only(bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Show New List tile in first position
                _buildNewListTile(context, ref),
                
                // Maintain balance with an invisible placeholder the same size as a tile
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 32.w) / 2,
                  height: 200.h, // Match the approximate height of the collection tiles
                ),
              ],
            ),
          ),
      ],
    );
  }
  
  // Update in watchlist_nft_tab.dart _buildNewListTile method
  Widget _buildNewListTile(BuildContext context, WidgetRef ref) => 
    GestureDetector(
      onTap: () {
        // Clear any existing selections
        ref.read(walletNotifierProvider.notifier).clearSelectedTokens();
        
        // Navigate to create screen specifically for NFTs
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WatchListNewCollectionScreen(
              source: CollectionSource.nft,
            ),
          ),
        );
      },
      child: const WatchlistNewListTile(forceEmptyState: true),
    );
}