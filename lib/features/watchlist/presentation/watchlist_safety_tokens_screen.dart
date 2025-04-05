// Update in watchlist_cute_token_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../widgets/watchlist_token_tile.dart';
import '../widgets/watchlist_update_collection.dart';
import 'providers/watchlist_collection_details_provider.dart';
import 'providers/watchlist_collection_model.dart';
import 'providers/watchlist_item_model.dart';
import 'providers/watchlist_provider.dart';

class WatchlistSafetyTokensScreen extends ConsumerStatefulWidget {
  const WatchlistSafetyTokensScreen({this.collectionId, super.key});
  
  // Collection ID parameter
  final String? collectionId;

  @override
  ConsumerState<WatchlistSafetyTokensScreen> createState() => _WatchlistCuteTokenScreenState();
}

class _WatchlistCuteTokenScreenState extends ConsumerState<WatchlistSafetyTokensScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<Offset> _deleteButtonAnimation;
  String? collectionId;
  bool _showBottomNavBar = false;
  bool _showDeleteMode = false;
  bool _navBarExpanded = false;
  bool _showCancelButton = false;
  bool _isSortDescending = false;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  // Animation variables
  List<WatchlistItem> _sortedItems = <WatchlistItem>[];
  bool _isAnimatingSorting = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    
    // Animation for delete mode
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Animation for delete button
    _deleteButtonAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    // Handle collection ID
    if (widget.collectionId != null) {
      collectionId = widget.collectionId;
    } else {
      // Find Safety Tokens collection if not provided
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final List<WatchlistCollection> safetyCollections = ref.read(watchlistProvider.notifier)
            .getCollectionsByType(CollectionType.token)
            .where((WatchlistCollection c) => c.name.contains('Safety Tokens'))
            .toList();
        
        if (safetyCollections.isNotEmpty) {
          setState(() {
            collectionId = safetyCollections.first.id;
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

  // Toggle delete button
  void _toggleDeleteButton() {
    if (collectionId == null) {
      return;
    }
    
    final bool currentDeleteMode = ref.read(watchlistCollectionDetailsProvider(collectionId!)).isDeleteMode;
    
    setState(() {
      _showDeleteMode = !_showDeleteMode;
      
      if (!currentDeleteMode) {
        _navBarExpanded = true;
      } else {
        _showBottomNavBar = false;
      }
    });
    
    ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier).toggleDeleteMode();
    
    if (!currentDeleteMode) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _toggleBottomNavBar() {
    setState(() {
      _showBottomNavBar = !_showBottomNavBar;
      _navBarExpanded = _showBottomNavBar;
      _showCancelButton = _showBottomNavBar;
      
      if (!_showBottomNavBar && _showDeleteMode) {
        _toggleDeleteButton();
      }
    });
  }

  // Sorting function
  void _sortItemsByNativeValue() {
    if (collectionId == null) return;

    // Don't start a new animation if one is already in progress
    if (_isAnimatingSorting) return;

    final WatchlistCollection collection = ref.read(watchlistCollectionDetailsProvider(collectionId!)).collection;
    _sortedItems = List<WatchlistItem>.from(collection.items);

    // Sort the items
    _sortedItems.sort((WatchlistItem a, WatchlistItem b) {
      final double valueA = _extractNumericValue(a.nativeValue);
      final double valueB = _extractNumericValue(b.nativeValue);
      return _isSortDescending ? valueB.compareTo(valueA) : valueA.compareTo(valueB);
    });

    // Toggle sort direction for next time
    _isSortDescending = !_isSortDescending;

    // Start animation
    setState(() {
      _isAnimatingSorting = true;
    });

    // Update the list after animation, but don't animate again
    Future<void>.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        // First update the provider without rebuilding
        ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
           .reorderItems(_sortedItems);
        
        // Then turn off animation flag
        setState(() {
          _isAnimatingSorting = false;
        });
      }
    });
  }

  // Add the helper method for numeric value extraction
  double _extractNumericValue(String? nativeValue) {
    if (nativeValue == null || nativeValue.isEmpty) return 0;
    try {
      final String numericPart = nativeValue.split(' ')[0].replaceAll(',', '');
      return double.tryParse(numericPart) ?? 0.0;
    } catch (e) {
      return 0;
    }
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
    
    // Get collection data
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
          children: <Widget>[
            Text(
              collection.name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Token images preview
                SizedBox(
                  width: 45.w,
                  height: 20.h,
                  child: Stack(
                    children: <Widget>[
                      for (int i = 0; i < (collection.items.length > 3 ? 3 : collection.items.length); i++)
                        Positioned(
                          right: i * 5.w,
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
                Gap(4.w),
                Text(
                  '${collection.items.length} items',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(20.w),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          if (_showCancelButton) 
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: showDeleteButton 
                    ? AppColors.red.withValues(alpha: 0.2)
                    : AppColors.blue.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: GestureDetector(
                  onTap: () {
                    if (showDeleteButton) {
                      _toggleDeleteButton();
                    }
                    _toggleBottomNavBar();
                  },
                  child: Text(
                    showDeleteButton ? 'Done' : 'Cancel',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: showDeleteButton 
                        ? AppColors.red 
                        : AppColors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ) 
          else 
            Padding(
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
            children: <Widget>[
              Gap(8.h), 
              Container(
                color: AppColors.greyVeryLight,
                height: 1.h,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: <Widget>[
            Gap(12.h),
            Expanded(
              child: collection.items.isEmpty
                ? Center(child: Text('No tokens in this collection', style: TextStyle(fontSize: 16.sp)))
                : ListView.builder(
                    itemCount: collection.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final WatchlistItem item = collection.items[index];
                      
                      // Only calculate target position if we're actually animating
                      final int targetIndex = _isAnimatingSorting 
                          ? _sortedItems.indexWhere((WatchlistItem i) => i.id == item.id)
                          : index;
                      
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        transform: Matrix4.translationValues(
                          0,
                          _isAnimatingSorting ? (targetIndex - index) * 70.h : 0,
                          0,
                        ),
                        child: WatchlistTokenTile(
                          tokenData: <String, String>{
                            'id': item.id,
                            'name': item.name,
                            'imagePath': item.imagePath,
                            'usdValue': item.usdValue ?? '',
                            'nativeValue': item.nativeValue ?? '',
                          },
                          deleteNft: showDeleteButton,
                          onDelete: () {
                            ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                                .deleteItem(item.id);
                          },
                        ),
                      );
                    },
                  ),
            ),
            Gap(50.h),
          ],
        ),
      ),
      
      // Bottom navigation bar
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
                          bottom: _showDeleteMode ? 24.h : 18.h,
                        ),
                        child: _showDeleteMode 
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
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                // Sort button
                                IconButton(
                                  onPressed: () {
                                    _toggleBottomNavBar();
                                    _sortItemsByNativeValue();
                                  },
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
                                
                                // Delete button
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: _toggleDeleteButton,
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
