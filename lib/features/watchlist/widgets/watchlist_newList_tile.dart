import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../wallet/data/models/nft_model.dart';
import '../../wallet/data/models/token_model.dart';
import '../../wallet/presentation/providers/wallet_provider.dart';
import '../../wallet/presentation/providers/wallet_state.dart';

class WatchlistNewListTile extends ConsumerWidget {
  const WatchlistNewListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the selected tokens from the wallet provider
    final WalletState walletState = ref.watch(walletNotifierProvider);
    final Set<int> selectedTokenIndices = walletState.selectedTokens;
    final List<Token> selectedTokens = selectedTokenIndices
        .map((index) => walletState.allTokens[index])
        .toList();
    
    // Access selected NFTs if any
    final Map<int, List<int>> selectedNFTIndices = walletState.selectedNFTs.cast<int, List<int>>();
    final List<NFT> selectedNFTs = [];
    
    selectedNFTIndices.forEach((collectionIndex, nftIndices) {
      for (final int nftIndex in nftIndices) {
        if (collectionIndex < walletState.allNFTCollections.length && 
            nftIndex < walletState.allNFTCollections[collectionIndex].nfts.length) {
          selectedNFTs.add(walletState.allNFTCollections[collectionIndex].nfts[nftIndex]);
        }
      }
    });
    
    // Combine tokens and NFTs into a single assets list (up to 4)
    final List<dynamic> assetsToShow = [];
    if (selectedTokens.isNotEmpty) {
      assetsToShow.addAll(selectedTokens.take(4));
    }
    
    if (assetsToShow.length < 4 && selectedNFTs.isNotEmpty) {
      assetsToShow.addAll(selectedNFTs.take(4 - assetsToShow.length));
    }
    
    return SizedBox(
      width: 164.w,
      height: 164.h,
      child: CustomPaint(
        painter: DashedCirclePainter(),
        child: assetsToShow.isEmpty 
        ? _buildEmptyState() 
        : _buildWithSelectedAssets(assetsToShow),
      ),
    );
  }
  
  Widget _buildEmptyState() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          PhosphorIcons.listPlus(),
          size: 48.sp,
          color: Colors.grey,
        ),
        SizedBox(height: 2.h),
        Text(
          'New List',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
      ],
    );
  
  Widget _buildWithSelectedAssets(List<dynamic> assets) {
    // Cap at 4 assets to display
    final List itemsToShow = assets.take(4).toList();
    final int itemCount = itemsToShow.length;
    
    return Stack(
      alignment: Alignment.center,
      children: [
        // Display selected assets in a 2x2 grid pattern
        if (itemCount >= 1)
          Align(
            // top: 30.h,
            // left: 30.w,
            child: _buildAssetIcon(itemsToShow[0], 1),
          ),
        if (itemCount >= 2)
          Align(
            // top: 30.h,
            // right: 30.w,
            child: _buildAssetIcon(itemsToShow[1], 2),
          ),
        if (itemCount >= 3)
          Align(
            // bottom: 30.h,
            // left: 30.w,
            child: _buildAssetIcon(itemsToShow[2], 3),
          ),
        if (itemCount >= 4)
          Align(
            // bottom: 30.h,
            // right: 30.w,
            child: _buildAssetIcon(itemsToShow[3], 4),
          ),
        
      ],
    );
  }
  
  Widget _buildAssetIcon(dynamic asset, int itemCount) {
    // Handle Token type
    if (asset is Token) {
      return Container(
        height: 40.h,
        width: 40.w,
        margin: itemCount == 1
          ? EdgeInsets.only(left: 30.w, bottom: 30.h)
          : itemCount == 2
            ? EdgeInsets.only(right: 30.w, top: 20.h)
            : itemCount == 3
              ? EdgeInsets.only(left: 30.w, top: 20.h)
              : EdgeInsets.only(right: 30.w, bottom: 30.h),
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
          child: Image.asset(
            asset.imagePath,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    
    // Handle NFT type
    if (asset is NFT) {
      return Container(
        height: 40.h,
        width: 40.w,
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
          child: Image.asset(
            asset.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    
    // Fallback for other types
    return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Icon(
        Icons.help_outline,
        color: Colors.grey[700],
        size: 20.sp,
    ),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double dashWidth = 8;
    const double dashSpace = 4;
    final Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    final double radius = size.width / 2;
    const double circumference = 2 * 3.141592653589793 * 82; // Approximate circle circumference

    double distance = 0;
    while (distance < circumference) {
      path.addArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        distance / radius,
        dashWidth / radius,
      );
      distance += dashWidth + dashSpace;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
