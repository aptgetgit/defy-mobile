import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../config/theme/colors.dart';
import '../presentation/providers/watchlist_new_collection_model.dart';
import '../presentation/watchlist_cute_nft_screen.dart';
import '../presentation/watchlist_safety_tokens_screen.dart';

class CollectionCard extends StatelessWidget {
  final WatchlistNewCollection collection;
  final VoidCallback? onTap;
  
  const CollectionCard({
    Key? key,
    required this.collection,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int itemCount = collection.selectedTokens.length + collection.selectedNFTs.length;
    
    return GestureDetector(
      onTap: onTap ?? () {
        // Navigate based on collection type
        if (collection.name.contains('NFT')) {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => WatchlistCuteNFTScreen(),
            ),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const WatchlistSafetyTokensScreen(),
            ),
          );
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Collection preview 
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.25,
              child: Stack(
                alignment: Alignment.center,
                children: _buildPreviewItems(),
              ),
            ),
            Gap(12.h),
            Text(
              collection.name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '$itemCount items',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPreviewItems() {
    final List<dynamic> items = [];
    
    // Add tokens first
    if (collection.selectedTokens.isNotEmpty) {
      items.addAll(collection.selectedTokens.take(4));
    }
    
    // Add NFTs if needed to fill remaining spots
    if (items.length < 4 && collection.selectedNFTs.isNotEmpty) {
      items.addAll(collection.selectedNFTs.take(4 - items.length));
    }
    
    // Default images if no items
    if (items.isEmpty) {
      return [
        Align(
          child: Container(
            height: 40.h,
            width: 40.w,
            margin: EdgeInsets.only(right: 30.w, bottom: 30.h),
            child: const Image(
              height: 36,
              width: 36,
              image: AssetImage('assets/images/watchlist1.png'),
            ),
          ),
        ),
        Align(
          child: Container(
            height: 40.h,
            width: 40.w,
            margin: EdgeInsets.only(left: 30.w, bottom: 30.h),
            child: const Image(
              height: 36,
              width: 36,
              image: AssetImage('assets/images/watchlist2.png'),
            ),
          ),
        ),
        Align(
          child: Container(
            height: 40.h,
            width: 40.w,
            margin: EdgeInsets.only(right: 30.w, top: 20.h),
            child: const Image(
              height: 36,
              width: 36,
              image: AssetImage('assets/images/watchlist3.png'),
            ),
          ),
        ),
        Align(
          child: Container(
            height: 40.h,
            width: 40.w,
            margin: EdgeInsets.only(left: 30.w, top: 20.h),
            child: const Image(
              height: 36,
              width: 36,
              image: AssetImage('assets/images/watchlist4.png'),
            ),
          ),
        ),
      ];
    }
    
    // Build actual items
    return List.generate(items.length.clamp(0, 4), (int index) {
      final item = items[index];
      final String imagePath = _getImagePath(item, index);
      
      return Align(
        child: Container(
          height: 40.h,
          width: 40.w,
          margin: index == 0
              ? EdgeInsets.only(right: 30.w, bottom: 30.h)
              : index == 1
                  ? EdgeInsets.only(left: 30.w, bottom: 30.h)
                  : index == 2
                      ? EdgeInsets.only(right: 30.w, top: 20.h)
                      : EdgeInsets.only(left: 30.w, top: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40.r),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: 40.w,
              height: 40.h,
            ),
          ),
        ),
      );
    });
  }
  
  String _getImagePath(dynamic item, int index) {
    // If it's a Token or NFT, use its image path
    if (item is Map && item.containsKey('imagePath')) {
      return item['imagePath'] as String;
    }
    
    // Fallback to default images
    return 'assets/images/watchlist${(index % 4) + 1}.png';
  }
}

// "Add New" collection card
class CollectionCardNew extends StatelessWidget {
  const CollectionCardNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.4),
        border: Border.all(
          color: AppColors.greyVeryLight,
          width: 1.w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_circle_outline,
            size: 40.sp,
            color: AppColors.greyLight,
          ),
          Gap(8.h),
          Text(
            "New Collection",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: AppColors.greyLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}