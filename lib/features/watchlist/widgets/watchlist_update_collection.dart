import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; // Add this for provider support
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../wallet/data/models/nft_model.dart';
import '../presentation/providers/watchlist_collection_details_provider.dart';
import '../presentation/providers/watchlist_collection_model.dart';
import '../presentation/providers/watchlist_item_model.dart';
import '../presentation/providers/watchlist_provider.dart'; // Add provider import
import 'watchlist_newList_tile.dart';

class WatchListUpdateCollectionScreen extends ConsumerStatefulWidget {
  const WatchListUpdateCollectionScreen({
    required this.initialName,  // Add this parameter
    required this.collectionId, // Add this parameter
    super.key,
  });
  
  final String initialName;
  final String collectionId;

  @override
  ConsumerState<WatchListUpdateCollectionScreen> createState() => _WatchListUpdateCollectionScreenState();
}

class _WatchListUpdateCollectionScreenState extends ConsumerState<WatchListUpdateCollectionScreen> {
  late TextEditingController _controller;
  bool _isKeyboardOpen = false;
  bool _isButtonEnabled = false;
  late WatchlistCollection _collection;
  // Add a field to store the handler reference
  late LifecycleEventHandler _lifecycleEventHandler;

  @override
  void initState() {
    super.initState();
    // Initialize controller with the initial name
    _controller = TextEditingController(text: widget.initialName);
    _isButtonEnabled = _controller.text.isNotEmpty;
    
    // Create the lifecycle handler with proper mounted check
    _lifecycleEventHandler = LifecycleEventHandler(
      onChange: () {
        if (mounted) {
          final bool isOpen = MediaQuery.of(context).viewInsets.bottom > 0;
          setState(() {
            _isKeyboardOpen = isOpen;
          });
        }
      },
    );
    
    // Fetch collection details
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final collection = ref.read(watchlistCollectionDetailsProvider(widget.collectionId)).collection;
        setState(() {
          _collection = collection;
        });
      }
    });
    
    // Listen for keyboard visibility changes
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _listenKeyboardVisibility();
      }
    });

    _controller.addListener(_checkTextField);
  }

  void _checkTextField() {
    setState(() {
      _isButtonEnabled = _controller.text.isNotEmpty;
    });
  }

  void _listenKeyboardVisibility() {
    // Add the observer using the class field
    WidgetsBinding.instance.addObserver(_lifecycleEventHandler);
  }

  @override
  void dispose() {
    // Important: Remove the observer in dispose
    WidgetsBinding.instance.removeObserver(_lifecycleEventHandler);
    _controller.removeListener(_checkTextField); 
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardPadding = MediaQuery.of(context).viewInsets.bottom;
    
    // Fetch collection data for display
    final WatchlistCollection? collection = 
        ref.watch(watchlistCollectionDetailsProvider(widget.collectionId)).collection;
    
    // Get first 4 NFTs from collection or empty list if not available
    final List<WatchlistItem> items = collection?.items ?? [];
    final List<dynamic> collectionItems = items.take(4).toList();
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(PhosphorIconsBold.caretLeft, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 6.w),
            child: IconButton(
              icon: Icon(PhosphorIconsRegular.star, size: 24.sp),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: <Widget>[
            Text(
              'Update Your Collection',
              style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w600),
            ),
            Gap(20.h),
            
            // Replace the empty Hero with one that shows collection items
            Hero(
              tag: 'update_collection_${widget.collectionId}', // Use unique tag
              child: WatchlistNewListTile(
                // Pass the collection items as NFTs
                selectedNFTs: collectionItems.map((item) {
                  if (item is WatchlistItem) {
                    // Convert WatchlistItem to NFT
                    return NFT(
                      id: item.id,
                      price: '',
                      imageUrl: item.imagePath,
                    );
                  }
                  return null;
                }).whereType<NFT>().toList(),
                // No tokens for NFT collection
                selectedTokens: const [],
              ),
            ),
            
            Gap(30.h),
            TextField(
              controller: _controller,
              style: TextStyle(fontSize: 24.sp),
              decoration: const InputDecoration(
                hintText: 'List Name',
                hintStyle: TextStyle(color: AppColors.greyMedium, fontWeight: FontWeight.w600),
                border: InputBorder.none, // Removes the border
              ),
              textAlign: TextAlign.center, // Aligns text to center
            ), 
            const Spacer(),
            AnimatedPadding(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.only(bottom: _isKeyboardOpen ? keyboardPadding : 24.h),
              child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                        // Update collection name in the provider
                        ref.read(watchlistProvider.notifier)
                           .updateCollectionName(widget.collectionId, _controller.text);
                        
                        // Pop back to previous screen - no need to return a value
                        Navigator.pop(context);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isButtonEnabled
                      ? Colors.black
                      : AppColors.greyMedium,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 15.h),
                  child: Text(
                    'Update', 
                    style: TextStyle(
                      color: _isButtonEnabled
                        ? Colors.white
                        : AppColors.greyLight,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LifecycleEventHandler extends WidgetsBindingObserver {
  LifecycleEventHandler({required this.onChange});
  final VoidCallback onChange;

  @override
  void didChangeMetrics() {
    onChange();
  }
}
