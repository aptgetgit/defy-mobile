// Create this file in lib/features/watchlist/widgets/watchlist_collection_tile.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../config/theme/colors.dart';
import '../presentation/providers/watchlist_new_collection_model.dart';

class WatchlistCollectionTile extends StatelessWidget {
  final WatchlistNewCollection collection;
  final String? heroTag;  // Add this parameter
  
  const WatchlistCollectionTile({
    super.key,
    required this.collection,
    this.heroTag,  // Allow passing a hero tag
  });

  @override
  Widget build(BuildContext context) {
    // Combine tokens and NFTs for display
    final allAssets = [...collection.selectedTokens, ...collection.selectedNFTs];
    final assetCount = allAssets.length;
    
    // Wrap with Hero only if heroTag is provided
    final Widget content = Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            color: AppColors.greyVeryLight,
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.4),
          ),
          child: Stack(
            children: <Widget>[
              // Top-left asset
              if (assetCount > 0)
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(left: 30.w, bottom: 30.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: _getAssetImage(allAssets[0]),
                    ),
                  ),
                ),
              
              // Top-right asset
              if (assetCount > 1)
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(right: 30.w, bottom: 30.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: _getAssetImage(allAssets[1]),
                    ),
                  ),
                ),
              
              // Bottom-left asset
              if (assetCount > 2)
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(left: 30.w, top: 30.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: _getAssetImage(allAssets[2]),
                    ),
                  ),
                ),
              
              // Bottom-right asset
              if (assetCount > 3)
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(right: 30.w, top: 30.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: _getAssetImage(allAssets[3]),
                    ),
                  ),
                ),
            ],
          ),
        ),
        Gap(12.h),
        Text(
          collection.name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        RichText(
          text: TextSpan(
            text: assetCount == 1 ? '$assetCount item' : '$assetCount items',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
    
    return GestureDetector(
      onTap: () {
        // Navigate to collection detail screen
      },
      child: heroTag != null 
          ? Hero(tag: heroTag!, child: content) 
          : content,
    );
  }
  
  Widget _getAssetImage(dynamic asset) {
    // Handle Token type
    if (asset != null) {
      if (asset.runtimeType.toString().contains('Token')) {
        return Image.asset(
          asset.imagePath as String,
          fit: BoxFit.cover,
          height: 36,
          width: 36,
        );
      }
      
      // Handle NFT type
      if (asset.runtimeType.toString().contains('NFT')) {
        return Image.asset(
          asset.imageUrl as String,
          fit: BoxFit.cover,
          height: 36,
          width: 36,
        );
      }
    }
    
    // Fallback image
    return Image.asset(
      'assets/images/watchlist1.png',
      height: 36,
      width: 36,
      fit: BoxFit.cover,
    );
  }
}
