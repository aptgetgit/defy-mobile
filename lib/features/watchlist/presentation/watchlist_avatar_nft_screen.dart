import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            PhosphorIconsBold.caretLeft,
            color: Colors.black,
            size: 20.sp,
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
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            Gap(40.w),
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
                PhosphorIconsBold.pencilSimpleLine,
                color: AppColors.greyLight,
                size: 18.sp,
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
              padding: EdgeInsets.all(16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'NFT',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greyVeryLight,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            PhosphorIconsBold.trendUp,
                            color: AppColors.grey,
                            size: 18.sp,
                          ),
                          onPressed: () {
                            // Show sort options dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => SimpleDialog(
                                title: Text('Sort by', style: TextStyle(fontSize: 18.sp)),
                                children: <Widget>[
                                  SimpleDialogOption(
                                    onPressed: () {
                                      ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                                          .setSortOption(SortOption.nameAsc);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Name (A-Z)', style: TextStyle(fontSize: 16.sp)),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                                          .setSortOption(SortOption.nameDesc);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Name (Z-A)', style: TextStyle(fontSize: 16.sp)),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                                          .setSortOption(SortOption.priceAsc);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Price (Low to High)', style: TextStyle(fontSize: 16.sp)),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                                          .setSortOption(SortOption.priceDesc);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Price (High to Low)', style: TextStyle(fontSize: 16.sp)),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        height: 32.h,
                        width: 32.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greyVeryLight,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            PhosphorIconsBold.dotsThreeVertical,
                            color: AppColors.grey,
                            size: 18.sp,
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
                ? Center(child: Text('No NFTs in this collection', style: TextStyle(fontSize: 16.sp)))
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
            Gap(50.h),
            if(showDeleteButton)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ElevatedButton(
                  onPressed: () {
                    // Confirmation dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text('Delete Collection', style: TextStyle(fontSize: 18.sp)),
                        content: Text('Are you sure? This action cannot be undone.', style: TextStyle(fontSize: 16.sp)),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Cancel', style: TextStyle(fontSize: 16.sp)),
                          ),
                          TextButton(
                            onPressed: () {
                              // Delete collection using provider
                              ref.read(watchlistProvider.notifier).deleteCollection(collectionId!);
                              Navigator.pop(context); // close dialog
                              Navigator.pop(context); // go back to previous screen
                            },
                            child: Text('Delete', style: TextStyle(color: Colors.red, fontSize: 16.sp)),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    minimumSize: Size(double.infinity, 54.h),
                  ),
                  child: Text('Delete Collection', style: TextStyle(fontSize: 16.sp)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
