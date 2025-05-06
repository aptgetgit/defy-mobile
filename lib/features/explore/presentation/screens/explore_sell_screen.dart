import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_check_box.dart';
import 'explore_next_sell_screen.dart';

// Provider to track expanded state of NFT collections
final expandedCollectionsProvider = StateNotifierProvider<ExpandedCollectionsNotifier, Map<int, bool>>((ref) {
  return ExpandedCollectionsNotifier();
});

class ExpandedCollectionsNotifier extends StateNotifier<Map<int, bool>> {
  ExpandedCollectionsNotifier() : super({});
  
  void toggleExpanded(int collectionIndex) {
    final newState = Map<int, bool>.from(state);
    newState[collectionIndex] = !(state[collectionIndex] ?? true);
    state = newState;
  }
  
  bool isExpanded(int collectionIndex) {
    return state[collectionIndex] ?? true; // Default to expanded
  }
}



// Custom NFT model specific to this screen
class SellNFT {
  final String id;
  final String price;
  final String imageUrl;
  
  SellNFT({
    required this.id, 
    required this.price, 
    required this.imageUrl,
  });
}

// Custom Collection model for this screen
class SellNFTCollection {
  final String name;
  final int count;
  final List<SellNFT> nfts;
  
  SellNFTCollection({
    required this.name,
    required this.count,
    required this.nfts,
  });
}

// Provider to manage selection state
final sellSelectionProvider = StateNotifierProvider<SellSelectionNotifier, SellSelectionState>((ref) {
  return SellSelectionNotifier();
});

class SellSelectionNotifier extends StateNotifier<SellSelectionState> {
  SellSelectionNotifier() : super(SellSelectionState());

  void toggleSelectionMode() {
    state = state.copyWith(isSelectionMode: !state.isSelectionMode);
  }

  void updateSelectedCount() {
    final count = state.selectedNFTs.values.fold<int>(
      0,
      (sum, set) => sum + set.length,
    );
    state = state.copyWith(selectedCount: count);
  }

  void toggleNFTSelection(int collectionIndex, int nftIndex) {
    final selectedNFTs = Map<int, Set<int>>.from(state.selectedNFTs);
    final collectionNFTs = selectedNFTs[collectionIndex] ?? <int>{};

    if (collectionNFTs.contains(nftIndex)) {
      collectionNFTs.remove(nftIndex);
    } else {
      collectionNFTs.add(nftIndex);
    }

    if (collectionNFTs.isEmpty) {
      selectedNFTs.remove(collectionIndex);
    } else {
      selectedNFTs[collectionIndex] = collectionNFTs;
    }

    // Count total selected NFTs
    final totalSelected = selectedNFTs.values.fold<int>(0, (sum, set) => sum + set.length);

    // If none selected, exit selection mode
    state = state.copyWith(
      selectedNFTs: selectedNFTs,
      selectedCount: totalSelected,
      isSelectionMode: totalSelected > 0 ? true : false,
    );
  }
}

class SellSelectionState {
  final bool isSelectionMode;
  final int selectedCount;
  final Map<int, Set<int>> selectedNFTs;

  SellSelectionState({
    this.isSelectionMode = false,
    this.selectedCount = 0,
    this.selectedNFTs = const {},
  });

  SellSelectionState copyWith({
    bool? isSelectionMode,
    int? selectedCount,
    Map<int, Set<int>>? selectedNFTs,
  }) {
    return SellSelectionState(
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
      selectedCount: selectedCount ?? this.selectedCount,
      selectedNFTs: selectedNFTs ?? this.selectedNFTs,
    );
  }
}

class ExploreSellScreen extends ConsumerWidget {
  const ExploreSellScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Sample NFT collections specifically for sell screen
    final List<SellNFTCollection> nftCollections = [
      SellNFTCollection(
        name: 'Azuki',
        count: 5,
        nfts: List.generate(
          5,
          (index) => SellNFT(
            id: 'Azuki #${1000 + index}',
            price: '3.5 ETH',
            imageUrl: 'assets/images/nft_image1.png',
          ),
        ),
      ),
      SellNFTCollection(
        name: 'Bored Ape',
        count: 3,
        nfts: List.generate(
          3,
          (index) => SellNFT(
            id: 'Ape #${2000 + index}',
            price: '12.8 ETH',
            imageUrl: 'assets/images/nft_image1.png',
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('Sell NFTs'),
            Gap(4.h),
            Text(
              '1021 owned',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.greyDark,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(8.h),
          child: Column(
            children: [
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
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: nftCollections.length,
        itemBuilder: (context, index) {
          return _buildNFTCollectionItem(ref, index, nftCollections[index]);
        },
      ),
      bottomNavigationBar: Container(
        height: 100.h, // Adjust height based on content
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
          border: Border(
            top: BorderSide(
              color: AppColors.greyVeryLight,
              width: 1.h,
            ),
          ),
        ),
        child: Consumer(
          builder: (context, ref, child) {
            final selectionState = ref.watch(sellSelectionProvider);
            final selectedCount = selectionState.selectedCount;

            // Show one button initially, two buttons side by side in selection mode
            if (!selectionState.isSelectionMode) {
              // Initial state - only show "Select NFT" button
              return ElevatedButton(
                onPressed: () {
                  ref.read(sellSelectionProvider.notifier).toggleSelectionMode();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.black,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                ),
                child: Text(
                  'Select NFT',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            } else {
              // Selection mode - show Sell and List buttons side by side
              return Row(
                children: [
                  // Sell button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: selectedCount > 0 ? () {
                        final selectedNFTs = <Map<String, dynamic>>[];

                        // Collect selected NFTs
                        for (final entry in selectionState.selectedNFTs.entries) {
                          final collectionIndex = entry.key;
                          final nftIndexes = entry.value;
                          final collection = nftCollections[collectionIndex];
                          for (final nftIndex in nftIndexes) {
                            final nft = collection.nfts[nftIndex];
                            selectedNFTs.add({
                              'id': nft.id,
                              'price': nft.price,
                              'imageUrl': nft.imageUrl,
                            });
                          }
                        }

                        if (selectedNFTs.isNotEmpty) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => NextSellScreen(
                                selectedNFT: selectedNFTs.first,
                                allSelectedNFTs: selectedNFTs,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please select at least one NFT to sell')),
                          );
                        }
                      } : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.black,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        // Disable button when no items selected
                        disabledBackgroundColor: AppColors.black.withOpacity(0.3),
                      ),
                      child: Text(
                        'Sell',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Gap(10.w),
                  // List button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: selectedCount > 0 ? () {
                        // Implement List functionality here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('List functionality to be implemented')),
                        );
                      } : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.black,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        // Disable button when no items selected
                        disabledBackgroundColor: AppColors.black.withOpacity(0.3),
                      ),
                      child: Text(
                        'List',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildNFTCollectionItem(WidgetRef ref, int collectionIndex, SellNFTCollection collection) {
    final isExpanded = ref.watch(expandedCollectionsProvider)[collectionIndex] ?? true;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Gap(12.h),
          // Collection Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: const AssetImage('assets/images/nft_image1.png'),
                    radius: 14.r,
                  ),
                  Gap(8.w),
                  Text(
                    collection.name,
                    style: TextStyle(
                      fontSize: 18.sp, 
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    collection.count.toString(),
                    style: TextStyle(
                      fontSize: 16.sp, 
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton( 
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerRight,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      ref.read(expandedCollectionsProvider.notifier).toggleExpanded(collectionIndex);
                    },
                    icon: Icon(
                      isExpanded ? PhosphorIconsBold.caretDown : PhosphorIconsBold.caretUp,
                      size: 16.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(6.h),
          _buildNFTGrid(ref, collectionIndex, collection, isExpanded),
        ],
      ),
    );
  }

  // Custom NFT grid specifically for sell screen
  Widget _buildNFTGrid(WidgetRef ref, int collectionIndex, SellNFTCollection collection, bool isExpanded) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: isExpanded
          ? (collection.nfts.length / 2).ceil() * 240.h
          : 0,
      child: ClipRect(
        child: AnimatedOpacity(
          opacity: isExpanded ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            width: double.infinity,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.w,
                mainAxisSpacing: 16.h,
                mainAxisExtent: 240.h,
              ),
              itemCount: collection.nfts.length,
              itemBuilder: (BuildContext context, int nftIndex) {
                final SellNFT nft = collection.nfts[nftIndex];
                return SellNFTItem(
                  nft: nft,
                  collectionIndex: collectionIndex,
                  nftIndex: nftIndex,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// Custom NFT item widget specifically for sell screen
class SellNFTItem extends ConsumerWidget {
  final SellNFT nft;
  final int collectionIndex;
  final int nftIndex;
  
  const SellNFTItem({
    Key? key, 
    required this.nft,
    required this.collectionIndex,
    required this.nftIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectionState = ref.watch(sellSelectionProvider);
    final isSelected = selectionState.selectedNFTs[collectionIndex]?.contains(nftIndex) ?? false;
    final isSelectionMode = selectionState.isSelectionMode;
    
    return GestureDetector(
      onTap: () {
        if (isSelectionMode) {
          ref.read(sellSelectionProvider.notifier).toggleNFTSelection(collectionIndex, nftIndex);
        } else {
          // Navigation logic can be implemented here
        }
      },
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              // NFT Image with Hero animation
              Hero(
                tag: 'nft-image-${nft.id}',
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(16.r),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.85, end: 1.0),
                      duration: const Duration(milliseconds: 400),
                      builder: (context, opacity, child) {
                        return Opacity(
                          opacity: opacity,
                          child: child,
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        child: Image.asset(
                          nft.imageUrl,
                          width: 168.h,
                          height: 168.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              // Selection checkbox
              if (isSelectionMode)
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: CustomCheckbox(
                    isChecked: isSelected,
                    isRound: true,
                    onTap: () {
                      ref.read(sellSelectionProvider.notifier).toggleNFTSelection(collectionIndex, nftIndex);
                    },
                  ),
                ),
            ],
          ),
          
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nft.id,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                Gap(4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Floor',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.greyLight,
                      ),
                    ),
                    Gap(6.w),
                    Text(
                      nft.price,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.greyLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder for the next screen
