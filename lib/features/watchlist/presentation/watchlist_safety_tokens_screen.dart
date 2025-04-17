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
  ConsumerState<WatchlistSafetyTokensScreen> createState() => _WatchlistSafetyTokensScreenState();
}

class _WatchlistSafetyTokensScreenState extends ConsumerState<WatchlistSafetyTokensScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<Offset> _deleteButtonAnimation;
  String? collectionId;
  bool _showBottomNavBar = false;
  bool _showDeleteMode = false;
  bool _navBarExpanded = false;
  bool _showCancelButton = false;
  bool _isSortDescending = false;
  bool _isSorting = false;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  // Animation variables
  List<WatchlistItem> _sortedItems = <WatchlistItem>[];
  bool _isAnimatingSorting = false;
  Map<String, Offset> _itemPositions = <String, Offset>{};
  Map<String, GlobalKey> _itemKeys = <String, GlobalKey<State<StatefulWidget>>>{};
  List<WatchlistItem> _currentItems = <WatchlistItem>[];

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

  void _captureItemPositions() {
    _itemPositions.clear();
    
    _itemKeys.forEach((String id, GlobalKey<State<StatefulWidget>> key) {
      final RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final Offset position = renderBox.localToGlobal(Offset.zero);
        final RenderObject? scrollableParent = context.findRenderObject();
        final Offset parentPosition = scrollableParent != null 
            ? (scrollableParent as RenderBox).localToGlobal(Offset.zero) 
            : Offset.zero;
            
        _itemPositions[id] = Offset(
          position.dx - parentPosition.dx,
          position.dy - parentPosition.dy
        );
      }
    });
  }

  // Sorting function
  void _sortItemsByNativeValue() {
    if (collectionId == null) return;

    final WatchlistCollection collection = ref.read(watchlistCollectionDetailsProvider(collectionId!)).collection;
    
    _currentItems = List<WatchlistItem>.from(collection.items);
    _sortedItems = List<WatchlistItem>.from(_currentItems);
    
    _captureItemPositions();
    
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
      _isSorting = true;
    });

    // Update the list after animation
    Future<void>.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
           .reorderItems(_sortedItems);
        
        setState(() {
          _isAnimatingSorting = false;
          _isSorting = false;
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
    
    if (_itemKeys.length != collection.items.length) {
      _itemKeys = <String, GlobalKey<State<StatefulWidget>>>{
        for (WatchlistItem item in collection.items)
          item.id: GlobalKey(),
      };
    }
    
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
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: EdgeInsets.only(right: 8.w),
            padding: EdgeInsets.symmetric(
              horizontal: 12.w, 
              vertical: 6.h
            ),
            decoration: BoxDecoration(
              color: showDeleteButton ? AppColors.red.withValues(alpha: 0.2) : AppColors.greyVeryLight,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: GestureDetector(
              onTap: showDeleteButton 
                ? () {
                    // Remove All functionality
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text('Remove All', style: TextStyle(fontSize: 22.sp)),
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
                            child: Text('Remove', style: TextStyle(color: AppColors.red, fontSize: 16.sp)),
                          ),
                        ],
                      ),
                    );
                  }
                : () async {
                    // Edit functionality
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
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) => FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.3, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                child: Text(
                  showDeleteButton ? 'Remove All' : 'Edit',
                  key: ValueKey<String>(showDeleteButton ? 'remove_all' : 'edit'),
                  style: TextStyle(
                    color: showDeleteButton ? AppColors.red : AppColors.grey,
                    fontSize: 14.sp,
                    fontWeight: showDeleteButton ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
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
                : Stack(
                  alignment: Alignment.topLeft,
                    children: <Widget>[
                      ListView.builder(
                        itemCount: collection.items.length,
                        itemBuilder: (BuildContext context, int index) {
                          final WatchlistItem item = collection.items[index];
                          return SortableItemWrapper(
                            key: _itemKeys[item.id],
                            itemId: item.id,
                            isAnimating: _isAnimatingSorting,
                            sortedItems: _sortedItems,
                            currentItems: _currentItems,
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
                                // Create a local copy of the item before deletion
                                final itemToDelete = item;
                                
                                // Use a direct, synchronous update
                                ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                                    .deleteItem(itemToDelete.id);
                                    
                                // Explicitly maintain delete mode
                                ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier).preserveDeleteMode();
                              },
                            ),
                          );
                        },
                      ),
                      
                      if (_isAnimatingSorting)
                        ...collection.items.map((WatchlistItem item) {
                          final int currentIndex = _currentItems.indexWhere((WatchlistItem i) => i.id == item.id);
                          final int targetIndex = _sortedItems.indexWhere((WatchlistItem i) => i.id == item.id);
                          
                          if (currentIndex == targetIndex) {
                            return const SizedBox.shrink();
                          }
                          
                          final Offset startPosition = _itemPositions[item.id] ?? Offset(0, currentIndex * 70.h);
                          final double verticalOffset = (targetIndex - currentIndex) * 70.h;
                          
                          return Positioned(
                            key: ValueKey('animated_${item.id}'),
                            top: startPosition.dy,
                            left: 0,
                            right: 0,
                            height: 70.h,
                            child: TweenAnimationBuilder<double>(
                              tween: Tween<double>(begin: 0, end: 1),
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              builder: (BuildContext context, double value, Widget? child) => Transform.translate(
                                  offset: Offset(0, verticalOffset * value),
                                  child: Opacity(
                                    opacity: 1.0 - (value * 0.2),
                                    child: WatchlistTokenTile(
                                      tokenData: <String, String>{
                                        'id': item.id,
                                        'name': item.name,
                                        'imagePath': item.imagePath,
                                        'usdValue': item.usdValue ?? '',
                                        'nativeValue': item.nativeValue ?? '',
                                      },
                                      deleteNft: showDeleteButton,
                                      onDelete: () {},
                                    ),
                                  ),
                                ),
                            ),
                          );
                        }).toList(),
                    ],
                  ),
            ),
            
            Padding(
              padding: EdgeInsets.fromLTRB(26.w, 16.h, 26.w, 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Sort Button - Only show when not in delete mode
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: showDeleteButton ? 0.0 : 1.0,
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: SizedBox(
                        width: showDeleteButton ? 0 : 160.w,
                        height: 56.h,
                        child: showDeleteButton 
                          ? null 
                          : FilledButton(
                              onPressed: _sortItemsByNativeValue,
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.r),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    _isSortDescending 
                                      ? PhosphorIconsRegular.arrowDown 
                                      : PhosphorIconsRegular.arrowUp,
                                    color: Colors.white,
                                    size: 22.sp,
                                  ),
                                  Gap(8.w),
                                  Text(
                                    'Sort',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      ),
                    ),
                  ),
                  
                  // Remove/Delete Button
                  Expanded(
                    child: AnimatedPadding(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.only(left: showDeleteButton ? 0 : 12.w),
                      child: FilledButton(
                        onPressed: showDeleteButton 
                          ? _toggleDeleteButton 
                          : _toggleDeleteButton,
                        style: FilledButton.styleFrom(
                          backgroundColor: showDeleteButton ? AppColors.black : Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              showDeleteButton ? 'Cancel' : 'Remove',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
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
    );
  }
}

class SortableItemWrapper extends StatelessWidget {
  const SortableItemWrapper({
    Key? key,
    required this.itemId,
    required this.isAnimating,
    required this.sortedItems,
    required this.currentItems,
    required this.child,
  }) : super(key: key);

  final String itemId;
  final bool isAnimating;
  final List<WatchlistItem> sortedItems;
  final List<WatchlistItem> currentItems;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (isAnimating) {
      return SizedBox(
        height: 70.h,
        child: Opacity(
          opacity: 0,
          child: child,
        ),
      );
    }

    return child;
  }
}
