import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../widgets/watchlist_nft_tile.dart';
import '../widgets/watchlist_update_collection.dart';
import 'providers/watchlist_collection_details_provider.dart';
import 'providers/watchlist_collection_model.dart';
import 'providers/watchlist_item_model.dart';
import 'providers/watchlist_provider.dart';

// Remove standalone app code
// void main() {
//   runApp(const MyApp());
// }
// 
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
// 
//   @override
//   Widget build(BuildContext context) => const MaterialApp(
//       home: WatchlistAvatarNFTScreen(),
//     );
// }

class WatchlistAvatarNFTScreen extends ConsumerStatefulWidget {
  const WatchlistAvatarNFTScreen({this.collectionId, super.key});
  
  // Allow collection ID to be passed in directly
  final String? collectionId;

  @override
  ConsumerState<WatchlistAvatarNFTScreen> createState() => _WatchlistAvatarNFTScreenState();
}

class _WatchlistAvatarNFTScreenState extends ConsumerState<WatchlistAvatarNFTScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  String? collectionId;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ),);
    
    // If collection ID is passed directly, use it
    if (widget.collectionId != null) {
      collectionId = widget.collectionId;
    } else {
      // Otherwise find Avatar NFT collection
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final List<WatchlistCollection> avatarCollections = ref.read(watchlistProvider.notifier)
            .getCollectionsByType(CollectionType.nft)
            .where((WatchlistCollection c) => c.name.contains('Avatar NFT'))
            .toList();
        
        if (avatarCollections.isNotEmpty) {
          setState(() {
            collectionId = avatarCollections.first.id;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleDeleteButton() {
    if (collectionId == null) {
      return;
    }
    
    final WatchlistCollectionDetails provider = ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier);
    final bool isDeleteMode = ref.read(watchlistCollectionDetailsProvider(collectionId!)).isDeleteMode;
    
    // Toggle delete mode in provider
    provider.toggleDeleteMode();
    
    // Update animation state
    if (!isDeleteMode) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (collectionId == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    
    // Watch collection details
    final CollectionDetailsState collectionDetails = ref.watch(watchlistCollectionDetailsProvider(collectionId!));
    final WatchlistCollection collection = collectionDetails.collection;
    final bool showDeleteButton = collectionDetails.isDeleteMode;
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              collection.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const Gap(40),
            GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => WatchListUpdateCollectionScreen(
                      initialName: collection.name,
                      collectionId: collectionId!,
                    ),
                  ),
                );
                
                // Collection name is now updated via provider - no need to setState
              },
              child: Icon(
                PhosphorIcons.pencilSimpleLine(PhosphorIconsStyle.bold),
                color: AppColors.greyLight,
                size: 18,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'NFT',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greyVeryLight,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            PhosphorIcons.trendUp(PhosphorIconsStyle.bold),
                            color: AppColors.grey,
                            size: 18,
                          ),
                          onPressed: () {
                            // Show sort options dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => SimpleDialog(
                                title: const Text('Sort by'),
                                children: <Widget>[
                                  SimpleDialogOption(
                                    onPressed: () {
                                      ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                                          .setSortOption(SortOption.nameAsc);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Name (A-Z)'),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                                          .setSortOption(SortOption.nameDesc);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Name (Z-A)'),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                                          .setSortOption(SortOption.priceAsc);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Price (Low to High)'),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                                          .setSortOption(SortOption.priceDesc);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Price (High to Low)'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greyVeryLight,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            PhosphorIcons.dotsThreeVertical(PhosphorIconsStyle.bold),
                            color: AppColors.grey,
                            size: 18,
                          ),
                          onPressed: _toggleDeleteButton,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: collection.items.isEmpty
                ? const Center(child: Text('No NFTs in this collection'))
                : ListView.builder(
                  itemCount: collection.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final WatchlistItem item = collection.items[index];
                    return WatchlistNFTTile(
                      nftData: <String, String>{
                        'id': item.id,
                        'name': item.name,
                        'imagePath': item.imagePath,
                        'usdValue': item.usdValue ?? '',
                        'nativeValue': item.nativeValue ?? '',
                      },
                      deleteNft: showDeleteButton,
                      onDelete: () {
                        // Delete NFT from collection
                        ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                            .deleteItem(item.id);
                      },
                    );
                  },
                ),
            ),
            const Gap(50),
            if(showDeleteButton)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                  onPressed: () {
                    // Confirmation dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Delete Collection'),
                        content: const Text('Are you sure? This action cannot be undone.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Delete collection using provider
                              ref.read(watchlistProvider.notifier).deleteCollection(collectionId!);
                              Navigator.pop(context); // close dialog
                              Navigator.pop(context); // go back to previous screen
                            },
                            child: const Text('Delete', style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    minimumSize: const Size(double.infinity, 54),
                  ),
                  child: const Text('Delete Collection'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
