import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Add ScreenUtil import
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

// Remove standalone app code for integrated version
// void main() {
//   runApp(const MyApp());
// }
// 
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
// 
//   @override
//   Widget build(BuildContext context) => const MaterialApp(
//       home: WatchlistCuteNFTScreen(),
//     );
// }

class WatchlistCuteNFTScreen extends ConsumerStatefulWidget {
  const WatchlistCuteNFTScreen({this.collectionId, super.key});
  
  // Add optional collection ID parameter
  final String? collectionId;

  @override
  ConsumerState<WatchlistCuteNFTScreen> createState() => _WatchlistCuteNFTScreenState();
}

class _WatchlistCuteNFTScreenState extends ConsumerState<WatchlistCuteNFTScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<Offset> _deleteButtonAnimation;
  String? collectionId;
  bool _showBottomNavBar = false; // Add this state variable
  bool _showDeleteMode = false; // Controls whether to show delete button in bottom nav
  bool _navBarExpanded = false; // Controls nav bar width/shape
  bool _showCancelButton = false; // Add a new state variable to track if the cancel button should be shown

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    
    // Existing animation for delete mode
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // New animation for delete button
    _deleteButtonAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic, // Smoother animation curve
    ));

    // If collection ID is passed directly, use it
    if (widget.collectionId != null) {
      collectionId = widget.collectionId;
    } else {
      // Otherwise find Cute NFTs collection
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final List<WatchlistCollection> cuteCollections = ref.read(watchlistProvider.notifier)
            .getCollectionsByType(CollectionType.nft)
            .where((WatchlistCollection c) => c.name.contains('Cute NFT'))
            .toList();
        
        if (cuteCollections.isNotEmpty) {
          setState(() {
            collectionId = cuteCollections.first.id;
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

  // Update the _toggleDeleteButton method
  void _toggleDeleteButton() {
    if (collectionId == null) {
      return;
    }
    
    final bool currentDeleteMode = ref.read(watchlistCollectionDetailsProvider(collectionId!)).isDeleteMode;
    
    setState(() {
      // Update local state first
      _showDeleteMode = !_showDeleteMode;
      
      // If turning on delete mode, expand the nav bar
      if (!currentDeleteMode) {
        _navBarExpanded = true;
      } else {
        // If turning off delete mode, also hide the bottom bar
        _showBottomNavBar = false;
      }
    });
    
    // Update provider state after local state
    ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier).toggleDeleteMode();
    
    // Animation control
    if (!currentDeleteMode) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _toggleBottomNavBar() {
    setState(() {
      _showBottomNavBar = !_showBottomNavBar;
      _navBarExpanded = _showBottomNavBar; // Expand when showing
      
      // If showing nav bar, show cancel button; otherwise show three dots
      _showCancelButton = _showBottomNavBar;
      
      // If hiding the nav bar, also turn off delete mode
      if (!_showBottomNavBar && _showDeleteMode) {
        _toggleDeleteButton();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show loading while finding collection
    if (collectionId == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    
    // Get collection data from provider
    final CollectionDetailsState collectionDetails = ref.watch(watchlistCollectionDetailsProvider(collectionId!));
    final WatchlistCollection collection = collectionDetails.collection;
    final bool showDeleteButton = collectionDetails.isDeleteMode;
    
    return Scaffold(
      appBar: AppBar(

        toolbarHeight: kToolbarHeight + 12.h,
        leading: IconButton(
          icon: Icon(
            PhosphorIconsBold.caretLeft,
            color: Colors.black,
            size: 22.sp,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          children: [
            Text(
              collection.name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min, // Keep row centered
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Horizontal stack of NFT images with reduced spacing
                SizedBox(
                  width: 45.w, // Reduced from 60.w to make it more compact
                  height: 20.h, // Keep the same height
                  child: Stack(
                    children: [
                      // Display up to 3 NFT images as a preview
                      for (int i = 0; i < (collection.items.length > 3 ? 3 : collection.items.length); i++)
                        Positioned(
                          right: i * 5.w, // Reduced from 15.w to 10.w for tighter stacking
                          child: Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(color: Colors.white, width: 1.w),
                              image: DecorationImage(
                                image: AssetImage(collection.items[i].imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Gap(4.w), // Small gap between images and text
                Text(
                  '${collection.items.length} items', // Item count text
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          // Show either three dots or Cancel button with color based on delete mode
          if (_showCancelButton) Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    // Change color based on delete mode
                    color: showDeleteButton 
                      ? AppColors.red.withValues(alpha: 0.2) // Red with opacity when in delete mode
                      : AppColors.blue.withValues(alpha: 0.2), // Blue with opacity otherwise
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // If in delete mode, also toggle delete mode when canceling
                      if (showDeleteButton) {
                        _toggleDeleteButton();
                      }
                      _toggleBottomNavBar(); // Always toggle bottom nav bar
                    },
                    child: Text(
                      showDeleteButton ? 'Done' : 'Cancel', // Change text based on mode
                      style: TextStyle(
                        fontSize: 12.sp,
                        // Change text color based on delete mode
                        color: showDeleteButton 
                          ? AppColors.red 
                          : AppColors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ) else Padding(  // Show three dots icon when _showCancelButton is false
                padding: EdgeInsets.only(right: 6.w),
                child: IconButton(
                  icon: Icon(
                    PhosphorIconsBold.dotsThreeVertical,
                    color: Colors.black,
                    size: 22.sp,
                  ),
                  onPressed: _toggleBottomNavBar,
                ),
              ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
 child: Column(
          children: [
            // Add padding above line
            Gap(8.h), 
            // The line
            Container(
              color: AppColors.greyVeryLight,
              height: 1.h,
              width: double.infinity,
            ),
            // No need for padding below since we'll add it in the body
          ],
        ),
        ),
      ),

     

      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Removed NFT text and icons row
            Gap(12.h),
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
                        // Delete the item through provider
                        ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                            .deleteItem(item.id);
                      },
                    );
                  },
                ),
            ),
            Gap(50.h),
            // if(showDeleteButton)
            //   Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 24.w),
            //     child: ElevatedButton(
            //       onPressed: () {
            //         showDialog(
            //           context: context,
            //           builder: (BuildContext context) => AlertDialog(
            //             title: Text('Delete Collection', style: TextStyle(fontSize: 18.sp)),
            //             content: Text('Are you sure? This action cannot be undone.', style: TextStyle(fontSize: 16.sp)),
            //             actions: <Widget>[
            //               TextButton(
            //                 onPressed: () => Navigator.pop(context),
            //                 child: Text('Cancel', style: TextStyle(fontSize: 16.sp)),
            //               ),
            //               TextButton(
            //                 onPressed: () {
            //                   ref.read(watchlistProvider.notifier).deleteCollection(collectionId!);
            //                   Navigator.pop(context);
            //                   Navigator.pop(context);
            //                 },
            //                 child: Text('Delete', style: TextStyle(color: AppColors.red, fontSize: 16.sp)),
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: AppColors.red,
            //         elevation: 0,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(40.r),
            //         ),
            //         minimumSize: Size(double.infinity, 54.h),
            //       ),
            //       child: Text('Delete Collection', style: TextStyle(fontSize: 16.sp)),
            //     ),
            //   ),
          ],
        ),
      ),
      
      // Update the bottomNavigationBar section
      bottomNavigationBar: (_showBottomNavBar || _showDeleteMode) 
        ? Padding(
            padding: EdgeInsets.only(bottom: 24.h),
            child: Container(
              color: Colors.transparent,
              height: 97.h,
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: _showDeleteMode ? 0.9.sw - 48.w : (_navBarExpanded ? 0.7.sw : 0.6.sw), 
                  child: Stack(
                    children: <Widget>[
                      // Nav bar container 
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        height: _showDeleteMode ? 62.h : (_navBarExpanded ? 100.h : 90.h),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          color: _showDeleteMode ? AppColors.red : Colors.black,
                          borderRadius: _showDeleteMode
                              ? BorderRadius.circular(40.r)
                              : (_navBarExpanded
                                  ? BorderRadius.circular(24.r)
                                  : BorderRadius.circular(64.r)),
                        ),
                        margin: EdgeInsets.only(
                          top: _showDeleteMode ? 24.h : 18.h,
                          bottom: _showDeleteMode ? 24.h : 18.h
                        ),
                        child: _showDeleteMode 
                          // Delete confirmation button when in delete mode
                          ? TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: Text('Delete Collection', style: TextStyle(fontSize: 22.sp)),
                                    content: Text('Are you sure? This action cannot be undone.', style: TextStyle(fontSize: 16.sp)),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Cancel', style: TextStyle(fontSize: 16.sp)),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          ref.read(watchlistProvider.notifier).deleteCollection(collectionId!);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Delete', style: TextStyle(color: AppColors.red, fontSize: 16.sp)),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text(
                                'Delete Collection',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          // Navigation buttons when not in delete mode
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                // Sort button
                                IconButton(
                                  onPressed: _toggleBottomNavBar,
                                  icon: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(
                                        PhosphorIconsRegular.arrowBendDoubleUpLeft,
                                        color: AppColors.greyLight,
                                        size: 22.sp,
                                      ),
                                      Text(
                                        'Sort',
                                        style: TextStyle(
                                          color: AppColors.greyLight,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                
                                // Edit button
                                IconButton(
                                  onPressed: () async {
                                    _toggleBottomNavBar();
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) => WatchListUpdateCollectionScreen(
                                          initialName: collection.name,
                                          collectionId: collectionId!,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(
                                        PhosphorIconsRegular.pencilSimple,
                                        color: AppColors.greyLight,
                                        size: 22.sp,
                                      ),
                                      Text(
                                        'Edit',
                                        style: TextStyle(
                                          color: AppColors.greyLight,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                
                                // Delete button - SIMPLIFIED TO MAKE IT MORE CLICKABLE
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      print("Delete button pressed"); // Add logging
                                      _toggleDeleteButton();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(8.w),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Icon(
                                            PhosphorIconsRegular.trash,
                                            color: AppColors.greyLight,
                                            size: 22.sp,
                                          ),
                                          Text(
                                            'Delete',
                                            style: TextStyle(
                                              color: AppColors.greyLight,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : null,
    );
  }
}
