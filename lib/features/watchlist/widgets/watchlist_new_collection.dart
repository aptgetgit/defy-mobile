import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../wallet/data/models/nft_model.dart';
import '../../wallet/data/models/token_model.dart';
import '../../wallet/presentation/providers/wallet_provider.dart';
import '../../wallet/presentation/providers/wallet_state.dart';
import '../presentation/providers/watchlist_new_collection_model.dart';
import '../presentation/providers/watchlist_new_collection_provider.dart';
import '../presentation/watchlist_screen.dart';
import 'watchlist_newList_tile.dart';

enum CollectionSource {
  token,
  nft,
}

class WatchListNewCollectionScreen extends ConsumerStatefulWidget {
  final CollectionSource source;
  final GlobalKey? newListTileKey;

  const WatchListNewCollectionScreen({
    Key? key,
    this.source = CollectionSource.token,
    this.newListTileKey,
  }) : super(key: key);

  @override
  ConsumerState<WatchListNewCollectionScreen> createState() => _WatchListNewCollectionScreenState();
}

// Update in WatchListNewCollectionScreen
class _WatchListNewCollectionScreenState extends ConsumerState<WatchListNewCollectionScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isKeyboardOpen = false;
  bool _isButtonEnabled = false;
  bool _isCreating = false;
  bool _hasSelectedItems = false; // Track if user has selected items
  final GlobalKey<WatchlistNewListTileState> _tileKey = GlobalKey();
  final FocusNode _textFieldFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _listenKeyboardVisibility();

      // Add this to trigger the fill animation after the position animation completes
      Future.delayed(const Duration(milliseconds: 650), () {
        if (mounted && _tileKey.currentState != null) {
          _tileKey.currentState?.startFillAnimation();
        }
      });

      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          // Request focus to automatically show keyboard
          _textFieldFocusNode.requestFocus();
        }
      });
    });

    _controller.addListener(_checkTextField);
  }

  void _checkTextField() {
    setState(() {
      _isButtonEnabled = _controller.text.isNotEmpty;
    });
  }

  void _listenKeyboardVisibility() {
    WidgetsBinding.instance.addObserver(
      LifecycleEventHandler(
        onChange: () {
          final bool isOpen = MediaQuery.of(context).viewInsets.bottom > 0;
          setState(() {
            _isKeyboardOpen = isOpen;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_checkTextField);
    _controller.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  // Update in watchlist_new_collection.dart
  Future<void> _handleCreate() async {
    setState(() {
      _isCreating = true;
    });

    // Remove animation call - just add a delay
    // Removed: _tileKey.currentState?.startAnimation();
    
    // Keep a small delay to allow for state changes
    await Future.delayed(const Duration(milliseconds: 300));

    final WalletState walletState = ref.read(walletNotifierProvider);

    
    final WatchlistNewCollection newCollection = WatchlistNewCollection(
      name: _controller.text,
      selectedTokens: walletState.selectedTokens
          .map((int index) => walletState.allTokens[index])
          .toList(),
      selectedNFTs: walletState.selectedNFTs.entries
          .expand((MapEntry<int, Set<int>> entry) => entry.value.map(
                (int index) => walletState.allNFTCollections[entry.key].nfts[index],
              ))
          .toList(),
      creationDate: DateTime.now(),
    );

    // Add the new collection to the appropriate provider
    ref.read(watchlistCollectionsProvider.notifier).addCollection(newCollection);

    // Navigate with the hero tag to allow for continuous animation
    await Navigator.pushReplacement(
      context,
      PageRouteBuilder<void>(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => WatchListScreen(
          // Pass hero tag to WatchListScreen
        ),
      ),
    );

    setState(() {
      _isCreating = false;
    });

    
    ref.read(walletNotifierProvider.notifier).clearSelectedTokens();
  }

  // Updated _showSelectionSheet method to handle NFT collections differently
  Future<void> _showSelectionSheet(BuildContext context) async {
    final WalletState initialWalletState = ref.read(walletNotifierProvider);
    final int initialItemCount = initialWalletState.selectedTokens.length + 
        initialWalletState.selectedNFTs.values.fold(0, (int sum, Set<int> list) => sum + list.length);
        
    final TextEditingController _searchController = TextEditingController();
    final FocusNode _searchFocusNode = FocusNode();
    String _searchQuery = '';
    bool _isTextFieldFocused = false;
  
    // Track selected collection for NFTs
    NFTCollection? selectedCollection;

    // Determine what to show based on source
    List<dynamic> items = widget.source == CollectionSource.token
        ? initialWalletState.allTokens
        : initialWalletState.allNFTCollections; // Show collections first for NFTs
  
    // Function to update search results
    void _updateSearchResults(String query) {
      if (widget.source == CollectionSource.token) {
        items = initialWalletState.allTokens.where((Token token) =>
          token.name.toLowerCase().contains(query.toLowerCase()) ||
          token.currency.toLowerCase().contains(query.toLowerCase())
        ).toList();
      } else if (selectedCollection == null) {
        // Filter NFT collections
        items = initialWalletState.allNFTCollections.where((NFTCollection collection) =>
          collection.name.toLowerCase().contains(query.toLowerCase())
        ).toList();
      } else {
        // Filter NFTs within the selected collection
        items = selectedCollection!.nfts.where((NFT nft) =>
          nft.id.toLowerCase().contains(query.toLowerCase())
        ).toList();
      }
    }

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          // Update focus listener
          void _onFocusChange() {
            setState(() {
              _isTextFieldFocused = _searchFocusNode.hasFocus;
            });
          }

          // Add focus listener
          _searchFocusNode.addListener(_onFocusChange);
          
          // Function to show NFTs in a collection
          void _showNFTsInCollection(NFTCollection collection) {
            setState(() {
              selectedCollection = collection;
              items = collection.nfts;
              _searchController.clear();
              _searchQuery = '';
            });
          }
          
          // Function to go back to collections
          void _backToCollections() {
            setState(() {
              selectedCollection = null;
              items = initialWalletState.allNFTCollections;
              _searchController.clear();
              _searchQuery = '';
            });
          }
          
          return Padding(
            padding: const EdgeInsets.all(24),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(28.r)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Title and Close/Back Button
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        
                        Text(
                          widget.source == CollectionSource.token 
                              ? 'Select Tokens' 
                              : selectedCollection != null
                                  ? 'Select NFTs' // Show collection name
                                  : 'Select A Collection',
                          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start,
                        ),
                        
                        // Always show close button
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(PhosphorIconsRegular.x, size: 24.sp),
                        ),
                      ],
                    ),
                  ),
                  Gap(16.h),
                  
                  // Animated Search Bar
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: GestureDetector(
                      onTap: _searchFocusNode.requestFocus,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 244, 244, 246),
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            
                            // Animated positions
                            Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                // Animated Positioned for Search Icon
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeInOut,
                                  left: (_isTextFieldFocused || _searchQuery.isNotEmpty)
                                      ? 12.w
                                      : (MediaQuery.of(context).size.width - 44.w - 22.w - 8.w - 150.w) / 2 - 20.w,
                                  top: 12.5.h,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Icon(
                                      PhosphorIconsBold.magnifyingGlass,
                                      color: AppColors.greyLight,
                                      size: 20.sp,
                                    ),
                                  ),
                                ),
                                // Animated Positioned for "Search for assets" Text
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeInOut,
                                  left: (_isTextFieldFocused || _searchQuery.isNotEmpty)
                                      ? 40.w // Adjust this value to align with the search icon
                                      : (MediaQuery.of(context).size.width - 44.w - 22.w - 8.w - 150.w) / 2 + 10.w,
                                  top: 12.5.h,
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 1500),
                                    opacity: (!_isTextFieldFocused && _searchQuery.isEmpty) ? 1.0 : 0.0,
                                    child: Text(
                                      widget.source == CollectionSource.token 
                                          ? 'Search tokens'
                                          : selectedCollection != null
                                              ? 'Search NFTs' 
                                              : 'Search collections',
                                      style: TextStyle(
                                        color: AppColors.greyLight,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                // TextField
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 40.w), // Reserve space for the icon
                                    Expanded(
                                      child: TextField(
                                        focusNode: _searchFocusNode,
                                        controller: _searchController,
                                        showCursor: _isTextFieldFocused || _searchQuery.isNotEmpty,
                                        onChanged: (String value) {
                                          setState(() {
                                            _searchQuery = value;
                                            _updateSearchResults(value);
                                          });
                                        },
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: _searchQuery.isNotEmpty ? TextAlign.left : TextAlign.center,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '',
                                          contentPadding: EdgeInsets.symmetric(vertical: 11.h),
                                          suffixIcon: _searchQuery.isNotEmpty
                                              ? IconButton(
                                                  icon: CircleAvatar(
                                                    backgroundColor: const Color.fromARGB(255, 189, 189, 189),
                                                    radius: 10.r,
                                                    child: Center(
                                                      child: Icon(
                                                        PhosphorIconsBold.x,
                                                        color: AppColors.white,
                                                        size: 12.sp,
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _searchController.clear();
                                                      _searchQuery = '';
                                                      _updateSearchResults('');
                                                    });
                                                  },
                                                )
                                              : null,
                                          suffixIconConstraints: const BoxConstraints(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Gap(4.h),
                  
                  // Token/NFT List
                  SizedBox(
                    height: 300.h, // Adjust height to fit content
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = items[index];
                        
                        // Handle different types of items
                        if (widget.source == CollectionSource.token) {
                          // For Tokens
                          final Token token = item as Token;
                          
                          return ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                            leading: Image.asset(token.imagePath, width: 40.w, height: 40.w),
                            title: Text(
                              token.name,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                            subtitle: Text(
                              token.currency,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.greyLight,
                              ),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  token.price,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                                Text(
                                  _formatPercentageChange(token.percentageChange),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: _isPositiveChange(token.percentageChange)
                                        ? AppColors.green
                                        : AppColors.red,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              ref.read(walletNotifierProvider.notifier).toggleTokenSelection(index);
                              setState(() {}); // Update UI
                            },
                          );
                        } else if (selectedCollection == null) {
                          // For NFT Collections
                          final NFTCollection collection = item as NFTCollection;
                          final int nftCount = collection.nfts.length;
                          
                          return ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.asset('assets/images/cyborg2.png', width: 48.w, height: 48.w)
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                collection.name,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              '$nftCount Items',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.greyLight,
                              ),
                            ),
                            onTap: () => _showNFTsInCollection(collection),
                          );
                        } else {
                          // For NFTs within a collection
                          final NFT nft = item as NFT;
                          
                          // Find collection index and NFT index for selection
                          int collectionIndex = -1;
                          int nftIndex = -1;
                          
                          for (int i = 0; i < initialWalletState.allNFTCollections.length; i++) {
                            if (initialWalletState.allNFTCollections[i] == selectedCollection) {
                              collectionIndex = i;
                              nftIndex = selectedCollection!.nfts.indexOf(nft);
                              break;
                            }
                          }
                        
                          initialWalletState.selectedNFTs[collectionIndex]?.contains(nftIndex) == true;
                          
                          return Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.asset(
                                  nft.imageUrl,
                                  width: 48.w,
                                  height: 48.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                '#${nft.id}',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                              subtitle: Text(
                                'NFT ${nft.id}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.greyLight,
                                ),
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    '\$14K',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Text(
                                    _formatPercentageChange(32.02),
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: _isPositiveChange(32.02)
                                          ? AppColors.green
                                          : AppColors.red,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                if (collectionIndex >= 0 && nftIndex >= 0) {
                                  ref.read(walletNotifierProvider.notifier).toggleNFTSelection(collectionIndex, nftIndex);
                                  setState(() {}); // Update UI
                                }
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Gap(12.h),
                  
                  // Add To Collection Button
                  if (widget.source == CollectionSource.token || 
                    (widget.source == CollectionSource.nft && selectedCollection != null)) 
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 24.h),
                      child: SizedBox(
                        width: double.infinity,
                        height: 49.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the sheet after adding
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(38.r),
                            ),
                          ),
                          child: Text(
                            'Add To Collection',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    // Add padding at the bottom when not showing button
                    SizedBox(height: 16.h),
                ],
              ),
            ),
          );
        },
      ),
    );
    
    // After closing the sheet, check if any new items were selected
    final WalletState currentWalletState = ref.read(walletNotifierProvider);
    final int currentItemCount = currentWalletState.selectedTokens.length + 
        currentWalletState.selectedNFTs.values.fold(0, (int sum, Set<int> list) => sum + list.length);
    
    // Update _hasSelectedItems if items were added
    if (currentItemCount > initialItemCount) {
      setState(() {
        _hasSelectedItems = true;
      });
    }
  }
  
  // Helper methods for percentage formatting
  String _formatPercentageChange(dynamic value) {
    if (value == null) {
      return '+0%';
    }
    
    if (value is String) {
      // If it's already a string, ensure it has the % symbol
      return value.endsWith('%') ? value : '$value%';
    }
    
    if (value is num) {
      // If it's a number, format it with sign and %
      final String sign = value >= 0 ? '+' : '';
      return '$sign${value.toStringAsFixed(2)}%';
    }
    
    // Fall back to default for unknown types
    return '+0%';
  }
  
  bool _isPositiveChange(dynamic value) {
    if (value == null) {
      return true; // Default to positive
    }
    
    if (value is String) {
      // Check if the string starts with + or is a positive number
      return !value.startsWith('-');
    }
    
    if (value is num) {
      return value >= 0;
    }
    
    return true; // Default to positive for unknown types
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardPadding = MediaQuery.of(context).viewInsets.bottom;
    final WalletState walletState = ref.watch(walletNotifierProvider);

    final int selectedTokensCount = walletState.selectedTokens.length;
    final int selectedNFTsCount = walletState.selectedNFTs.values
        .fold(0, (int sum, Set<int> list) => sum + list.length);
    final int totalSelectedItems = selectedTokensCount + selectedNFTsCount;

    // Update _hasSelectedItems when items are selected
    if (totalSelectedItems > 0 && !_hasSelectedItems) {
      _hasSelectedItems = true;
    }

    final List<Token> selectedTokens = walletState.selectedTokens
        .map((int index) => walletState.allTokens[index])
        .toList();

    final List<NFT> selectedNFTs = walletState.selectedNFTs.entries
        .expand((MapEntry<int, Set<int>> entry) => entry.value.map(
              (int index) => walletState.allNFTCollections[entry.key].nfts[index],
            ),)
        .toList();

    // Determine the button text based on state
    String buttonText;
    if (_isCreating) {
      buttonText = 'Creating...';
    } else if (_hasSelectedItems) {
      buttonText = 'Create';
    } else {
      buttonText = widget.source == CollectionSource.nft ? 'Add NFTs' : 'Add Tokens';
    }

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
              'Name Your Collection',
              style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w600),
            ),
            Gap(20.h),
            Hero(
              tag: 'new_list',
              child: Material(
                color: Colors.transparent,
                child: WatchlistNewListTile(
                  key: _tileKey,
                  selectedTokens: selectedTokens,
                  selectedNFTs: selectedNFTs,
                ),
              ),
            ),
            if (totalSelectedItems > 0)
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Text(
                  totalSelectedItems == 1
                      ? '1 item selected'
                      : '$totalSelectedItems items selected',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            Gap(20.h),
            TextField(
              controller: _controller,
              focusNode: _textFieldFocusNode,
              style: TextStyle(fontSize: 24.sp),
              decoration: const InputDecoration(
                hintText: 'List Name',
                hintStyle: TextStyle(color: AppColors.greyMedium, fontWeight: FontWeight.w600),
                border: InputBorder.none,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            AnimatedPadding(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.only(bottom: _isKeyboardOpen ? keyboardPadding : 24.h),
              child: ElevatedButton(
                onPressed: (_isButtonEnabled && _hasSelectedItems) || (!_hasSelectedItems)
                    ? () async {
                        if (_hasSelectedItems) {
                          // If items are selected, create the collection
                          await _handleCreate();
                        } else {
                          // If no items selected, show the selection sheet
                          _showSelectionSheet(context);
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: (_isButtonEnabled && _hasSelectedItems) || (!_hasSelectedItems)
                      ? Colors.black
                      : AppColors.greyMedium,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  fixedSize: Size(double.infinity, 56.w),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 15.h),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: (_isButtonEnabled && _hasSelectedItems) || (!_hasSelectedItems) 
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