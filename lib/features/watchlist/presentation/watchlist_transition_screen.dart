//  import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';

// import '../../../config/theme/colors.dart';
// import '../../wallet/data/models/nft_model.dart';
// import '../../wallet/data/models/token_model.dart';
// import '../../wallet/presentation/providers/wallet_provider.dart';
// import '../../wallet/presentation/providers/wallet_state.dart';
// import '../presentation/providers/watchlist_collection_model.dart';
// import '../presentation/providers/watchlist_new_collection_model.dart';
// import '../presentation/providers/watchlist_new_collection_provider.dart';
// import '../presentation/providers/watchlist_provider.dart';
// import '../widgets/collection_card.dart';
// import '../widgets/watchlist_newList_tile.dart';
// import 'watchlist_screen.dart';

// class WatchlistTransitionScreen extends ConsumerStatefulWidget {
//   const WatchlistTransitionScreen({super.key});

//   @override
//   ConsumerState<WatchlistTransitionScreen> createState() => _WatchlistTransitionScreenState();
// }

// class _WatchlistTransitionScreenState extends ConsumerState<WatchlistTransitionScreen> with SingleTickerProviderStateMixin {
//   // Animation controllers
//   late AnimationController _animationController;
  
//   // Screen states
//   bool _isInNewCollectionScreen = false;
  
//   // Form controllers
//   final TextEditingController _nameController = TextEditingController();
//   final FocusNode _textFieldFocusNode = FocusNode();
//   bool _isKeyboardOpen = false;
//   bool _isButtonEnabled = false;
  
//   // NewListTile position tracking
//   final GlobalKey _newListTileKey = GlobalKey();
//   Offset _startPosition = Offset.zero;
//   Offset _endPosition = Offset.zero;
//   Size _tileSize = Size.zero;
  
//   // Selection tracking
//   bool _hasSelectedItems = false;
  
//   @override
//   void initState() {
//     super.initState();
    
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );
    
//     _nameController.addListener(_checkTextField);
    
//     // Calculate positions after layout is complete
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _calculatePositions();
//       _listenKeyboardVisibility();
//     });
//   }
  
//   @override
//   void dispose() {
//     _animationController.dispose();
//     _nameController.dispose();
//     _textFieldFocusNode.dispose();
//     super.dispose();
//   }
  
//   void _checkTextField() {
//     setState(() {
//       _isButtonEnabled = _nameController.text.isNotEmpty;
//     });
//   }
  
//   void _listenKeyboardVisibility() {
//     final LifecycleEventHandler handler = LifecycleEventHandler(
//       onChange: () {
//         if (mounted) {
//           final bool isOpen = MediaQuery.of(context).viewInsets.bottom > 0;
//           setState(() {
//             _isKeyboardOpen = isOpen;
//           });
//         }
//       },
//     );
    
//     WidgetsBinding.instance.addObserver(handler);
//   }
  
//   void _calculatePositions() {
//     // Find the start position in the watchlist screen
//     final RenderBox? renderBox = _newListTileKey.currentContext?.findRenderObject() as RenderBox?;
//     if (renderBox != null) {
//       _startPosition = renderBox.localToGlobal(Offset.zero);
//       _tileSize = renderBox.size;
      
//       // Calculate the end position in new collection screen (centered)
//       final Size screenSize = MediaQuery.of(context).size;
//       _endPosition = Offset(
//         (screenSize.width - _tileSize.width) / 2,
//         100.h, // Position from top in the new collection screen
//       );
//     }
//   }
  
//   void _startTransitionToNewCollection() {
//     // Hide keyboard
//     SystemChannels.textInput.invokeMethod('TextInput.hide');
    
//     // Calculate positions before animation
//     _calculatePositions();
    
//     // Start the transition
//     setState(() {
//       _isInNewCollectionScreen = true;
//     });
    
//     _animationController.forward().then((_) {
//       // After animation completes, request focus on the text field
//       Future.delayed(const Duration(milliseconds: 300), () {
//         if (mounted) {
//           _textFieldFocusNode.requestFocus();
//         }
//       });
//     });
//   }
  
//   void _cancelTransition() {
//     // Hide keyboard
//     SystemChannels.textInput.invokeMethod('TextInput.hide');
    
//     // Reverse the animation
//     _animationController.reverse().then((_) {
//       if (mounted) {
//         setState(() {
//           _isInNewCollectionScreen = false;
//           _nameController.clear();
//         });
//       }
//     });
//   }
  
//   Future<void> _handleCreate() async {
//     // Hide keyboard
//     SystemChannels.textInput.invokeMethod('TextInput.hide');
    
//     final WalletState walletState = ref.read(walletNotifierProvider);
    
//     final WatchlistNewCollection newCollection = WatchlistNewCollection(
//       name: _nameController.text,
//       selectedTokens: walletState.selectedTokens
//           .map((int index) => walletState.allTokens[index])
//           .toList(),
//       selectedNFTs: walletState.selectedNFTs.entries
//           .expand((MapEntry<int, Set<int>> entry) => entry.value.map(
//                 (int index) => walletState.allNFTCollections[entry.key].nfts[index],
//               ))
//           .toList(),
//       creationDate: DateTime.now(),
//     );
    
//     // Add the new collection to the provider
//     ref.read(watchlistCollectionsProvider.notifier).addCollection(newCollection);
    
//     // Clear selected items
//     ref.read(walletNotifierProvider.notifier).clearSelectedTokens();
    
//     // Reverse animation to return to watchlist screen
//     await _animationController.reverse();
    
//     setState(() {
//       _isInNewCollectionScreen = false;
//       _nameController.clear();
//       _hasSelectedItems = false;
//     });
//   }
  
//   Future<void> _showSelectionSheet(BuildContext context) async {
//     final WalletState initialWalletState = ref.read(walletNotifierProvider);
//     final int initialItemCount = initialWalletState.selectedTokens.length + 
//         initialWalletState.selectedNFTs.values.fold(0, (int sum, Set<int> list) => sum + list.length);
    
//     // Show the selection sheet (similar to existing code in watchlist_new_collection.dart)
//     // This would be a simplified version of the selection sheet from watchlist_new_collection.dart
    
//     // Check if items were selected after sheet is closed
//     final WalletState currentWalletState = ref.read(walletNotifierProvider);
//     final int currentItemCount = currentWalletState.selectedTokens.length + 
//         currentWalletState.selectedNFTs.values.fold(0, (int sum, Set<int> list) => sum + list.length);
    
//     if (currentItemCount > initialItemCount) {
//       setState(() {
//         _hasSelectedItems = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Get data from providers
//     final watchlistCollections = ref.watch(watchlistProvider).collections;
//     final WalletState walletState = ref.watch(walletNotifierProvider);
    
//     // Calculate keyboard padding
//     final double keyboardPadding = MediaQuery.of(context).viewInsets.bottom;
    
//     // Get selected items for NewListTile
//     final List<Token> selectedTokens = walletState.selectedTokens
//         .map((int index) => walletState.allTokens[index])
//         .toList();
    
//     final List<NFT> selectedNFTs = walletState.selectedNFTs.entries
//         .expand((MapEntry<int, Set<int>> entry) => entry.value.map(
//               (int index) => walletState.allNFTCollections[entry.key].nfts[index],
//             ))
//         .toList();
    
//     // Animation value
//     final double animValue = _animationController.value;
    
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Watchlist Screen (visible when not in new collection mode)
//           AnimatedOpacity(
//             opacity: _isInNewCollectionScreen ? 0.0 : 1.0,
//             duration: const Duration(milliseconds: 300),
//             child: Scaffold(
//               appBar: AppBar(
//                 title: Text(
//                   'Watchlist',
//                   style: TextStyle(
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//                 centerTitle: true,
//                 backgroundColor: Colors.white,
//                 elevation: 0,
//                 actions: [
//                   Padding(
//                     padding: EdgeInsets.only(right: 6.w),
//                     child: IconButton(
//                       icon: Icon(
//                         PhosphorIconsRegular.bell,
//                         color: Colors.black,
//                         size: 22.sp,
//                       ),
//                       onPressed: () {},
//                     ),
//                   ),
//                 ],
//               ),
//               body: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Collections grid
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 20.w),
//                       child: Wrap(
//                         spacing: 16.w,
//                         runSpacing: 16.h,
//                         children: [
//                           // New List tile that we'll animate
//                           SizedBox(
//                             width: 164.w,
//                             height: 190.h,
//                             child: GestureDetector(
//                               onTap: _startTransitionToNewCollection,
//                               child: WatchlistNewListTile(
//                                 key: _newListTileKey,
//                                 selectedTokens: [],
//                                 selectedNFTs: [],
//                               ),
//                             ),
//                           ),
                          
//                           // Regular collection cards
//                           ...watchlistCollections.map((collection) => 
//                             SizedBox(
//                               width: 164.w,
//                               height: 190.h,
//                               child: CollectionCard(collection: collection),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Gap(20.h),
//                   ],
//                 ),
//               ),
//             ),
//           ),
          
//           // New Collection Screen (visible when in new collection mode)
//           IgnorePointer(
//             ignoring: !_isInNewCollectionScreen,
//             child: AnimatedOpacity(
//               opacity: _isInNewCollectionScreen ? 1.0 : 0.0,
//               duration: const Duration(milliseconds: 300),
//               child: Scaffold(
//                 backgroundColor: _isInNewCollectionScreen ? Colors.white : Colors.transparent,
//                 appBar: AppBar(
//                   leading: IconButton(
//                     icon: Icon(PhosphorIconsBold.caretLeft, size: 24.sp),
//                     onPressed: _cancelTransition,
//                   ),
//                   actions: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.only(right: 6.w),
//                       child: IconButton(
//                         icon: Icon(PhosphorIconsRegular.star, size: 24.sp),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ],
//                 ),
//                 body: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.w),
//                   child: Column(
//                     children: <Widget>[
//                       AnimatedOpacity(
//                         duration: const Duration(milliseconds: 300),
//                         opacity: animValue,
//                         child: Text(
//                           'Name Your Collection',
//                           style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                       Gap(20.h),
                      
//                       // The NewListTile will be handled by AnimatedPositioned below
//                       SizedBox(height: 190.h),
                      
//                       if (_hasSelectedItems && _isInNewCollectionScreen)
//                         Padding(
//                           padding: EdgeInsets.only(top: 8.h),
//                           child: AnimatedOpacity(
//                             duration: const Duration(milliseconds: 300),
//                             opacity: animValue,
//                             child: Text(
//                               selectedTokens.length + selectedNFTs.length == 1
//                                   ? '1 item selected'
//                                   : '${selectedTokens.length + selectedNFTs.length} items selected',
//                               style: TextStyle(
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.grey[700],
//                               ),
//                             ),
//                           ),
//                         ),
//                       Gap(20.h),
//                       AnimatedOpacity(
//                         duration: const Duration(milliseconds: 300),
//                         opacity: animValue,
//                         child: TextField(
//                           controller: _nameController,
//                           focusNode: _textFieldFocusNode,
//                           style: TextStyle(fontSize: 24.sp),
//                           decoration: const InputDecoration(
//                             hintText: 'List Name',
//                             hintStyle: TextStyle(color: AppColors.greyMedium, fontWeight: FontWeight.w600),
//                             border: InputBorder.none,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                       const Spacer(),
//                       AnimatedOpacity(
//                         duration: const Duration(milliseconds: 300),
//                         opacity: animValue,
//                         child: AnimatedPadding(
//                           duration: const Duration(milliseconds: 300),
//                           padding: EdgeInsets.only(bottom: _isKeyboardOpen ? keyboardPadding : 24.h),
//                           child: ElevatedButton(
//                             onPressed: (_isButtonEnabled && _hasSelectedItems) || (!_hasSelectedItems)
//                                 ? () async {
//                                     if (_hasSelectedItems) {
//                                       // If items are selected, create the collection
//                                       await _handleCreate();
//                                     } else {
//                                       // If no items selected, show the selection sheet
//                                       _showSelectionSheet(context);
//                                     }
//                                   }
//                                 : null,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: (_isButtonEnabled && _hasSelectedItems) || (!_hasSelectedItems)
//                                   ? Colors.black
//                                   : AppColors.greyMedium,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(40.r),
//                               ),
//                               fixedSize: Size(double.infinity, 56.w),
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 15.h),
//                               child: Text(
//                                 _hasSelectedItems ? 'Create' : 'Add Tokens',
//                                 style: TextStyle(
//                                   color: (_isButtonEnabled && _hasSelectedItems) || (!_hasSelectedItems) 
//                                       ? Colors.white 
//                                       : AppColors.greyLight,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
          
//           // Animated NewListTile that moves between screens
//           AnimatedPositioned(
//             duration: const Duration(milliseconds: 500),
//             curve: Curves.easeInOut,
//             left: _isInNewCollectionScreen 
//                 ? _startPosition.dx + (_endPosition.dx - _startPosition.dx) * animValue
//                 : _startPosition.dx,
//             top: _isInNewCollectionScreen 
//                 ? _startPosition.dy + (_endPosition.dy - _startPosition.dy) * animValue
//                 : _startPosition.dy,
//             width: _tileSize.width,
//             height: _tileSize.height,
//             child: WatchlistNewListTile(
//               selectedTokens: selectedTokens,
//               selectedNFTs: selectedNFTs,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class LifecycleEventHandler extends WidgetsBindingObserver {
//   LifecycleEventHandler({required this.onChange});
//   final VoidCallback onChange;

//   @override
//   void didChangeMetrics() {
//     onChange();
//   }
// }